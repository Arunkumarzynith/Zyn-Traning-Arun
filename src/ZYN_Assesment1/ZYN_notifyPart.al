
page 50367 "renewNotification"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "subscription table"; 

    layout
    {
        area(content)
        {
            group(Group)
            {
                field(UserID; UserId())
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage();
    var
        NotificationMgt: Codeunit "Renewal Notification Mgt";
    begin
        NotificationMgt.Run();
    end;
}