namespace BCEXPERTROAD.BCEXPERTROAD;

using Microsoft.Sales.Setup;

pageextension 50301 STIExtSalRecPg extends "Sales & Receivables Setup"
{
    layout
    {
        
     addlast("Number Series")
        
        {        
        
            field("STI Agent/Broker Nos.";Rec."STI Agent/Broker Nos.")
            {
                ApplicationArea = All;               
                Editable = true;
            } 
              
        }
    }
}
