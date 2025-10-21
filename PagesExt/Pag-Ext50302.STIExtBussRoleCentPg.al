namespace BCEXPERTROAD.BCEXPERTROAD;

using Microsoft.Finance.RoleCenters;

pageextension 50302 STIExtBussRoleCentPg extends "Business Manager Role Center"
{
    actions
    {
        addlast(Processing)
        {
            action("CLAPi Invoices")
            {
                ApplicationArea = All;
                Caption = 'RDP Requests';
                RunObject = Page "STI Premium Invoices List";
                ToolTip = 'View and manage CLAPi Invoices.';
            }
        }
    }
}
