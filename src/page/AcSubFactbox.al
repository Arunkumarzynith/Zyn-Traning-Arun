page 50220 "Active Subscriptions FactBox"
{
    PageType = CardPart;
    ApplicationArea = All;
    Caption = 'Active Subscriptions';
    SourceTable = "Subscription table";

    layout
    {
        area(content)
        {
            field("Active Subscriptions"; GetActiveSubscriptionCount())
            {
                ApplicationArea = All;
                DrillDown = true;
                DrillDownPageId = "Subscription List";
            }
        }
    }

    local procedure GetActiveSubscriptionCount(): Integer
    var
        SubRec: Record "Subscription table";
    begin
        SubRec.Reset();
        SubRec.SetRange(Status, SubRec.Status::Active);
        exit(SubRec.Count);
    end;
}
