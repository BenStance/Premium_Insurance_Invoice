namespace BCEXPERTROAD.BCEXPERTROAD;
using Microsoft.Purchases.Vendor;

page 50307 "STI Reinsurance Subpage"
{
    PageType = ListPart;
    SourceTable = "STI Premium Reinsurance Line";
    Caption = 'Reinsurance Partners';
    ApplicationArea = All;
    DelayedInsert = true;
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Reinsurance Partner No."; Rec."Reinsurance Partner No.")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the reinsurance partner code.';
                }
                field("Reinsurance Partner Name"; Rec."Reinsurance Partner Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the reinsurance partner.';
                }
                field("Reinsurance Type"; Rec."Reinsurance Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the type of reinsurance arrangement.';
                }
                field("Treaty Type"; Rec."Treaty Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the treaty is Proportional or Non-Proportional.';
                }
                field("Participation %"; Rec."Participation %")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the percentage of premium participation for this reinsurer.';
                }
                field("Participation Amount"; Rec."Participation Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the calculated participation amount based on premium total.';
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("Commission %"; Rec."Commission %")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the commission percentage payable to the reinsurer.';
                }
                field("Commission Amount"; Rec."Commission Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the calculated commission amount based on participation.';
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the vendor account for payment processing.';
                }
                field("CLAPi Partner ID"; Rec."CLAPi Partner ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the CLAPi system reference for this reinsurance partner.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ReinsurancePartnerCard)
            {
                Caption = 'Reinsurance Partner Card';
                Image = ContactPerson;
                ApplicationArea = All;
                ToolTip = 'Open the reinsurance partner card for the selected record.';

                trigger OnAction()
                var
                    ReinsPartner: Record "STI Reinsurance Partner Master";
                begin
                    if ReinsPartner.Get(Rec."Reinsurance Partner No.") then
                        Page.Run(Page::"STI Reinsurance Partner Card", ReinsPartner)
                    else
                        Message('Reinsurance Partner %1 not found.', Rec."Reinsurance Partner No.");
                end;
            }

            action(VendorCard)
            {
                Caption = 'Vendor Card';
                Image = Vendor;
                ApplicationArea = All;
                ToolTip = 'Open the vendor card for payment processing.';

                trigger OnAction()
                var
                    Vendor: Record Vendor;
                begin
                    if Vendor.Get(Rec."Vendor No.") then
                        Page.Run(Page::"Vendor Card", Vendor)
                    else
                        Message('Vendor %1 not found.', Rec."Vendor No.");
                end;
            }
        }
    }

    // trigger OnNewRecord(BelowxRec: Boolean)
    // begin
    //     Rec."Premium No." := GetFilter("Premium No.");
    // end;

    trigger OnAfterGetCurrRecord()
    begin
        // Recalculate amounts when record is refreshed
        Rec.CalcParticipationAmount();
        Rec.CalcCommissionAmount();
    end;
}