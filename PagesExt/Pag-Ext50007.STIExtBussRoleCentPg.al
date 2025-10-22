namespace BCEXPERTROAD.BCEXPERTROAD;

using Microsoft.Finance.RoleCenters;

pageextension 50007 STIExtBussRoleCentPg extends "Business Manager Role Center"
{
    actions
    {
        addlast(embedding)
        {
            action("CLAPi Invoices")
            {
                ApplicationArea = All;
                Caption = 'CLAPi Invoices';
                RunObject = Page "STI Premium Invoices List";
                ToolTip = 'View and manage CLAPi Invoices.';
            }
        }
    }
}
