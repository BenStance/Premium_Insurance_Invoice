table 50303 "STI Agent/Broker Master"
{
    Caption = 'Agent/Broker Master';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Agent/Broker No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
            Editable = false;

            trigger OnValidate()
            begin
                if "Agent/Broker No." <> xRec."Agent/Broker No." then begin
                    SalesSetup.Get();
                    NoSeriesMgt.TestManual(SalesSetup."STI Agent/Broker Nos.");
                    "Agent/Broker No." := '';
                end;
            end;
        }

        field(2; Name; Text[100])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }

        field(3; Type; Option)
        {
            Caption = 'Type';
            OptionMembers = Agent,Broker;
            OptionCaption = 'Agent,Broker';
            DataClassification = CustomerContent;
        }

        field(4; "TIN No."; Code[30])
        {
            Caption = 'TIN Number';
            DataClassification = CustomerContent;
        }

        field(5; "Registration No."; Code[30])
        {
            Caption = 'Registration Number';
            DataClassification = CustomerContent;
        }

        field(6; "Phone No."; Text[30])
        {
            Caption = 'Phone Number';
            DataClassification = CustomerContent;
        }

        field(7; Email; Text[100])
        {
            Caption = 'Email';
            DataClassification = CustomerContent;
        }

        field(8; Address; Text[100])
        {
            Caption = 'Address';
            DataClassification = CustomerContent;
        }

        field(9; City; Text[50])
        {
            Caption = 'City';
            DataClassification = CustomerContent;
        }

        field(10; Country; Code[10])
        {
            Caption = 'Country/Region';
            TableRelation = "Country/Region".Code;
            DataClassification = CustomerContent;
        }

        field(11; "Commission %"; Decimal)
        {
            Caption = 'Default Commission (%)';
            DataClassification = CustomerContent;
            MinValue = 0;
            MaxValue = 100;
        }

        field(12; "Bank Account No."; Code[30])
        {
            Caption = 'Bank Account Number';
            DataClassification = CustomerContent;
        }

        field(13; "Bank Name"; Text[100])
{
    Caption = 'Bank Name';
    DataClassification = CustomerContent;
}

        field(14; "CLAPi Ref. No."; Code[30])
        {
            Caption = 'CLAPi Reference No.';
            Description = 'Unique mapping reference from CLAPi system';
            DataClassification = CustomerContent;
        }

        field(15; "Status"; Option)
        {
            Caption = 'Status';
            OptionMembers = Active,Inactive;
            OptionCaption = 'Active,Inactive';
            DataClassification = CustomerContent;
        }

        field(16; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Description = 'Numbering series for Agents/Brokers';
            DataClassification = SystemMetadata;
        }

        field(17; "Created By"; Code[50])
        {
            Caption = 'Created By';
            DataClassification = SystemMetadata;
            Editable = false;
        }

        field(18; "Created DateTime"; DateTime)
        {
            Caption = 'Created DateTime';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(19; "Modified By"; Code[50])
        {
            Caption = 'Modified By';
            DataClassification = SystemMetadata;
            Editable = false;
        }

        field(20; "Modified DateTime"; DateTime)
        {
            Caption = 'Modified DateTime';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        // Missing from Meeting 01 - Channel Partner details



field(21; "Address 2"; Text[50])
{
    Caption = 'Address 2';
    DataClassification = CustomerContent;
}

// Missing from Meeting 06 - Financial integration
field(22; "Vendor No."; Code[20])
{
    Caption = 'Vendor No.';
    TableRelation = Vendor."No.";
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

// Missing - Enhanced commission structure
field(23; "Max Commission %"; Decimal)
{
    Caption = 'Maximum Commission %';
    DataClassification = CustomerContent;
    MinValue = 0;
    MaxValue = 100;
}

field(24; "Effective Date"; Date)
{
    Caption = 'Effective Date';
    DataClassification = CustomerContent;
}

field(25; "Expiry Date"; Date)
{
    Caption = 'Expiry Date';
    DataClassification = CustomerContent;
}
field(26; "Contact Person"; Text[100])
{
    Caption = 'Contact Person';
    DataClassification = CustomerContent;
}

field(27; "Post Code"; Code[20])
{
    Caption = 'Post Code';
    DataClassification = CustomerContent;
}


    }

    keys
    {
        key(PK; "Agent/Broker No.")
        {
            Clustered = true;
        }
    }

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit "No. Series";

    trigger OnInsert()
    var
        UserSetup: Record "User Setup";
    begin
        if "Agent/Broker No." = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField("STI Agent/Broker Nos.");
            "No. Series" := SalesSetup."STI Agent/Broker Nos.";
            "Agent/Broker No." := NoSeriesMgt.GetNextNo("No. Series", Today(), true);
        end;

        if UserSetup.Get(UserId()) then
            "Created By" := UserSetup."User ID";
        "Created DateTime" := CurrentDateTime();
        Status := Status::Active;
    end;

    // trigger OnModify()
    // var
    //     UserSetup: Record "User Setup";
    // begin
    //     if UserSetup.Get(UserId()) then
    //         "Modified By" := UserSetup."User ID";
    //     "Modified DateTime" := CurrentDateTime();
    // end;
}
