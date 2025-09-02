page 50115 "Sales Invoice Endtext"
{
    PageType = ListPart;
    SourceTable = "Description table";
    Editable = false;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No."; rec."line.no")
                {
                    ApplicationArea = All;
                    Caption = 'Line No.';
                }
                field(Text; rec."Text")
                {
                    ApplicationArea = All;
                    Caption = 'Text';
                }
 
            }
        }
    }
}