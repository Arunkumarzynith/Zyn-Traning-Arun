page 50154 "Technician List"
{
    PageType = List;
    SourceTable = "technician";
    ApplicationArea = All;
    Caption = 'Technician List';
    CardPageId = "Mini Tech Card";

    layout
    {
        area(Content)
        {
            group("Technicians")
            {
            repeater(Group)
            {
                field("ID"; Rec."Tech ID")
                {
                    ApplicationArea = All;
                }
                field("name"; Rec."Tech Name")
                {
                    ApplicationArea = All;
                }
                field("deparment"; Rec."department")
                {
                    ApplicationArea = All;
                }
                field("ph.no"; Rec."ph.no")
                {
                    ApplicationArea = All;
                }
                field("Count"; Rec.Count)
                {
                    ApplicationArea = All;
                }
            }
            }
            part("Technician Sub Page"; "techincian sub page")
            {
                ApplicationArea = All;
                Caption = 'Problems';
                SubPageLink = "Technician ID" = field("Tech ID");
            }
        }
    }
}