page 50147 "Category List Page"
{
    PageType = List;
    SourceTable ="Category table";
    ApplicationArea = ALL;
    Caption = 'Expense Category List';
    CardPageID = "Category Card Page";
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
            part(CategoryExpenseFactbox; "Category Expense FactBox")
            {
                SubPageLink = Name = field(Name); // Link FactBox to selected category
                ApplicationArea = All;
            }
            part("Budget Fact box"; "category Budget FactBox")
            {
                SubPageLink = Name = field(Name); 
                ApplicationArea = All;  
                
            }   
            
        }
        
        
    }
}