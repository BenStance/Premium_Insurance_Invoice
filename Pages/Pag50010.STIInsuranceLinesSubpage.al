namespace BCEXPERTROAD.BCEXPERTROAD;
using Microsoft.Inventory.Item;

page 50010 "STI Insurance Lines Subpage"
{
    PageType = ListPart;
    SourceTable = "STI Insurance Line";
    Caption = 'Insurance Products';
    ApplicationArea = All;
    DelayedInsert = true;
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Product Code"; Rec."Product Code")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the insurance product code.';
                }
                field("Product Description"; Rec."Product Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the description of the insurance product.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the quantity for this product line.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unit price for this product.';
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the total amount for this product line.';
                    Style = Strong;
                    StyleExpr = TRUE;
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
                field("Modified By"; Rec."Modified By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the user who last modified the record.';
                    Editable = false;
                }
                field("Modified DateTime"; Rec."Modified DateTime")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date and time when the record was last modified.';
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ItemCard)
            {
                Caption = 'Item Card';
                Image = Item;
                ApplicationArea = All;
                ToolTip = 'Open the item card for the selected product.';

                trigger OnAction()
                var
                    Item: Record Item;
                begin
                    if Item.Get(Rec."Product Code") then
                        Page.Run(Page::"Item Card", Item)
                    else
                        Message('Item %1 not found.', Rec."Product Code");
                end;
            }
        }
    }
}
