page 50107 "Mini Tech Card"
{
    PageType = Card;
    SourceTable = "technician";
    ApplicationArea = All;
    Caption = 'Technician Card';

    layout
    {
        area(Content)
        {
            Group(Group)
            {
                field("ID"; Rec."Tech ID")
                {
                    ApplicationArea = All;
                }
                field("Name"; Rec."Tech Name")
                {
                    ApplicationArea = All;
                }
                field("Department"; Rec."department")
                {
                    ApplicationArea = All;
                }
                field("Phone No."; Rec."ph.no")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}