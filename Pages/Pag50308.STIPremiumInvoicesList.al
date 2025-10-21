namespace BCEXPERTROAD.BCEXPERTROAD;
using Microsoft.Sales.Customer;

page 50308 "STI Premium Invoices List"
{
    PageType = List;
    SourceTable = "STI Premium Header";
    Caption = 'Premium Invoices';
    UsageCategory = Lists;
    ApplicationArea = All;
    CardPageId = "STI Premium Invoice Document";
    Editable = false;

    PromotedActionCategories = 'New,Process,Report,Navigation,Category5,Category6,Category7,Category8,Category9,Category10';

    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Premium No."; Rec."Premium No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the premium invoice number.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the posting date of the premium invoice.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the status of the premium invoice.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer number.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer name.';
                }
                field("Policy No."; Rec."Policy No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the policy number.';
                }
                field("Premium Amount"; Rec."Premium Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the total premium amount.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the currency code.';
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the contract type.';
                }
                field("Channel Partner Code"; Rec."Channel Partner Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the channel partner code.';
                }
                field("Reinsurance Type"; Rec."Reinsurance Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the reinsurance type.';
                }
                field("CLAPi Ref. No."; Rec."CLAPi Ref. No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the CLAPi system reference number.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the approval status.';
                }
                field("Enforced"; Rec."Enforced")
                {
                    ApplicationArea = All;
                    ToolTip = 'Indicates if the premium has been enforced.';
                }
                field("Invoice No."; Rec."Invoice No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the invoice number if posted.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies who created the premium invoice.';
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies when the premium invoice was created.';
                }
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(NewPremiumInvoice)
            {
                Caption = 'New Premium Invoice';
                Image = New;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                ToolTip = 'Create a new premium invoice.';

                trigger OnAction()
                begin
                    Page.Run(Page::"STI Premium Invoice Document");
                end;
            }
            
            action(Release)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Release the selected premium invoice.';

                trigger OnAction()
                begin
                    // Release logic to be implemented
                    if Confirm('Release premium invoice %1?', true, Rec."Premium No.") then
                        Message('Premium Invoice %1 released.', Rec."Premium No.");
                end;
            }
            
            action(Post)
            {
                Caption = 'Post';
                Image = Post;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Post the selected premium invoice.';

                trigger OnAction()
                begin
                    // Posting logic to be implemented
                    if Confirm('Post premium invoice %1?', true, Rec."Premium No.") then
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
                ToolTip = 'Print the selected premium invoice.';

                trigger OnAction()
                begin
                    // Print logic to be implemented
                    Message('Printing Premium Invoice %1.', Rec."Premium No.");
                end;
            }
        }
        
        area(Navigation)
        {
            action(OpenDocument)
            {
                Caption = 'Open Document';
                Image = Document;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Open the premium invoice document.';

                trigger OnAction()
                begin
                    Page.Run(Page::"STI Premium Invoice Document", Rec);
                end;
            }
            
            action(CustomerCard)
            {
                Caption = 'Customer Card';
                Image = Customer;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory =Category4;
                ToolTip = 'Open the customer card.';

                trigger OnAction()
                var
                    Customer: Record  Customer;
                begin
                    if Customer.Get(Rec."Customer No.") then
                        Page.Run(Page::"Customer Card", Customer);
                end;
            }
            
            action(AgentBrokerCard)
            {
                Caption = 'Channel Partner Card';
                Image = PersonInCharge;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Open the channel partner card.';

                trigger OnAction()
                var
                    AgentBroker: Record "STI Agent/Broker Master";
                begin
                    if AgentBroker.Get(Rec."Channel Partner Code") then
                        Page.Run(Page::"STI Agent/Broker Card", AgentBroker);
                end;
            }
        }
        
        area(Reporting)
        {
            action(PremiumInvoiceReport)
            {
                Caption = 'Premium Invoice Report';
                Image = Report;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Report;
                ToolTip = 'Generate premium invoice report.';

                trigger OnAction()
                begin
                    // Report logic to be implemented
                    Message('Generating Premium Invoice Report for %1.', Rec."Premium No.");
                end;
            }
        }
    }
    
    trigger OnOpenPage()
    begin
        // Set default sorting
        Rec.SetCurrentKey("Posting Date", "Premium No.");
        Rec.Ascending(false); // Show newest first
    end;
}