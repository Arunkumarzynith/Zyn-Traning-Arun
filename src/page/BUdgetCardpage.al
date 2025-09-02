page 50240 "Budget Card Page"
{
    PageType = Card;
    SourceTable = "Budget Table";
    Caption = 'Budget Card';
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(Group)
            {
                field("Budget ID"; Rec."Budget ID")
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
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

    trigger OnNewRecord(BelowxRec: Boolean)
begin
    // First day of the Work Date's month
    Rec."From date" := CALCDATE('<-CM>', WorkDate());

    // Last day of the Work Date's month
    Rec."To date " := CALCDATE('<CM>', WorkDate());
end;

}
