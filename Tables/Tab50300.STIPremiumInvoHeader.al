table 50300 "STI Premium Header"
{
    Caption = 'Premium Invoice Header';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Premium No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
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
            DataClassification = CustomerContent;
        }

        // field(3; "Document Date"; Date)
        // {
        //     Caption = 'Document Date';
        //     DataClassification = CustomerContent;
        // }

        field(4; Status; Enum "STIStatusenum")
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(5; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer."No.";
            DataClassification = CustomerContent;
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
            DataClassification = CustomerContent;
        }

        field(8; "Premium Amount"; Decimal)
        {
            Caption = 'Total Premium';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(9; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency.Code;
            DataClassification = CustomerContent;
        }

        field(10; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Description = 'Numbering series for Premium Invoices';
            DataClassification = SystemMetadata;
        }

        // field(11; "Description"; Text[250])
        // {
        //     Caption = 'Description';
        //     DataClassification = CustomerContent;
        // }

        field(12; "CLAPi Ref. No."; Code[30])
        {
            Caption = 'CLAPi Reference No.';
            Description = 'Unique reference received from CLAPi system';
            DataClassification = CustomerContent;
        }

        field(13; "Approval Status"; Option)
        {
            Caption = 'Approval Status';
            OptionMembers = Open,"Pending Approval",Approved,Rejected;
            OptionCaption = 'Open,Pending Approval,Approved,Rejected';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(14; "Created By"; Code[50])
        {
            Caption = 'Created By';
            DataClassification = SystemMetadata;
            Editable = false;
        }

        field(15; "Created DateTime"; Date)
        {
            Caption = 'Created DateTime';
            DataClassification = SystemMetadata;
            Editable = false;
        }

        field(16; "Modified By"; Code[50])
        {
            Caption = 'Modified By';
            DataClassification = SystemMetadata;
            Editable = false;
        }

        field(17; "Modified DateTime"; Date)
        {
            Caption = 'Modified DateTime';
            DataClassification = SystemMetadata;
            Editable = false;
        }

        field(18; "Posting Description"; Text[250])
        {
            Caption = 'Posting Description';
            DataClassification = CustomerContent;
        }

        field(19; "Reinsurance Type"; Option)
        {
            Caption = 'Reinsurance Type';
            OptionMembers = None,Treaty,Facultative;
            OptionCaption = 'None,Treaty,Facultative';
            DataClassification = CustomerContent;
        }

        // field(20; "Integration Status"; Option)
        // {
        //     Caption = 'Integration Status';
        //     OptionMembers = "Not Sent","Pending","Sent","Error";
        //     OptionCaption = 'Not Sent,Pending,Sent,Error';
        //     DataClassification = CustomerContent;
        //     Editable = false;
        // }
        // Missing from Meeting 01 - Underwriting Process
        field(21; "Contract Type"; Code[20])
        {
            Caption = 'Contract Type';
            DataClassification = CustomerContent;
        }

        field(22; "Channel Partner Code"; Code[20])
        {
            Caption = 'Channel Partner Code';
            TableRelation = "STI Agent/Broker Master"."Agent/Broker No.";
            DataClassification = CustomerContent;
        }

        field(23; "Channel Partner %"; Decimal)
        {
            Caption = 'Channel Partner Commission %';
            DataClassification = CustomerContent;
            MinValue = 0;
            MaxValue = 100;
        }

        // Missing from Meeting 02 - Finance Integration
        field(24; "Enforced"; Boolean)
        {
            Caption = 'Enforced';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(25; "Invoice No."; Code[20])
        {
            Caption = 'Invoice No.';
            DataClassification = CustomerContent;
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
