namespace BCEXPERTROAD.BCEXPERTROAD;
using Microsoft.Purchases.Vendor;

page 50009 "STI Agent/Broker Subpage"
{
    PageType = ListPart;
    SourceTable = "STI Insurance Agent Line";
    Caption = 'Agents & Brokers';
    ApplicationArea = All;
    DelayedInsert = true;
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Agent/Broker Code"; Rec."Agent/Broker Code")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the agent or broker code.';
                }
                field("Agent/Broker Name"; Rec."Agent/Broker Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the agent or broker.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether this is an Agent or Broker.';
                }
                field("Commission %"; Rec."Commission %")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the commission percentage for this agent/broker.';
                }
                field("Commission Amount"; Rec."Commission Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the commission amount calculated based on premium total.';
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("Modified By"; Rec."Modified By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the user who last modified the record.';
                    Editable = false;
                }
                field("Modified Date"; Rec."Modified DateTime")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the record was last modified.';
                    Editable = false;
                }
                // field("CLAPi Agent ID"; Rec."CLAPi Agent ID")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the CLAPi system reference for this agent/broker.';
                // }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(AgentBrokerCard)
            {
                Caption = 'Agent/Broker Card';
                Image = PersonInCharge;
                ApplicationArea = All;
                ToolTip = 'Open the agent/broker card for the selected record.';

                trigger OnAction()
                var
                    AgentBroker: Record Vendor;
                begin
                    if AgentBroker.Get(Rec."Agent/Broker Code") then
                        Page.Run(Page::"Vendor Card", AgentBroker)
                    else
                        Message('Agent/Broker %1 not found.', Rec."Agent/Broker Code");
                end;
            }
        }
    }
}
