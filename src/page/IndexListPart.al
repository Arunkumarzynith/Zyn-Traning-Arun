page 50159 "Index ListPart"
{
    PageType = ListPart;
    SourceTable = "Index Calc";
    ApplicationArea =All;
    Caption = 'Index Table';
    Editable= false;
    // InsertAllowed = false;
    // DeleteAllowed = false;

    
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(year;Rec.year)
                {
                    ApplicationArea = All;
                    Caption = 'Year';
                }
                
                field(value;Rec.value)
                {
                    ApplicationArea = all;
                    Caption = 'value';
                }
                
                
            }
        }
    }
}