namespace BCEXPERTROAD.BCEXPERTROAD;

using Microsoft.Purchases.Setup;
using Microsoft.Foundation.NoSeries;

tableextension 50300 STIExtPurchPaySetable extends "Purchases & Payables Setup"
{
    fields
    {
        field(50300; "STI";Code[20])
        {
            Caption = 'STI';
            DataClassification = ToBeClassified;
            TableRelation="No. Series";           
        }
        field(50301; "STI Reinsurance Partner Nos.";Code[20])
        {
            Caption = 'STI Reinsurance Partner Nos.';
            DataClassification = ToBeClassified;
            TableRelation="No. Series";           
        }
    }
}
