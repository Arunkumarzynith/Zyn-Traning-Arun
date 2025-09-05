page 50208 "Plan List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Plan Table";
    CardPageId = 50210;
    InsertAllowed = false;
    ModifyAllowed = false;
    layout
    {
        area(Content)
        {
            repeater(PlanList)
            {
                field(PlanID;Rec."Plan ID") 
                {
                     ApplicationArea = All; 
                }
                field(Name;Rec.Name) 
                {
                     ApplicationArea = All; 
                }
                field(Fee;Rec.Fee)
                {
                    ApplicationArea=All;
                }
                field(Status;Rec.Status)
                {
                    ApplicationArea=All;
                }
            }
        }
    }
}