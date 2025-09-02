codeunit 50281 "Leave Management"
{
    procedure ApproveLeaveRequest(var LeaveReq: Record "Leave Request")
    var
        LeaveCat: Record "leave Category";
        LeaveLog: Record "Employee Leave Log";
        DaysTaken: Integer;
        TotalUsed: Integer;
    begin
        // Calculate leave days
        DaysTaken := LeaveReq."To Date" - LeaveReq."From Date" + 1;
        if DaysTaken <= 0 then
            Error('Invalid leave period. To Date must be after From Date.');

        // Get Leave Category
        if not LeaveCat.Get(LeaveReq.Category) then
            Error('Leave category %1 not found.', LeaveReq.Category);

        // Calculate how many days already taken from this category for this employee
        TotalUsed := 0;
        LeaveLog.Reset();
        LeaveLog.SetRange("Emp Id.", LeaveReq."Emp Id.");
        LeaveLog.SetRange(Category, LeaveReq.Category);
        if LeaveLog.FindSet() then
            repeat
                TotalUsed += LeaveLog."No. of Days";
            until LeaveLog.Next() = 0;

        // Check allowed vs taken
        if (TotalUsed + DaysTaken) > LeaveCat."NO.of days allowed" then
            Error('Leave request exceeds allowed days (%1) for category %2. Currently used: %3, Requested: %4',
                LeaveCat."NO.of days allowed", LeaveReq.Category, TotalUsed, DaysTaken);

        // Insert into Lo
        LeaveLog.Init();
        LeaveLog."Entry No.":= 0; // Auto-increment
        LeaveLog."Emp Id." := LeaveReq."Emp Id.";
        LeaveLog."Category" := LeaveReq.Category;
        LeaveLog."Leave From Date" := LeaveReq."From Date";
        LeaveLog."Leave To Date" := LeaveReq."To Date";
        LeaveLog."No. of Days" := DaysTaken;
        LeaveLog.Insert();

        // Update Request
        LeaveReq."No.of days" := DaysTaken;
        LeaveReq."Remaining Days" := LeaveCat."NO.of days allowed" - (TotalUsed + DaysTaken);
        LeaveReq.Status := LeaveReq.Status::Approved;
        LeaveReq.Modify(true);
    end;
}



codeunit 50101 "My Notification Actions"
{
    procedure OpenLeaveBalance(Notification: Notification)
    var
        LeavePage: Page "Leave Req List page"; // Your page here
    begin
        LeavePage.Run();
    end;
}


codeunit 50170 "My Notification Mgt."
{
    procedure ShowLeaveBalanceNotification()
    var
        Notification: Notification;
        LeaveRec: Record "Leave Request";
        EmplRec: Record "Employ Table";
         // replace with your table
    begin
        if LeaveRec.FindSet() then
            repeat
                Notification.Message :=
                    StrSubstNo('Hello %1, current leave request status is  for Employee ID: %3',
                               LeaveRec."Emp Id.",
                             LeaveRec.Status

                            );
 
                Notification.Scope := NotificationScope::LocalScope;
 
            
 
                Notification.Send();
            until LeaveRec.Next() = 0;
    end;
}