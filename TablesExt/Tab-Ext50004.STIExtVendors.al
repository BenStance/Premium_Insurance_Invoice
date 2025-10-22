namespace BCEXPERTROAD.BCEXPERTROAD;

using Microsoft.Purchases.Vendor;
using Microsoft.Bank.BankAccount;

tableextension 50004 STIExtVendors extends Vendor
{
    fields

    {
        field(50001; "Bank No."; Code[20])
        {
            Caption = 'Bank Account No.';
            TableRelation = "Bank Account"."Bank Account No.";
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                ItemRec: Record "Bank Account";
            begin
                if ItemRec.Get("Bank No.") then begin
                    "Bank Account No." := ItemRec."Bank Account No.";
                    "Bank Name" := ItemRec.Name;
                end;
            end;
        }
        field(50002; "Bank Account No."; Text[30])
        {
            Caption = 'Bank Account No.';
            DataClassification = ToBeClassified;
        }
        field(50003; "Bank Name"; Text[100] )
        {
            Caption = 'Bank Name';
            DataClassification = ToBeClassified;
        }
        field(50004; Type; Option)
        {
            Caption = 'Type';
            OptionMembers = Agent,Broker,Reinsurer;
            OptionCaption = 'Agent,Broker,Reinsurer';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50005; "Commission %"; Decimal)
        {
            Caption = 'Commission (%)';
            DataClassification = ToBeClassified;
            MinValue = 0;
            MaxValue = 100;
        }
         field(50006; "Reinsurance Type"; Option)
        {
            Caption = 'Reinsurance Type';
            OptionMembers = Treaty,Facultative,"Both";
            OptionCaption = 'Treaty,Facultative,Both';
            DataClassification = ToBeClassified;
        }

        field(50007; "Treaty Type"; Option)
        {
            Caption = 'Treaty Type';
            OptionMembers = " ","Proportional","Non-Proportional";
            OptionCaption = ' ,Proportional,Non-Proportional';
            DataClassification = ToBeClassified;
        }
    }
}
