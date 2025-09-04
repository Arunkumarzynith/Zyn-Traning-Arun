page 50210 PlanCard
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "Plan Table";

    layout
    {
        area(Content)
        {
            group(PlanCard)
            {
                field(PlanID;Rec.PlanID) 
                { 
                    ApplicationArea = All; 
                }
                field(Name;Rec.Name) 
                { 
                    ApplicationArea = All; 
                }
                field(Fee;Rec.Fee) 
                { 
                    ApplicationArea = All; 
                }
                field(Status;Rec.Status) 
                { 
                    ApplicationArea = All; 
                }
            }
        }
    }
}