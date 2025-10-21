namespace BCEXPERTROAD.BCEXPERTROAD;
using Microsoft.Sales.Customer;

page 50304 "STI Premium Invoice Document"
{
    PageType = Document;
    SourceTable = "STI Premium Header";
    Caption = 'Premium Invoice';
    UsageCategory = Documents;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General Information';
                field("Premium No."; Rec."Premium No.")
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                }
                field("Policy No."; Rec."Policy No.")
                {
                    ApplicationArea = All;
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = All;
                }
            }

            group(Financial)
            {
                Caption = 'Financial Details';
                field("Premium Amount"; Rec."Premium Amount")
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                }
                field("Channel Partner Code"; Rec."Channel Partner Code")
                {
                    ApplicationArea = All;
                }
                field("Channel Partner %"; Rec."Channel Partner %")
                {
                    ApplicationArea = All;
                }
                field("Reinsurance Type"; Rec."Reinsurance Type")
                {
                    ApplicationArea = All;
                }
            }

            group(Integration)
            {
                Caption = 'Integration & Approval';
                field("CLAPi Ref. No."; Rec."CLAPi Ref. No.")
                {
                    ApplicationArea = All;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = All;
                }
                field("Enforced"; Rec."Enforced")
                {
                    ApplicationArea = All;
                }
                field("Invoice No."; Rec."Invoice No.")
                {
                    ApplicationArea = All;
                }
                field("Posting Description"; Rec."Posting Description")
                {
                    ApplicationArea = All;
                }
            }

            part(PremiumLines; "STI Premium Lines Subpage")
            {
                Caption = 'Premium Products';
                SubPageLink = "Premium Line No." = field("Premium No.");
                ApplicationArea = All;
            }

            part(AgentBrokerLines; "STI Agent/Broker Subpage")
            {
                Caption = 'Agents & Brokers';
                SubPageLink = "Premium No." = field("Premium No.");
                ApplicationArea = All;
            }

            part(ReinsuranceLines; "STI Reinsurance Subpage")
            {
                Caption = 'Reinsurance Partners';
                SubPageLink = "Premium No." = field("Premium No.");
                ApplicationArea = All;
            }

            group(Audit)
            {
                Caption = 'Audit Information';
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Modified By"; Rec."Modified By")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Modified DateTime"; Rec."Modified DateTime")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Release)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    // Release logic to be implemented
                    Message('Premium Invoice %1 released.', Rec."Premium No.");
                end;
            }

            action(Reopen)
            {
                Caption = 'Reopen';
                Image = ReOpen;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    // Reopen logic to be implemented
                    Message('Premium Invoice %1 reopened.', Rec."Premium No.");
                end;
            }

            action(Post)
            {
                Caption = 'Post';
                Image = Post;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    // Posting logic to be implemented
                    Message('Premium Invoice %1 posted.', Rec."Premium No.");
                end;
            }

            action(Print)
            {
                Caption = 'Print';
                Image = Print;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Report;

                trigger OnAction()
                begin
                    // Print logic to be implemented
                    Message('Printing Premium Invoice %1.', Rec."Premium No.");
                end;
            }
        }

        area(Navigation)
        {
            action(CustomerCard)
            {
                Caption = 'Customer Card';
                Image = Customer;
                ApplicationArea = All;
                RunObject = Page "Customer Card";
                RunPageLink = "No." = field("Customer No.");
            }

            action(AgentBrokerCard)
            {
                Caption = 'Channel Partner Card';
                Image = PersonInCharge;
                ApplicationArea = All;
                RunObject = Page "STI Agent/Broker Card";
                RunPageLink = "Agent/Broker No." = field("Channel Partner Code");
            }
        }
    }
}