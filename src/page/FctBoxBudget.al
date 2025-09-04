page 50190 BudgetListPart
{
    PageType = Listpart;
    ApplicationArea = All;
    SourceTable = "Budget Table";
    Editable = false;
    layout
    {
        area(Content)
        {
            repeater(BudgetList)
            {
                field(BudgetID; Rec."BUdget ID") { ApplicationArea = All; }
                field(Category; Rec.Category) { ApplicationArea = All; }
                field(Amount; Rec.Amount) { ApplicationArea = All; }
                field(FromDate; Rec."From date") { ApplicationArea = All; }
                field(ToDate; Rec."To date ") { ApplicationArea = All; }
            }
        }
       
    }
 
}
 