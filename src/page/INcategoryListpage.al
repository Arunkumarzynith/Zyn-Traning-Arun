page 50247 " Income Category List Page"
{
    PageType = List;
    SourceTable =" INC Category Table";
    ApplicationArea = ALL;
    Caption = 'Income Category List';
    CardPageID = "Income Category Card Page";
    UsageCategory = "Lists";
    InsertAllowed = false;
    ModifyAllowed = false;
 
    layout
    {
         area(content)
        {
            repeater(Group)
            {
                field("Category ID"; Rec."Category ID")
                {
                    ApplicationArea = All;
                }
                field("Name"; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Description";Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }
        area(factboxes)
        {
            part(CategoryIncomeFactbox; "Category Income FactBox")
            {
                SubPageLink = Name = field(Name); // Link FactBox to selected category
                ApplicationArea = All;
            }
        }
    }
}