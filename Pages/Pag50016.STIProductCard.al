namespace BCEXPERTROAD.BCEXPERTROAD;
using Microsoft.Finance.GeneralLedger.Account;

page 50016 "STI Product Card"
{
    PageType = Card;
    SourceTable = "STI Product Master";
    Caption = 'Insurance Product Card';
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General Information';
                field("Product Code"; Rec."Product Code")
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                    ToolTip = 'Specifies the unique code for the insurance product.';
                }
                field("Product Name"; Rec."Product Name")
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                    ToolTip = 'Specifies the name of the insurance product.';
                }
                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the search name for quick lookup.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the detailed description of the insurance product.';
                }
                field("Product Type"; Rec."Product Type")
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                    ToolTip = 'Specifies the type of insurance product.';
                }
                field("Product Category"; Rec."Product Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the category of the insurance product.';
                }
                field("CLAPi Product ID"; Rec."CLAPi Product ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the CLAPi system reference for this product.';
                }
            }

            group("Financial Accounts")
            {
                Caption = 'Financial Accounts';
                field("GL Account No."; Rec."GL Account No.")
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                    ToolTip = 'Specifies the main GL account for this product.';
                }
                field("GL Account Name"; Rec."GL Account Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the main GL account.';
                }
                field("Premium GL Account"; Rec."Premium GL Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the GL account for premium income.';
                }
                field("Commission GL Account"; Rec."Commission GL Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the GL account for commission expenses.';
                }
                field("Claims GL Account"; Rec."Claims GL Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the GL account for claims expenses.';
                }
            }

            group("Pricing & Limits")
            {
                Caption = 'Pricing & Limits';
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
                field("Underwriting Limit"; Rec."Underwriting Limit")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the underwriting limit for this product.';
                }
            }

            group("Policy Terms")
            {
                Caption = 'Policy Terms';
                field("Policy Term"; Rec."Policy Term")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the policy term in months.';
                }
                field("Renewal Period"; Rec."Renewal Period")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the renewal period in days.';
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

            group("Commission & Reinsurance")
            {
                Caption = 'Commission & Reinsurance';
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
            }

            group("Audit Information")
            {
                Caption = 'Audit Information';
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies who created this product.';
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies when this product was created.';
                }
                field("Modified By"; Rec."Modified By")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies who last modified this product.';
                }
                field("Modified DateTime"; Rec."Modified DateTime")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies when this product was last modified.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the number series used for this product.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(GLAccountCard)
            {
                Caption = 'Open GL Account';
                Image = GLRegisters;
                ApplicationArea = All;
                ToolTip = 'Open the GL account card for the selected account.';

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

            action(PremiumGLAccount)
            {
                Caption = 'Open Premium GL Account';
                Image = GLRegisters;
                ApplicationArea = All;
                ToolTip = 'Open the premium GL account card.';

                trigger OnAction()
                var
                    GLAccount: Record "G/L Account";
                begin
                    if GLAccount.Get(Rec."Premium GL Account") then
                        Page.Run(Page::"G/L Account Card", GLAccount)
                    else
                        Message('Premium GL Account %1 not found.', Rec."Premium GL Account");
                end;
            }
        }

        area(Navigation)
        {
            action(ProductList)
            {
                Caption = 'Product List';
                Image = List;
                ApplicationArea = All;
                ToolTip = 'View all insurance products.';
                RunObject = Page "STI Product List";
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        GLAccount: Record "G/L Account";
    begin
        // Update GL Account Name if GL Account No. is changed
        if Rec."GL Account No." <> '' then begin
            if GLAccount.Get(Rec."GL Account No.") then
                Rec."GL Account Name" := GLAccount.Name
            else
                Rec."GL Account Name" := '';
        end else
            Rec."GL Account Name" := '';
    end;
}