namespace BCEXPERTROAD.BCEXPERTROAD;

page 50017 "STI Reinsurance Subpage"
{
    PageType = ListPart;
    SourceTable = "STI Insurance Reinsurance Line";
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
                
                field("CLAPi Partner ID"; Rec."CLAPi Partner ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the CLAPi system reference for this reinsurance partner.';
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

   

    
}