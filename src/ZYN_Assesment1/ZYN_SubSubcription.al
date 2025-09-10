table 50392 "Subscription table"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; SubID; Integer) 
        {
             DataClassification = ToBeClassified; 
        }   
        field(2; CustomerID; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
        }
        field(3; "Plan ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Plan Table"."Plan ID";
            trigger OnValidate()
            var
                PlanRec: Record "Plan Table";
            begin
                if PlanRec.Get("Plan ID") then begin
                    if PlanRec.Status <> PlanRec.Status::Active then
                        Error('You can only subscribe to an active plan (%1).', "Plan ID");
                end else
                    Error('Plan %1 not found.', "Plan ID");
            end;

        }
        field(4; StartDate; Date)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin

                UpdateDates();
            end;
        }
        field(8; Duration; Integer)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
            
                UpdateDates();
            end;
        }
        field(5; EndDate; Date) 
        {
             DataClassification = ToBeClassified;
         }
        field(6; Status; Enum "Subcription Status") 
        {
             DataClassification = ToBeClassified;
        }
        field(7; NextBilling; Date) 
        {
             DataClassification = ToBeClassified; 
        }
        field(9; "Next Renewal date"; Date)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
    begin
        if ("Next Renewal date" <= "EndDate") then
            Error('Next Renewal Date must be after End Date.');
    end;
        }
        field(10; "renewal notified"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Renewal Notified';
            InitValue = false;
        }
    }

    keys
    {
        key(PK; SubID, "Plan ID")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        // Ensure dates & status initializedfor the UI
        UpdateDates();
        UpdateStatus();
    end;

    trigger OnModify()
    begin

        UpdateStatus();
    end;

    local procedure UpdateDates()
    var
        Expr: Text[30];
    begin
        
        if (StartDate <> 0D) and (Duration > 0) then begin
            Expr := StrSubstNo('<+%1M>', Format(Duration));
            EndDate := System.CalcDate(Expr, StartDate);
            
            if NextBilling = 0D then
                NextBilling := System.CalcDate('<+1M>', StartDate);
        end;
    end;

    local procedure UpdateStatus()
    var
        WD: Date;
    begin
        // Get the  current WorkDate (session). If not set, WorkDate returns today's date.
        WD := System.WorkDate();
        if (EndDate <> 0D) and (EndDate <= WD) then
            Status := Status::Active
        else
            // If not expired and StartDate set, mark active
            if (StartDate <> 0D) then
                Status := Status::Active;
    end;

    // call  to advance NextBilling by +1 month after a run
    local procedure AdvanceNextBilling()
    begin
        if NextBilling <> 0D then
            NextBilling := System.CalcDate('<+1M>', NextBilling);
    end;
}