page 50143 "Cust Customer List Part"
{
    PageType = ListPart;
    SourceTable = "Sales Header";
    ApplicationArea = All;
    InsertAllowed = false;
    Editable = false;
    UsageCategory = Lists;
    Caption = 'Cust Customer List Part';
    
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    begin
                        case Rec."Document Type" of
                            Rec."Document Type"::Order:
                                PAGE.Run(PAGE::"Sales Order", Rec);
                            Rec."Document Type"::Invoice:
                                PAGE.Run(PAGE::"Sales Invoice", Rec);
                            Rec."Document Type"::"Credit Memo":
                                PAGE.Run(PAGE::"Sales Credit Memo", Rec);
                        end;
                    end;
                }
        
                
                field("sell to cust number "; Rec."Sell-to Customer No." )
                {
                    ApplicationArea = All;
                }
                field("Sell to Cust name "; Rec."Sell-to Customer Name")
                {
                    ApplicationArea = All;
                }
                
            }
            
        }
    }
}