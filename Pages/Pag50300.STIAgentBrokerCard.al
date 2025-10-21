page 50300 "STI Agent/Broker Card"
{
    PageType = Card;
    SourceTable = "STI Agent/Broker Master";
    Caption = 'Agent/Broker Card';
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General Information';
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
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Contact Person"; Rec."Contact Person")
                {
                    ApplicationArea = All;
                }
            }

            group("Address Details")
            {
                Caption = 'Address Details';
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = All;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = All;
                }
                field(Country; Rec.Country)
                {
                    ApplicationArea = All;
                }
            }

            group("Contact Information")
            {
                Caption = 'Contact Information';
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                }
            }

            group("Registration Details")
            {
                Caption = 'Registration Details';
                field("TIN No."; Rec."TIN No.")
                {
                    ApplicationArea = All;
                }
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = All;
                }
                field("CLAPi Ref. No."; Rec."CLAPi Ref. No.")
                {
                    ApplicationArea = All;
                }
            }

            group("Commission Details")
            {
                Caption = 'Commission Details';
                field("Commission %"; Rec."Commission %")
                {
                    ApplicationArea = All;
                }
                field("Max Commission %"; Rec."Max Commission %")
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

            group("Financial Integration")
            {
                Caption = 'Financial Integration';
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = All;
                }
                field("Bank Account No."; Rec."Bank Account No.")
                {
                    ApplicationArea = All;
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = All;
                }
            }

            group("Audit Information")
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
}