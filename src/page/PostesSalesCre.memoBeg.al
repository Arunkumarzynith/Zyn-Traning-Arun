page 50114 "Beginning Cre Text ListPart"
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

page 50118 "End Extended Cre Text ListPart"
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