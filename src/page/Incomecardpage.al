page 50346 "Income Card Page"
{
    PageType = Card;
    SourceTable ="Income Table";
    ApplicationArea = ALL;
    Caption = 'Income Card';
 
    layout
    {
        area(content)
        {
            group(general)
            {
                field("Expense ID"; Rec."Income ID")
                {
                    ApplicationArea = All;
                }
                field("Description";Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Amount"; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field("Date"; Rec.Date)
                {
                    ApplicationArea = All;
                }
                 field("Category"; Rec."Category")
                {
                    ApplicationArea = All;
                }
               
            }
 
        }
 
    }
    actions
    {
        area(processing)
        {
            action(SelectCategory)
            {
                ApplicationArea = All;
                Caption = 'Category Selection';
                Image = New;
                trigger OnAction()
                begin
                    Page.Run(Page::" Income Category List Page");
                end;
            }
        }
       
    }
   
}
 

 