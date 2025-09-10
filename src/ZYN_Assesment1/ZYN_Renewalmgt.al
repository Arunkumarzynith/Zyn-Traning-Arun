codeunit 50220 "Renewal Notification Mgt"
{
    Subtype = Normal;

    trigger OnRun()
    var
        SubRec: Record "Subscription table";
    begin
        SubRec.Reset();
        SubRec.SetRange(Status, SubRec.Status::Active);
        SubRec.SetRange("Renewal Notified", false);

        if SubRec.FindSet() then
            repeat
                // 🔹 Check if subscription expires in exactly 15 days
                if (SubRec."EndDate" = (WorkDate() + 15)) then begin
                    // Show notification
                    SendNotification(SubRec);

                    // Mark as notified
                    SubRec."Renewal Notified" := true;
                    SubRec.Modify(true);
                end;
            until SubRec.Next() = 0;
    end;

    local procedure SendNotification(var SubRec: Record "Subscription table")
    var
        Notification: Notification;
    begin
        Notification.Id := CreateGuid();
        Notification.Message :=
          StrSubstNo('⚠️ Subscription %1 for Customer %2 is expiring on %3. Please renew soon.',
            SubRec."SubID", SubRec."CustomerID", Format(SubRec."EndDate"));
        Notification.Scope := NotificationScope::LocalScope;
        Notification.Send();
    end;
}
