page 50239 "Budget List Page"
{
    PageType = List;
    SourceTable = "Budget Table";
    ApplicationArea = All;
    Caption = 'Budget List';
    CardPageID = "Budget Card Page";
    UsageCategory = "Lists";
    InsertAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("BUdget ID"; Rec."BUdget ID")
                {
                    ApplicationArea = All;
                }
                field("Amount"; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field("From date"; Rec."From date")
                {
                    ApplicationArea = All;
                }
                field("To date"; Rec."To date ")
                {
                    ApplicationArea = All;
                }
                field("Category "; Rec."Category")
                {
                    ApplicationArea = All;
                }
            }
        }
        
    }
}