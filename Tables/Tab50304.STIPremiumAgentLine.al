table 50302 "STI Premium Agent/Broker Line"
{
    Caption = 'Premium Agent Line';
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

        field(3; "Agent/Broker Code"; Code[20])
        {
            Caption = 'Agent/Broker Code';
            TableRelation = "STI Agent/Broker Master"."Agent/Broker No.";
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                AgentRec: Record "STI Agent/Broker Master";
            begin
                if AgentRec.Get("Agent/Broker Code") then begin
                    "Agent/Broker Name" := AgentRec.Name;
                    Type := AgentRec.Type;
                    "Commission %" := AgentRec."Commission %";
                    CalcCommissionAmount();
                end;
            end;
        }

        field(4; "Agent/Broker Name"; Text[100])
        {
            Caption = 'Agent/Broker Name';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(5; Type; Option)
        {
            Caption = 'Type';
            OptionMembers = Agent,Broker;
            OptionCaption = 'Agent,Broker';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(6; "Commission %"; Decimal)
        {
            Caption = 'Commission (%)';
            DataClassification = CustomerContent;
            MinValue = 0;
            MaxValue = 100;

            trigger OnValidate()
            begin
                CalcCommissionAmount();
            end;
        }

        field(7; "Commission Amount"; Decimal)
        {
            Caption = 'Commission Amount';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(8; "Created By"; Code[50])
        {
            Caption = 'Created By';
            Editable = false;
            DataClassification = SystemMetadata;
        }

        field(9; "Created DateTime"; DateTime)
        {
            Caption = 'Created DateTime';
            Editable = false;
            DataClassification = SystemMetadata;
        }

        field(10; "Modified By"; Code[50])
        {
            Caption = 'Modified By';
            Editable = false;
            DataClassification = SystemMetadata;
        }

        field(11; "Modified DateTime"; DateTime)
        {
            Caption = 'Modified DateTime';
            Editable = false;
            DataClassification = SystemMetadata;
        }
        // Missing - CLAPi integration reference
        field(12; "CLAPi Agent ID"; Code[30])
        {
            Caption = 'CLAPi Agent ID';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Premium No.", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        UserSetup: Record "User Setup";
    begin
        if UserSetup.Get(UserId()) then
            "Created By" := UserSetup."User ID";
        "Created DateTime" := CurrentDateTime();

        // Default modified values
        "Modified By" := "Created By";
        "Modified DateTime" := "Created DateTime";

        CalcCommissionAmount();
    end;

    trigger OnModify()
    var
        UserSetup: Record "User Setup";
    begin
        if UserSetup.Get(UserId()) then
            "Modified By" := UserSetup."User ID";
        "Modified DateTime" := CurrentDateTime();

        CalcCommissionAmount();
    end;

    local procedure CalcCommissionAmount()
    var
        PremiumHeader: Record "STI Premium Header";
    begin
        if PremiumHeader.Get("Premium No.") then
            "Commission Amount" := Round(PremiumHeader."Premium Amount" * ("Commission %" / 100), 0.01);
    end;
}
