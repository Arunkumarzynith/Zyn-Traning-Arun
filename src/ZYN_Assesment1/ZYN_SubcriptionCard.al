page 50312 "Subscription Card"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "Subscription table";

    layout
    {
        area(Content)
        {
            group(SubscriptionCard)
            {
                field(SubID;Rec.SubID) 
                { 
                    ApplicationArea = All; 
                }
                field(CustomerID;Rec.CustomerID) 
                { 
                    ApplicationArea = All; 
                }
                field(PlanID;Rec."Plan ID") 
                { 
                    ApplicationArea = All; 
                }
                field(StartDate;Rec.StartDate) 
                { 
                    ApplicationArea = All; 
                }
                field(Duration;Rec.Duration)
                {
                    ApplicationArea=All;
                }
                field(EndDate;Rec.EndDate)
                {
                    ApplicationArea=All;
                }
                field(Status;Rec.Status)
                {
                    ApplicationArea=All;
                }
                field(NextBilling;Rec.NextBilling)
                {
                    ApplicationArea=All;
                }
                field("Next Renewal date"; Rec."Next Renewal date")
                {
                    ApplicationArea=All;
                }
                field("renewal notified"; Rec."renewal notified")
                {
                    ApplicationArea=All;
                }
            }
        }
    }
}