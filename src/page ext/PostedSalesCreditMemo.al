

pageextension 50134 "Posted Sales Credit Ext" extends "Posted Sales Credit Memo"

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
 
                part("Extended Text Lines"; "Beginning Cre Text ListPart") // your custom listpart

                {

                    ApplicationArea = All;

                    SubPageLink = "Document No." = field("No."),Type =const(Beinning);

                

                }
                part("Sales Invoice Endtext"; "End Extended Cre Text ListPart")
                {
                    ApplicationArea = All;
                    Caption = 'Posted End Text';
                    SubPageLink = "Document No." = field("No."),Type = const(ending);
                }
                

            }

        }

    }

}

 