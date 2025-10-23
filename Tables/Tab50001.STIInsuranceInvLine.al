table 50001 "STI Insurance Line"
{
    Caption = 'Insurance Invoice Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Premium Line No."; Code[20])
        {
            Caption = 'Premium No.';
            TableRelation = "STI Insurance Header"."Premium No.";
            DataClassification = ToBeClassified;
        }

        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }

/* 
    Here well get back after creating the insutance product mas
    ter table to link to.
    filds affected 3,4 and 5

*/ 
        field(3; "Product Code"; Code[20])
        {
            Caption = 'Product Code';
            TableRelation = "STI Product Master"."Product Code";
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                ItemRec: Record "STI Product Master";
            begin
                if ItemRec.Get("Product Code") then begin
                    "Product Description" := ItemRec.Description;
                    "Unit Price" := ItemRec."Unit Price";
                end;
            end;
        }

        field(4; "Product Description"; Text[100])
        {
            Caption = 'Description';
            Editable = false;
        }
        field(5; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                CalcLineAmount();
            end;
        }
        field(6; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                CalcLineAmount();
            end;
        }

        field(7; "Line Amount"; Decimal)
        {
            Caption = 'Line Amount';
            Editable = false;
            DataClassification = ToBeClassified;
        }

        field(8; "Created By"; Code[50])
        {
            Caption = 'Created By';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(9; "Created DateTime"; DateTime)
        {
            Caption = 'Created DateTime';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(10; "Modified By"; Code[50])
        {
            Caption = 'Modified By';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(11; "Modified DateTime"; DateTime)
        {
            Caption = 'Modified DateTime';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        // Missing from Meeting 01 - Product effective dates
        field(12; "Effective Date"; Date)
        {
            Caption = 'Effective Date';
            DataClassification = ToBeClassified;
        }

        field(13; "Expiry Date"; Date)
        {
            Caption = 'Expiry Date';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Premium Line No.", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        Header: Record "STI Insurance Header";
        UserSetup: Record "User Setup";
    begin
        if UserSetup.Get(UserId()) then
            "Created By" := UserSetup."User ID";
        "Created DateTime" := CurrentDateTime();
        "Modified By" := UserSetup."User ID";
        "Modified DateTime" := CurrentDateTime();

        // Update Header total after inserting
        if Header.Get("Premium Line No.") then begin
            UpdateHeaderTotal(Header);
        end;
    end;

    trigger OnModify()
    var
        Header: Record "STI Insurance Header";
        UserSetup: Record "User Setup";
    begin
        if UserSetup.Get(UserId()) then
            "Modified By" := UserSetup."User ID";
        "Modified DateTime" := CurrentDateTime();

        if Header.Get("Premium Line No.") then
            UpdateHeaderTotal(Header);
    end;

    trigger OnDelete()
    var
        Header: Record "STI Insurance Header";
    begin
        if Header.Get("Premium Line No.") then
            UpdateHeaderTotal(Header);
    end;

    local procedure CalcLineAmount()
    begin
        "Line Amount" := Round(Quantity * "Unit Price", 0.01);
    end;

    local procedure UpdateHeaderTotal(var Header: Record "STI Insurance Header")
    var
        LineRec: Record "STI Insurance Line";
        TotalAmt: Decimal;
    begin
        TotalAmt := 0;
        LineRec.SetRange("Premium Line No.", Header."Premium No.");
        if LineRec.FindSet() then
            repeat
                TotalAmt += LineRec."Line Amount";
            until LineRec.Next() = 0;

        Header."Premium Amount" := TotalAmt;
        Header.Modify(true);
    end;
}
