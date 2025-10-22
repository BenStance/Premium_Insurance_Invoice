namespace BCEXPERTROAD.BCEXPERTROAD;

using Microsoft.Purchases.Setup;
using Microsoft.Foundation.NoSeries;

tableextension 50005 STIExtPurchPaySetable extends "Purchases & Payables Setup"
{
    fields
    {
        field(50000; "STI";Code[20])
        {
            Caption = 'STI';
            TableRelation="No. Series";           
        }
        
    }
}
