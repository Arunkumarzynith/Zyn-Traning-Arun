table 50392 "Subscription table"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; SubID; Integer) { DataClassification = ToBeClassified; }
        field(2; CustomerID; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
        }
        field(3; PlanID; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Plan Table".PlanID;
            trigger OnValidate()
            var
                PlanRec: Record "Plan Table";
            begin
                if PlanRec.Get(PlanID) then begin
                    if PlanRec.Status <> PlanRec.Status::Active then
                        Error('You can only subscribe to an active plan (%1).', PlanID);
                end else
                    Error('Plan %1 not found.', PlanID);
            end;

        }
        field(4; StartDate; Date)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                // Whenever StartDate changes, recalc EndDate and NextBilling (if Duration set)
                UpdateDates();
            end;
        }
        field(8; Duration; Integer)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                // Duration is in months
                UpdateDates();
            end;
        }
        field(5; EndDate; Date) { DataClassification = ToBeClassified; }
        field(6; Status; Enum "Subcription Status") { DataClassification = ToBeClassified; }
        field(7; NextBilling; Date) { DataClassification = ToBeClassified; }
    }

    keys
    {
        key(PK; SubID, PlanID)
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        // Ensure dates & status initialized
        UpdateDates();
        UpdateStatus();
    end;

    trigger OnModify()
    begin
        // After any change, ensure status reflects EndDate vs WorkDate
        UpdateStatus();
    end;

    local procedure UpdateDates()
    var
        Expr: Text[30];
    begin
        // Compute EndDate: StartDate + Duration months
        if (StartDate <> 0D) and (Duration > 0) then begin
            Expr := StrSubstNo('<+%1M>', Format(Duration));
            EndDate := System.CalcDate(Expr, StartDate);
            // Next billing initial value: first billing after start = StartDate + 1 month
            // Only set NextBilling if blank (so we don't overwrite after billing runs)
            if NextBilling = 0D then
                NextBilling := System.CalcDate('<+1M>', StartDate);
        end;
    end;

    local procedure UpdateStatus()
    var
        WD: Date;
    begin
        // Get current WorkDate (session). If not set, WorkDate returns today's date.
        WD := System.WorkDate();
        if (EndDate <> 0D) and (EndDate <= WD) then
            Status := Status::Active
        else
            // If not expired and StartDate set, mark active
            if (StartDate <> 0D) then
                Status := Status::Active;
    end;

    // call this to advance NextBilling by +1 month after a run
    local procedure AdvanceNextBilling()
    begin
        if NextBilling <> 0D then
            NextBilling := System.CalcDate('<+1M>', NextBilling);
    end;
}