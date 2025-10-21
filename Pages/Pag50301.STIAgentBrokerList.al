page 50301 "STI Agent/Broker List"
{
    PageType = List;
    SourceTable = "STI Agent/Broker Master";
    Caption = 'Agents/Brokers';
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "STI Agent/Broker Card";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Agent/Broker No."; Rec."Agent/Broker No.")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field("TIN No."; Rec."TIN No.")
                {
                    ApplicationArea = All;
                }
                field("Phone No."; Rec."Phone No.")

                {
                    ApplicationArea = All;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                }
                field("Commission %"; Rec."Commission %")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
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
            action(Card)
            {
                Caption = 'View Card';
                ApplicationArea = All;
                RunObject = page "STI Agent/Broker Card";
                RunPageLink = "Agent/Broker No." = field("Agent/Broker No.");
            }
        }
    }
}
