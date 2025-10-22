table 50000 "STI Premium Header"
{
    Caption = 'Premium Invoice Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Premium No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                if "Premium No." <> xRec."Premium No." then begin
                    PurchasesPayablesSetup.Get();
                    NoSeriesMgt.TestManual(PurchasesPayablesSetup."STI");
                    "Premium No." := '';
                end;
            end;
        }

        field(2; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = ToBeClassified;
        }

        field(3; "Document Date"; Date)
        {
            Caption = 'Document Date';
            DataClassification = ToBeClassified;
        }

        field(4; Status; Enum "STIStatusenum")
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(5; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer."No.";
            DataClassification = ToBeClassified;
        }

        field(6; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field("Customer No.")));
            Editable = false;
        }

        field(7; "Policy No."; Code[30])
        {
            Caption = 'Policy No.';
            DataClassification = ToBeClassified;
        }

        field(8; "Premium Amount"; Decimal)
        {
            Caption = 'Total Premium';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(9; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency.Code;
            DataClassification = ToBeClassified;
        }

        field(10; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Description = 'Numbering series for Premium Invoices';
            DataClassification = ToBeClassified;
        }


        field(11; "CLAPi Ref. No."; Code[30])
        {
            Caption = 'CLAPi Reference No.';
            Description = 'Unique reference received from CLAPi system';
            DataClassification = ToBeClassified;
        }

        field(12; "Approval Status"; Option)
        {
            Caption = 'Approval Status';
            OptionMembers = Open,"Pending Approval",Approved,Rejected;
            OptionCaption = 'Open,Pending Approval,Approved,Rejected';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(13; "Created By"; Code[50])
        {
            Caption = 'Created By';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(14; "Created DateTime"; Date)
        {
            Caption = 'Created DateTime';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(15; "Modified By"; Code[50])
        {
            Caption = 'Modified By';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(16; "Modified DateTime"; Date)
        {
            Caption = 'Modified DateTime';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(17; "Posting Description"; Text[250])
        {
            Caption = 'Posting Description';
            DataClassification = ToBeClassified;
        }

        field(18; "Reinsurance Type"; Option)
        {
            Caption = 'Reinsurance Type';
            OptionMembers = "",Treaty,Facultative;
            OptionCaption = 'None,Treaty,Facultative';
            DataClassification = ToBeClassified;
        }

        field(19; "Contract Type"; Code[20])
        {
            Caption = 'Contract Type';
            DataClassification = ToBeClassified;
        }
        // Missing from Meeting 02 - Finance Integration
        field(20; "Enforced"; Boolean)
        {
            Caption = 'Enforced';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(21; "Invoice No."; Code[20])
        {
            Caption = 'Invoice No.';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Premium No.")
        {
            Clustered = true;
        }
    }

    var
        StatusChanged: Boolean;


    trigger OnInsert()
    var
        userSetup: Record "User Setup";
    begin
        if "Premium No." = '' then begin
            PurchasesPayablesSetup.Get();
            PurchasesPayablesSetup.TestField("STI");
            "No. Series" := PurchasesPayablesSetup."STI";
            "Premium No." := NoSeriesMgt.GetNextNo("No. Series", Today(), true);
            "Created DateTime" := Today();
            Status := Status::Open;
        end;

        if userSetup.Get(UserId()) then
            "Created By" := userSetup."User ID";


    end;


    var
        NoSeriesMgt: Codeunit "No. Series";

        PurchasesPayablesSetup: Record "Purchases & Payables Setup";

    procedure GetNoSeriesRelCode(NoSeriesCode: Code[20]): Code[10]
    var

        NoSrsRel: Record "No. Series Relationship";
    begin
        exit(GetNoSeriesRelCode(NoSeriesCode));


    end;


    trigger OnModify()
    var
        userSetup: Record "User Setup";
    begin
        if xRec.Status <> Rec.Status then
            StatusChanged := true;

        if StatusChanged then begin
            StatusChanged := false;
        end;

        if userSetup.Get(UserId()) then begin
            "Modified By" := userSetup."User ID";
            "Modified DateTime" := Today();
        end;
    end;

}
