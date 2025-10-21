namespace BCEXPERTROAD.BCEXPERTROAD;
using Microsoft.Purchases.Vendor;


page 50303 "STI Reinsurance Partner Card"
{
    PageType = Card;
    SourceTable = "STI Reinsurance Partner Master";
    Caption = 'Reinsurance Partner Card';
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General Information';
                field("Partner No."; Rec."Partner No.")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Search Name"; Rec."Search Name")
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
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("CLAPi Partner ID"; Rec."CLAPi Partner ID")
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
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = All;
                }
            }

            group("Contact Information")
            {
                Caption = 'Contact Information';
                field("Contact Person"; Rec."Contact Person")
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
            }

            group("Treaty Details")
            {
                Caption = 'Treaty Details';
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = All;
                }
                field("Expiry Date"; Rec."Expiry Date")
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
            }

            group("Financial Integration")
            {
                Caption = 'Financial Integration';
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = All;
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = All;
                }
                field("Bank Account No."; Rec."Bank Account No.")
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
                field("No. Series"; Rec."No. Series")
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
            action(OpenVendor)
            {
                Caption = 'Open Vendor Card';
                Image = Vendor;
                ApplicationArea = All;
                
                trigger OnAction()
                var
                    Vendor: Record Vendor;
                begin
                    if Vendor.Get(Rec."Vendor No.") then
                        Page.Run(Page::"Vendor Card", Vendor)
                    else
                        Message('No vendor linked to this reinsurance partner.');
                end;
            }
        }
    }
}