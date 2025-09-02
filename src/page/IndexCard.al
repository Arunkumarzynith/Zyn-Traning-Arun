page 50160 "Index Card"
{
    PageType = Card;
    SourceTable = "Index Table";
    ApplicationArea = All;
    Caption = 'Index Table';
    Editable = true;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(StartYear; Rec.StartYear)
                {
                    ApplicationArea = All;
                }
                field(EndYear; Rec.EndYear)
                {
                    ApplicationArea = All;
                }
                field(PerINc; Rec.PerINc)
                {
                    ApplicationArea = All;
                }
            }

            part(IndexValues; "Index ListPart")
            {
                ApplicationArea = All;
                SubPageLink = Code = FIELD(Code);
            }
        }
    }
}
