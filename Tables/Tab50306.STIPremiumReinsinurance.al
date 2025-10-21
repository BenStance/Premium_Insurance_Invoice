table 50306 "STI Premium Reinsurance Line"
{
    Caption = 'Premium Reinsurance Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Premium No."; Code[20])
        {
            Caption = 'Premium No.';
            TableRelation = "STI Premium Header"."Premium No.";
            DataClassification = CustomerContent;
        }

        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            AutoIncrement = true;
            DataClassification = SystemMetadata;
        }

        field(3; "Reinsurance Partner No."; Code[20])
        {
            Caption = 'Reinsurance Partner No.';
            TableRelation = "STI Reinsurance Partner Master"."Partner No.";
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                ReinsPartner: Record "STI Reinsurance Partner Master";
            begin
                if ReinsPartner.Get("Reinsurance Partner No.") then begin
                    "Reinsurance Partner Name" := ReinsPartner.Name;
                    "Reinsurance Type" := ReinsPartner."Reinsurance Type";
                    "Treaty Type" := ReinsPartner."Treaty Type";
                    "Commission %" := ReinsPartner."Commission %";
                    "Vendor No." := ReinsPartner."Vendor No.";
                    Validate("Participation %", ReinsPartner."Participation %");
                end;
            end;
        }

        field(4; "Reinsurance Partner Name"; Text[100])
        {
            Caption = 'Reinsurance Partner Name';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(5; "Reinsurance Type"; Option)
        {
            Caption = 'Reinsurance Type';
            OptionMembers = Treaty,Facultative,"Both";
            OptionCaption = 'Treaty,Facultative,Both';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(6; "Treaty Type"; Option)
        {
            Caption = 'Treaty Type';
            OptionMembers = " ","Proportional","Non-Proportional";
            OptionCaption = ' ,Proportional,Non-Proportional';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(7; "Participation %"; Decimal)
        {
            Caption = 'Participation %';
            DataClassification = CustomerContent;
            MinValue = 0;
            MaxValue = 100;

            trigger OnValidate()
            begin
                CalcParticipationAmount();
            end;
        }

        field(8; "Participation Amount"; Decimal)
        {
            Caption = 'Participation Amount';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(9; "Commission %"; Decimal)
        {
            Caption = 'Commission %';
            DataClassification = CustomerContent;
            MinValue = 0;
            MaxValue = 100;

            trigger OnValidate()
            begin
                CalcCommissionAmount();
            end;
        }

        field(10; "Commission Amount"; Decimal)
        {
            Caption = 'Commission Amount';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(11; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = Vendor;
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(12; "CLAPi Partner ID"; Code[30])
        {
            Caption = 'CLAPi Partner ID';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(13; "Created By"; Code[50])
        {
            Caption = 'Created By';
            DataClassification = SystemMetadata;
            Editable = false;
        }

        field(14; "Created DateTime"; DateTime)
        {
            Caption = 'Created DateTime';
            DataClassification = SystemMetadata;
            Editable = false;
        }

        field(15; "Modified By"; Code[50])
        {
            Caption = 'Modified By';
            DataClassification = SystemMetadata;
            Editable = false;
        }

        field(16; "Modified DateTime"; DateTime)
        {
            Caption = 'Modified DateTime';
            DataClassification = SystemMetadata;
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Premium No.", "Line No.")
        {
            Clustered = true;
        }
        key(Partner; "Reinsurance Partner No.")
        {
        }
    }

    trigger OnInsert()
    var
        UserSetup: Record "User Setup";
    begin
        if UserSetup.Get(UserId()) then
            "Created By" := UserSetup."User ID";
        "Created DateTime" := CurrentDateTime();
        "Modified By" := "Created By";
        "Modified DateTime" := "Created DateTime";

        CalcParticipationAmount();
        CalcCommissionAmount();
    end;

    trigger OnModify()
    var
        UserSetup: Record "User Setup";
    begin
        if UserSetup.Get(UserId()) then
            "Modified By" := UserSetup."User ID";
        "Modified DateTime" := CurrentDateTime();

        CalcParticipationAmount();
        CalcCommissionAmount();
    end;

    procedure CalcParticipationAmount()
    var
        PremiumHeader: Record "STI Premium Header";
    begin
        if PremiumHeader.Get("Premium No.") then
            "Participation Amount" := Round(PremiumHeader."Premium Amount" * ("Participation %" / 100), 0.01);
    end;

    procedure CalcCommissionAmount()
    begin
        "Commission Amount" := Round("Participation Amount" * ("Commission %" / 100), 0.01);
    end;
}