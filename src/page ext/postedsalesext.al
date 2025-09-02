

pageextension 50110 "Posted Sales Invoice Ext" extends "Posted Sales Invoice"

{

    layout
    {

        addafter(General)

        {

            group("Invoice Texts")

            {

                field("Beginning Text"; Rec."Beginning Text") // Add field in table extension too

                {

                    ApplicationArea = All;

                    Editable = false;

                }
                field("End Text"; Rec."End Text") // Add field in table extension too

                {

                    ApplicationArea = All;

                    Editable = false;

                }
 
                part("Extended Text Lines"; "Beginning Text ListPart") // your custom listpart

                {

                    ApplicationArea = All;

                    SubPageLink = "Document No." = field("No."),Type =const(Beinning);

                

                }
                part("Sales Invoice Endtext"; "Sales Invoice Endtext")
                {
                    ApplicationArea = All;
                    Caption = 'Posted End Text';
                    SubPageLink = "Document No." = field("No."),type = const(ending);
                }
                

            }

        }

    }

}

 