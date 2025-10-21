table 50305 "STI Reinsurance Partner Master"
{
    Caption = 'Reinsurance Partner Master';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Partner No."; Code[20])
        {
            Caption = 'Partner No.';
            DataClassification = CustomerContent;
            Editable = false;

            trigger OnValidate()
            begin
                if "Partner No." <> xRec."Partner No." then begin
                    PurchasesPayablesSetup.Get();
                    NoSeriesMgt.TestManual(PurchasesPayablesSetup."STI Reinsurance Partner Nos.");
                    "Partner No." := '';
                end;
            end;
        }

        field(2; Name; Text[100])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if (Name <> '') and ("Search Name" = UpperCase(xRec.Name)) then
                    "Search Name" := Name;
            end;
        }

        field(3; "Search Name"; Code[100])
        {
            Caption = 'Search Name';
            DataClassification = CustomerContent;
        }

        field(4; Address; Text[100])
        {
            Caption = 'Address';
            DataClassification = CustomerContent;
        }

        field(5; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
            DataClassification = CustomerContent;
        }

        field(6; City; Text[30])
        {
            Caption = 'City';
            DataClassification = CustomerContent;
        }

        field(7; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
            DataClassification = CustomerContent;
        }

        field(8; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            DataClassification = CustomerContent;
        }

        field(9; "Contact Person"; Text[50])
        {
            Caption = 'Contact Person';
            DataClassification = CustomerContent;
        }

        field(10; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            DataClassification = CustomerContent;
        }

        field(11; "Email"; Text[80])
        {
            Caption = 'Email';
            DataClassification = CustomerContent;
        }

        field(12; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = Vendor;
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                VendorRec: Record Vendor;
            begin
                if VendorRec.Get("Vendor No.") then begin
                    "Bank Account No." := VendorRec."Bank Account No.";
                    "Bank Name" := VendorRec."Bank Name";
                end;
            end;
        }

        field(13; "Reinsurance Type"; Option)
        {
            Caption = 'Reinsurance Type';
            OptionMembers = Treaty,Facultative,"Both";
            OptionCaption = 'Treaty,Facultative,Both';
            DataClassification = CustomerContent;
        }

        field(14; "Treaty Type"; Option)
        {
            Caption = 'Treaty Type';
            OptionMembers = " ","Proportional","Non-Proportional";
            OptionCaption = ' ,Proportional,Non-Proportional';
            DataClassification = CustomerContent;
        }

        field(15; "Effective Date"; Date)
        {
            Caption = 'Effective Date';
            DataClassification = CustomerContent;
        }

        field(16; "Expiry Date"; Date)
        {
            Caption = 'Expiry Date';
            DataClassification = CustomerContent;
        }

        field(17; "Participation %"; Decimal)
        {
            Caption = 'Participation %';
            DataClassification = CustomerContent;
            MinValue = 0;
            MaxValue = 100;
        }

        field(18; "Commission %"; Decimal)
        {
            Caption = 'Commission %';
            DataClassification = CustomerContent;
            MinValue = 0;
            MaxValue = 100;
        }

        field(19; "Bank Account No."; Text[30])
        {
            Caption = 'Bank Account No.';
            DataClassification = CustomerContent;
        }

        field(20; "Bank Name"; Text[100])
        {
            Caption = 'Bank Name';
            DataClassification = CustomerContent;
        }

        field(21; "Status"; Option)
        {
            Caption = 'Status';
            OptionMembers = Active,Inactive,"Pending Approval";
            OptionCaption = 'Active,Inactive,Pending Approval';
            DataClassification = CustomerContent;
        }

        field(22; "CLAPi Partner ID"; Code[30])
        {
            Caption = 'CLAPi Partner ID';
            DataClassification = CustomerContent;
        }

        field(23; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = SystemMetadata;
        }

        field(24; "Created By"; Code[50])
        {
            Caption = 'Created By';
            DataClassification = SystemMetadata;
            Editable = false;
        }

        field(25; "Created DateTime"; DateTime)
        {
            Caption = 'Created DateTime';
            DataClassification = SystemMetadata;
            Editable = false;
        }

        field(26; "Modified By"; Code[50])
        {
            Caption = 'Modified By';
            DataClassification = SystemMetadata;
            Editable = false;
        }

        field(27; "Modified DateTime"; DateTime)
        {
            Caption = 'Modified DateTime';
            DataClassification = SystemMetadata;
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Partner No.")
        {
            Clustered = true;
        }
        key(Search; "Search Name")
        {
        }
        key(Status; Status)
        {
        }
        key(Vendor; "Vendor No.")
        {
        }
    }

    trigger OnInsert()
    var
        UserSetup: Record "User Setup";
    begin
        PurchasesPayablesSetup.Get();
        if "Partner No." = '' then begin
            PurchasesPayablesSetup.Get();
            PurchasesPayablesSetup.TestField("STI Reinsurance Partner Nos.");
            "No. Series" := PurchasesPayablesSetup."STI Reinsurance Partner Nos.";
            "Partner No." := NoSeriesMgt.GetNextNo("No. Series", Today(), true);
        end;

        if "Search Name" = '' then
            "Search Name" := Name;

        if UserSetup.Get(UserId()) then
            "Created By" := UserSetup."User ID";
        "Created DateTime" := CurrentDateTime();       
        Status := Status::Active;
    end;

    trigger OnModify()
    var
        UserSetup: Record "User Setup";
    begin
        if UserSetup.Get(UserId()) then
            "Modified By" := UserSetup."User ID";
        "Modified DateTime" := CurrentDateTime();
    end;

    trigger OnRename()
    begin
        Error('Renaming of reinsurance partners is not allowed.');
    end;

    var
        PurchasesPayablesSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit "No. Series";
}