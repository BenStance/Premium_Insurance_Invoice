table 50011 "STI Product Master"
{
    Caption = 'Insurance Product Master';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Product Code"; Code[20])
        {
            Caption = 'Product Code';
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                if "Product Code" <> xRec."Product Code" then begin
                    InventorySetup.Get();
                    NoSeriesMgt.TestManual(InventorySetup."STI Product No.");
                    "Product Code" := '';
                end;
            end;
        }

        field(2; "Product Name"; Text[100])
        {
            Caption = 'Product Name';
            DataClassification = ToBeClassified;

            
        }

        field(3; "Search Name"; Code[100])
        {
            Caption = 'Search Name';
            DataClassification = ToBeClassified;
        }

        field(4; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }

        field(5; "Product Type"; Enum "STIProductTypeEnum")
        {
            Caption = 'Product Type';
            DataClassification = ToBeClassified;
        }

        field(6; "Product Category"; Code[20])
        {
            Caption = 'Product Category';
            DataClassification = ToBeClassified;
        }

        field(7; "GL Account No."; Code[20])
        {
            Caption = 'GL Account No.';
            TableRelation = "G/L Account";
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                GLAccount: Record "G/L Account";
            begin
               // the logic itakaa apa ya kumap GL na Product
            end;
        }

        field(8; "GL Account Name"; Text[100])
        {
            Caption = 'GL Account Name';
            Editable = false;
            DataClassification = ToBeClassified;
        }

        field(9; "Premium GL Account"; Code[20])
        {
            Caption = 'Premium Income GL Account';
            TableRelation = "G/L Account";
            DataClassification = ToBeClassified;
        }

        field(10; "Commission GL Account"; Code[20])
        {
            Caption = 'Commission Expense GL Account';
            TableRelation = "G/L Account";
            DataClassification = ToBeClassified;
        }

        field(11; "Claims GL Account"; Code[20])
        {
            Caption = 'Claims Expense GL Account';
            TableRelation = "G/L Account";
            DataClassification = ToBeClassified;
        }

        field(12; "Default Premium Rate"; Decimal)
        {
            Caption = 'Default Premium Rate';
            DataClassification = ToBeClassified;
            MinValue = 0;
        }

        field(13; "Minimum Premium"; Decimal)
        {
            Caption = 'Minimum Premium';
            DataClassification = ToBeClassified;
            MinValue = 0;
        }

        field(14; "Maximum Sum Insured"; Decimal)
        {
            Caption = 'Maximum Sum Insured';
            DataClassification = ToBeClassified;
            MinValue = 0;
        }

        field(15; "Policy Term"; Integer)
        {
            Caption = 'Policy Term (Months)';
            DataClassification = ToBeClassified;
            MinValue = 0;
        }

        field(16; "Renewal Period"; Integer)
        {
            Caption = 'Renewal Period (Days)';
            DataClassification = ToBeClassified;
            MinValue = 0;
        }

        field(17; "Underwriting Limit"; Decimal)
        {
            Caption = 'Underwriting Limit';
            DataClassification = ToBeClassified;
            MinValue = 0;
        }

        field(18; "Commission Rate %"; Decimal)
        {
            Caption = 'Default Commission Rate %';
            DataClassification = ToBeClassified;
            MinValue = 0;
            MaxValue = 100;
        }

        field(19; "Reinsurance Required"; Boolean)
        {
            Caption = 'Reinsurance Required';
            DataClassification = ToBeClassified;
        }

        field(20; "Reinsurance Type"; Option)
        {
            Caption = 'Default Reinsurance Type';
            OptionMembers = "None","Treaty","Facultative";
            OptionCaption = 'None,Treaty,Facultative';
            DataClassification = ToBeClassified;
        }

        field(21; "CLAPi Product ID"; Code[30])
        {
            Caption = 'CLAPi Product ID';
            DataClassification = ToBeClassified;
        }

        field(22; "Effective Date"; Date)
        {
            Caption = 'Effective Date';
            DataClassification = ToBeClassified;
        }

        field(23; "Expiry Date"; Date)
        {
            Caption = 'Expiry Date';
            DataClassification = ToBeClassified;
        }

        field(24; "Created By"; Code[50])
        {
            Caption = 'Created By';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(25; "Created DateTime"; DateTime)
        {
            Caption = 'Created DateTime';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(26; "Modified By"; Code[50])
        {
            Caption = 'Modified By';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(27; "Modified DateTime"; DateTime)
        {
            Caption = 'Modified DateTime';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(28; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
        }
        field(29; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            DataClassification = ToBeClassified;
            MinValue = 0;
        }
    }

    keys
    {
        key(PK; "Product Code")
        {
            Clustered = true;
        }
        key(Search; "Search Name")
        {
        }
        key(ProductType; "Product Type")
        {
        }
        key(GLAccount; "GL Account No.")
        {
        }
    }

   trigger OnInsert()
    var
        userSetup: Record "User Setup";
    begin
        if "Product Code" = '' then begin
            InventorySetup.Get();
            InventorySetup.TestField("STI Product No.");
            "No. Series" := InventorySetup."STI Product No.";
            "Product Code" := NoSeriesMgt.GetNextNo("No. Series", Today(), true);

        if "Search Name" = '' then
            "Search Name" := "Product Name";

        if UserSetup.Get(UserId()) then
            "Created By" := UserSetup."User ID";
        "Created DateTime" := CurrentDateTime();
        
        //initial assignment of Modified fields on insert
        "Modified By" := "Created By";
        "Modified DateTime" := "Created DateTime";
        
        end;
    end;

    trigger OnModify()
    var
        UserSetup: Record "User Setup";
    begin
        if UserSetup.Get(UserId()) then
            "Modified By" := UserSetup."User ID";
        "Modified DateTime" := CurrentDateTime();
    end;

    var
        InventorySetup: Record "Inventory Setup";
        NoSeriesMgt: Codeunit "No. Series";
}