namespace BCEXPERTROAD.BCEXPERTROAD;

using Microsoft.Inventory.Setup;
using Microsoft.Foundation.NoSeries;

tableextension 50014 STIInventoryExt extends "Inventory Setup"
{
    fields
    {
        field(50000; "STI Product No."; Code[20] )
        {
            Caption = 'STI Product No.';
            TableRelation="No. Series";
        }
    }
}
