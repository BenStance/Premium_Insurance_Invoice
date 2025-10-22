namespace BCEXPERTROAD.BCEXPERTROAD;

using Microsoft.Purchases.Setup;
using Microsoft.Foundation.NoSeries;

tableextension 50005 STIExtPurchPaySetable extends "Purchases & Payables Setup"
{
    fields
    {
        field(50005; "STI";Code[20])
        {
            Caption = 'STI';
            DataClassification = ToBeClassified;
            TableRelation="No. Series";           
        }
        
    }
}
