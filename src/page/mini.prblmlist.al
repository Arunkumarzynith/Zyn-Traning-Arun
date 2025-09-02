page 50144 "Problem card"
{
    PageType = Card;
    SourceTable = "problems";
    ApplicationArea = All;
    Caption = 'Problems List';
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            Group(Group)
            {
                field("Customer No."; Rec."customer.no")
                {
                    ApplicationArea = All;
                }
                field("Problem"; Rec."Problem")
                {
                    ApplicationArea = All;
                }
                field("Dept"; Rec."Dept")
                {
                    ApplicationArea = All;
                }
                field("Technician ID"; Rec."Technician ID")
                {
                    ApplicationArea = All;
                }
                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    
}