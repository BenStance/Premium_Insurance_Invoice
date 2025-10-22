namespace BCEXPERTROAD.BCEXPERTROAD;

using Microsoft.Purchases.Setup;

pageextension 50006 STIExtPuchPayablePg extends "Purchases & Payables Setup"
{
    layout
    {
        
     addlast("Number Series")
        
        {        
        
            field(STI;Rec.STI)
            {
                ApplicationArea = All;
                Editable = true;
            }             
        }
    }
}
