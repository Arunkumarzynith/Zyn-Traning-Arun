page 50157 "Index Table"
{
    PageType = List;
    SourceTable = "Index Table";
    ApplicationArea =All;
    Caption = 'Index Table';
    UsageCategory=lists;
    CardPageId=50160;
    InsertAllowed = false;
    ModifyAllowed = false;
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(code;Rec.code)
                {
                    ApplicationArea = All;
                    Caption = 'code';

                }
                field(Description;Rec.Description)
                {
                    ApplicationArea = all;
                    Caption = 'Description';
                }
                field(StartYear;Rec.StartYear)
                {
                    ApplicationArea = all;
                    Caption = 'start Year';
                }
                field(EndYear;Rec.EndYear)
                {
                    ApplicationArea = all;
                    Caption = 'End Year';
                }
                field(PerINc;Rec.PerINc)
                {
                    ApplicationArea = all;
                    Caption = 'Percentage Increase';
                }
            }
        }
    }
}