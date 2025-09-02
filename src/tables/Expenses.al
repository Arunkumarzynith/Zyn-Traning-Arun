table 50163 "Expense Table"
{
    DataClassification = ToBeClassified;
 
    fields
    {
        field(1; "Expense ID"; Integer) { DataClassification = ToBeClassified; }
        field(2; Description; Text[50]) { DataClassification = ToBeClassified; }
        field(3; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Remaining: Decimal;
            begin
                Remaining := RemainingBudget();
                if Amount > Remaining then
                    Error('You cannot exceed the remaining monthly budget. Remaining: %1', Remaining);
            end;
        }
        field(4; Date; Date) { DataClassification = ToBeClassified; }
        field(5; Category; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Category Table".Name;
        }
        field(6; "Remaining Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Budget Table".Amount where(Category = field(Category)));
        }
    }
 
   procedure RemainingBudget(): Decimal
var
    BudgetRec: Record "Budget Table";
    ExpenseRec: Record "Expense Table";
    PeriodExpense: Decimal;
    CurrentDate: Date;
begin
    // Use record Date if available, otherwise WorkDate
    if Date <> 0D then
        CurrentDate := Date
    else
        CurrentDate := WorkDate();
 
    BudgetRec.Reset();
    BudgetRec.SetRange(Category, Category);
    BudgetRec.SetFilter("From date", '<=%1', CurrentDate);
    BudgetRec.SetFilter("To date ", '>=%1', CurrentDate);
 
    if BudgetRec.FindFirst() then begin
        ExpenseRec.Reset();
        ExpenseRec.SetRange(Category, Category);
        ExpenseRec.SetRange("Date", BudgetRec."From date", BudgetRec."To date ");
 
        if ExpenseRec.FindSet() then
            repeat
                if ExpenseRec."Expense ID" <> "Expense ID" then
                    PeriodExpense += ExpenseRec.Amount;
            until ExpenseRec.Next() = 0;
 
        exit(BudgetRec.Amount - PeriodExpense);
    end;
 
    exit(0);
end;
 
}
 