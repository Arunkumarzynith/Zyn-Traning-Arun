page 50127 "Beginning Credit Text ;"
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