namespace BCEXPERTROAD.BCEXPERTROAD;
using Microsoft.Finance.GeneralLedger.Account;
page 50013 "STI Product List"
{
    PageType = List;
    SourceTable = "STI Product Master";
    Caption = 'Insurance Products';
    UsageCategory = Lists;
    ApplicationArea = All;
    CardPageId = "STI Product Card";
    Editable = false;

    PromotedActionCategories = 'New,Process,Report,Navigation,Category5,Category6,Category7,Category8,Category9,Category10';

    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Product Code"; Rec."Product Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique code for the insurance product.';
                }
                field("Product Name"; Rec."Product Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the insurance product.';
                }
                field("Product Type"; Rec."Product Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the type of insurance product.';
                }
                field("Product Category"; Rec."Product Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the category of the insurance product.';
                }
                field("GL Account No."; Rec."GL Account No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the main GL account for this product.';
                }
                field("Default Premium Rate"; Rec."Default Premium Rate")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the default premium rate for this product.';
                }
                field("Minimum Premium"; Rec."Minimum Premium")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the minimum premium amount for this product.';
                }
                field("Maximum Sum Insured"; Rec."Maximum Sum Insured")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the maximum sum insured for this product.';
                }
                field("Policy Term"; Rec."Policy Term")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the policy term in months.';
                }
                field("Commission Rate %"; Rec."Commission Rate %")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the default commission rate percentage.';
                }
                field("Reinsurance Required"; Rec."Reinsurance Required")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether reinsurance is required for this product.';
                }
                field("Reinsurance Type"; Rec."Reinsurance Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the default reinsurance type for this product.';
                }
                field("CLAPi Product ID"; Rec."CLAPi Product ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the CLAPi system reference for this product.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the effective date for this product.';
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the expiry date for this product.';
                }
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(NewProduct)
            {
                Caption = 'New Product';
                Image = New;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                ToolTip = 'Create a new insurance product.';

                trigger OnAction()
                begin
                    Page.Run(Page::"STI Product Card");
                end;
            }
            
            action(RefreshProducts)
            {
                Caption = 'Refresh Products';
                Image = Refresh;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Refresh the product list.';

                trigger OnAction()
                begin
                    CurrPage.Update();
                    Message('Product list refreshed.');
                end;
            }
        }
        
        area(Navigation)
        {
            action(OpenCard)
            {
                Caption = 'Open Product Card';
                Image = Document;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Open the selected product card.';

                trigger OnAction()
                begin
                    Page.Run(Page::"STI Product Card", Rec);
                end;
            }
            
            action(GLAccount)
            {
                Caption = 'Open GL Account';
                Image = GLRegisters;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Open the GL account for the selected product.';

                trigger OnAction()
                var
                    GLAccount: Record "G/L Account";
                begin
                    if GLAccount.Get(Rec."GL Account No.") then
                        Page.Run(Page::"G/L Account Card", GLAccount)
                    else
                        Message('GL Account %1 not found.', Rec."GL Account No.");
                end;
            }
        }
        
        area(Reporting)
        {
            action(ProductCatalog)
            {
                Caption = 'Product Catalog Report';
                Image = Report;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Report;
                ToolTip = 'Generate product catalog report.';

                trigger OnAction()
                begin
                    // Report logic to be implemented
                    Message('Generating Product Catalog Report.');
                end;
            }
            
            action(ProductPerformance)
            {
                Caption = 'Product Performance';
                Image = Report;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Report;
                ToolTip = 'Generate product performance report.';

                trigger OnAction()
                begin
                    // Report logic to be implemented
                    Message('Generating Product Performance Report.');
                end;
            }
        }
    }
    
    

}