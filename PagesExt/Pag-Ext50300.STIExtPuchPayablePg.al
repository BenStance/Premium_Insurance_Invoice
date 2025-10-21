namespace BCEXPERTROAD.BCEXPERTROAD;

using Microsoft.Purchases.Setup;

pageextension 50300 STIExtPuchPayablePg extends "Purchases & Payables Setup"
{
    layout
    {
        
     addbefore(RFQ2)
        
        {        
        
            field(STI;Rec.STI)
            {
                ApplicationArea = All;
                Editable = true;
            }
            field("STI Reinsurance Partner Nos.";Rec."STI Reinsurance Partner Nos.")
            {
                ApplicationArea = All;               
                Editable = true;
            } 
              
        }
    }
}
