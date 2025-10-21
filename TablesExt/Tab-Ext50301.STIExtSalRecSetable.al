namespace BCEXPERTROAD.BCEXPERTROAD;

using Microsoft.Sales.Setup;
using Microsoft.Foundation.NoSeries;

tableextension 50301 STIExtSalRecSetable extends "Sales & Receivables Setup"
{
    fields
    {
        field(50301; "STI Agent/Broker Nos.";Code[20])
        {
            Caption = 'STI Agent/Broker Nos.';
            DataClassification = ToBeClassified;
            TableRelation="No. Series";           
        }
    }
}
