page 50234 "Income Category Card Page"
{
    PageType = Card;
    SourceTable = " INC Category Table";
    ApplicationArea = ALL;
    Caption = 'Category Card';
 
    layout
    {
        area(content)
        {
            group(general)
            {
                field("Category ID"; Rec."Category ID")
                {
                    ApplicationArea = All;
                }
                field("Name"; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Description"; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}