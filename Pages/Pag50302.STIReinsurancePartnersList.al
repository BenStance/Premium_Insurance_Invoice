namespace BCEXPERTROAD.BCEXPERTROAD;

page 50302 "STI Reinsurance Partners List"
{
    PageType = List;
    SourceTable = "STI Reinsurance Partner Master";
    Caption = 'Reinsurance Partners';
    UsageCategory = Lists;
    ApplicationArea = All;
    CardPageId = "STI Reinsurance Partner Card";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Partner No."; Rec."Partner No.")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Reinsurance Type"; Rec."Reinsurance Type")
                {
                    ApplicationArea = All;
                }
                field("Treaty Type"; Rec."Treaty Type")
                {
                    ApplicationArea = All;
                }
                field("Participation %"; Rec."Participation %")
                {
                    ApplicationArea = All;
                }
                field("Commission %"; Rec."Commission %")
                {
                    ApplicationArea = All;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = All;
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(NewPartner)
            {
                Caption = 'New Reinsurance Partner';
                Image = New;
                ApplicationArea = All;
                RunObject = Page "STI Reinsurance Partner Card";
                RunPageMode = Create;
            }
        }
    }
}