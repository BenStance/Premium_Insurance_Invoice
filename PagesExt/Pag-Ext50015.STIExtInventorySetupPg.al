namespace BCEXPERTROAD.BCEXPERTROAD;

using Microsoft.Inventory.Setup;

pageextension 50015 STIExtInventorySetupPg extends "Inventory Setup"
{
    layout
    {
        addlast(Numbering)
        {
            field("STI Product No."; Rec."STI Product No.")
            {
                ApplicationArea = All;
                Editable = true;
            }
        }
    }
}
