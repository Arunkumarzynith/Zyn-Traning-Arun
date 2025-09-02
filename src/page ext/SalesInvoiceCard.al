pageextension 50135 salesInvoiceCardExtends extends "Sales Invoice"
{
    layout
    {
        addafter(General)
        {
            group("Invoice Text")
            {
            field("Begining Text ;"; Rec."Begining Text;")
            {
                ApplicationArea = All;
                trigger OnValidate()
                var
                SalesHeaderRec: Record "Sales Header";
                ExtTextHandler: Codeunit "Sales Invoice SubpageHelper";
                begin
                SalesHeaderRec := Rec;
                ExtTextHandler.LoadExtendedTextLines(SalesHeaderRec);
                end;
            }
            field("End Text"; Rec."End Text")
            {
                ApplicationArea = All;
                trigger OnValidate()
                var
                SalesHeaderRec: Record "Sales Header";
                ExtTextHandler: Codeunit "Sales Invoice SubpageHelper";
                begin
                SalesHeaderRec := Rec;
                ExtTextHandler.LoadExtendTextlinesEnd(SalesHeaderRec);
                end;
            }
            }
        }
        addafter("Invoice Text")
        {
                part("Description Part"; "Description Page")
                {
                    ApplicationArea = All;
                    Caption = 'Beginning Text';
                    SubPageLink = "Document No." = field("No."),type= const(Beinning);
                    
                }
                part("End Part"; "Sales Invoice Endtext")
                {
                    ApplicationArea = All;
                    Caption = 'End Text';
                    SubPageLink = "Document No." = field("No."),type= const(ending);
                    
                }
        }
    }

}
    