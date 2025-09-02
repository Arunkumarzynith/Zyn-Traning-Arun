page 50145 "Description Page"
{
    PageType = ListPart;
    SourceTable = "Description table";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("line.no"; Rec."line.no")
                {
                    ApplicationArea = All;

                }
                field("Text"; Rec."Text")
                {
                    ApplicationArea = All;
                }



            }


        }
    }


}