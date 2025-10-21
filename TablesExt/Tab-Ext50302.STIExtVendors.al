namespace BCEXPERTROAD.BCEXPERTROAD;

using Microsoft.Purchases.Vendor;
using Microsoft.Bank.BankAccount;

tableextension 50302 STIExtVendors extends Vendor
{
    fields

    {
        field(50301; "Bank No."; Code[20])
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
        field(50302; "Bank Account No."; Text[30])
        {
            Caption = 'Bank Account No.';
            DataClassification = ToBeClassified;
        }
        field(50303; "Bank Name"; Text[100] )
        {
            Caption = 'Bank Name';
            DataClassification = ToBeClassified;
        }
    }
}
