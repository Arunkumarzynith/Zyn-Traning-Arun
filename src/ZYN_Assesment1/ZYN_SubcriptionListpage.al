page 50211 "Subscription List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Subscription Table";
    CardPageId = 50312;
    //Editable=false;
    InsertAllowed = false;
    ModifyAllowed = false;
    layout
    {
        area(Content)
        {
            repeater("Subscription List")
            {
                field("Sub ID";Rec.SubID) 
                { 
                    ApplicationArea = All; 
                }
                field("Customer ID";Rec.CustomerID) 
                {
                     ApplicationArea = All; 
                }
                field(PlanID;Rec."Plan ID")
                {
                    ApplicationArea=All;
                }
                field("Start Date"; Rec.StartDate)
                {
                    ApplicationArea=All;
                }
                field(Duration;Rec.Duration)
                {
                    ApplicationArea=All;
                }
                field("End Date"; Rec.EndDate)
                {
                    ApplicationArea=All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea=All;
                }
                field("Next Billing"; Rec.NextBilling)
                {
                    ApplicationArea=All;
                }
            }
        }
    }
}