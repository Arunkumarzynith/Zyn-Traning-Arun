page 50137 "modify log list"
{
    PageType = List;
    SourceTable = "Modify Log";
    ApplicationArea = All;
    InsertAllowed = false;
    Editable = false;
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Customer No."; Rec."Customer No")
                {
                    ApplicationArea = All;

                }
                field("Old value"; Rec."old Value")
                {
                    ApplicationArea = All;

                }
                field("New value"; Rec."New Value")
                {
                    ApplicationArea = All;

                }
                field("user id "; Rec."user id")
                {
                    ApplicationArea = All;

                }
            }
        }
    }
}