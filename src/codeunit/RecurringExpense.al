codeunit 50239 "Recurring Expense Mgt"
{
    Subtype = Normal;
    SingleInstance = false;

    trigger OnRun()
    begin
        ProcessRecurringExpenses();
    end;

    local procedure ProcessRecurringExpenses()
    var
        RecurringExp: Record "Recurring Expense";
        ExpenseList: Record "Expense Table"; // <-- Replace with your actual expense table name
        NextDate: Date;
    begin
        RecurringExp.Reset();
        if RecurringExp.FindSet() then begin
            repeat
                // Check if Next Cycle Date is due or overdue
                if (RecurringExp."Next Cycle date" = 0D ) then begin
                    // Insert into Expense L
                    RecurringExp.Init();
                    ExpenseList."Expense ID" := GetNextEntryNo(); 
                    RecurringExp."Next Cycle date":=recurringExp."Start Date";
                    ExpenseList."Category" := RecurringExp.Category;
                    ExpenseList.Amount := RecurringExp.Amount;
                    RecurringExp."Start Date" := Today;
                    ExpenseList.Insert(true);

                    // Calculate next cycle date based on recurrence pattern
                    case RecurringExp."Recurrence Pattern" of
                        "Recurrence Pattern"::Halfyearly:
                            NextDate := CalcDate('1D', RecurringExp."Next Cycle date");
                        "Recurrence Pattern"::Weekly:
                            NextDate := CalcDate('1W', RecurringExp."Next Cycle date");
                        "Recurrence Pattern"::Monthly:
                            NextDate := CalcDate('1M', RecurringExp."Next Cycle date");
                        "Recurrence Pattern"::Yearly:
                            NextDate := CalcDate('1Y', RecurringExp."Next Cycle date");
                    end;

                    // Update Recurring Record
                    RecurringExp."Next Cycle date" := NextDate;
                    RecurringExp.Modify(true);
                end;
            until RecurringExp.Next() = 0;
        end;
    end;

    local procedure GetNextEntryNo(): Integer
    var
        ExpenseList: Record "Recurring Expense";
    begin
        if ExpenseList.FindLast() then
            exit(ExpenseList."Entry No." + 1)
        else
            exit(1);
    end;
}
