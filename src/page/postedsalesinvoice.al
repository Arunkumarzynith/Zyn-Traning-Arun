page 50113 "Beginning Text ListPart"
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
                field("Document No."; rec."Document No.")
                {
                    ApplicationArea = All;
                    Caption = 'Document No.';
                }
                
 
            }
        }
    }
}

page 50117 "End Extended Text ListPart"
{
    PageType = ListPart;
    SourceTable = "Posted Extended Text Table";
    Editable = false;
 
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No."; rec."Line No.")
                {
                    ApplicationArea = All;
                    Caption = 'Line No.';
                }
                field(Text; rec."Text")
                {
                    ApplicationArea = All;
                    Caption = 'Text';
                }
                field("Document No."; rec."Document No.")
                {
                    ApplicationArea = All;
                    Caption = 'Document No.';
                }
                
 
            }
        }
    }
}