page 50547 "techincian sub page"
{
    PageType = ListPart;
    SourceTable = "problems";
    ApplicationArea = All;
    Caption = 'Problems Sub Page';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Customer.No"; Rec."customer.no")
                {
                    ApplicationArea = All;
                }
                field("Customer.Name"; Rec."customer name")
                {
                    ApplicationArea = All;
                }
                field("problem"; Rec.Problem)
                {
                    ApplicationArea = All;
                }
                field("Description"; Rec.Description)
                {
                    ApplicationArea = All;
                }
                
                field("date"; Rec.Date)
                {
                    ApplicationArea = All;
                }
                
            }
        }
    }

}