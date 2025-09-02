report 50145 "Yearly Budget vs Expense"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Yearly Budget vs Expense';
    ProcessingOnly = true;   // Only Excel Export

    dataset
    {
        // Empty because we are using Excel Buffer
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                field(Year; Year)
                {
                    ApplicationArea = All;
                    Caption = 'Enter Year';
                }
            }
        }
    }

    var
        Year: Integer;
        MonthName: Text[20];
        BudgetRec: Record "Budget Table";
        ExpenseRec: Record "Expense Table";
        CategoryRec: Record "Category Table"; // ✅ Replace with your actual category table
        ExcelBuf: Record "Excel Buffer" temporary;
        Month: Integer;
        BudgetAmt: Decimal;
        ExpenseAmt: Decimal;

    trigger OnPostReport()
    var
        MonthStart: Date;
        MonthEnd: Date;
    begin
        
        ExcelBuf.AddColumn('Month', false, '', true, false, false, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Category', false, '', true, false, false, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Budget Amount', false, '', true, false, false, '', ExcelBuf."Cell Type"::Number);
        ExcelBuf.AddColumn('Expense Amount', false, '', true, false, false, '', ExcelBuf."Cell Type"::Number);
        ExcelBuf.NewRow();

        
        // Loop Through 12 Months 
        
        for Month := 1 to 12 do begin
            MonthStart := DMY2Date(1, Month, Year);
            MonthEnd := CalcDate('<CM>', MonthStart);
            MonthName := Format(MonthStart, 0, '<Month Text>');

            // Loop through all categories
            CategoryRec.Reset();
            if CategoryRec.FindSet() then
                repeat
                    // Budget Calculation per category per month
                    BudgetAmt := 0;
                    BudgetRec.Reset();
                    BudgetRec.SetRange("Category");  // ✅ replace with actual category field
                    BudgetRec.SetRange("From date", MonthStart, MonthEnd);
                    if BudgetRec.FindSet() then
                        repeat
                            BudgetAmt += BudgetRec.Amount; // ✅ replace Amount with actual field
                        until BudgetRec.Next() = 0;

                    // Expense Calculation per category per month
                    ExpenseAmt := 0;
                    ExpenseRec.Reset();
                    ExpenseRec.SetRange("Category"); // ✅ replace with actual category field
                    ExpenseRec.SetRange(Date, MonthStart, MonthEnd);
                    if ExpenseRec.FindSet() then
                        repeat
                            ExpenseAmt += ExpenseRec.Amount; // ✅ replace Amount with actual field
                        until ExpenseRec.Next() = 0;

                    // Add row → show Month only in the first category row
                    ExcelBuf.AddColumn(MonthName, false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
                    ExcelBuf.AddColumn(CategoryRec.Name, false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
                    ExcelBuf.AddColumn(BudgetAmt, false, '', false, false, false, '', ExcelBuf."Cell Type"::Number);
                    ExcelBuf.AddColumn(ExpenseAmt, false, '', false, false, false, '', ExcelBuf."Cell Type"::Number);
                    ExcelBuf.NewRow();

                    // Blank Month for subsequent category rows
                    MonthName := '';
                until CategoryRec.Next() = 0;
        end;

        // =========================
        // Generate Excel (Cloud Safe)
        // =========================
        ExcelBuf.CreateNewBook('Yearly Budget vs Expense');
        ExcelBuf.WriteSheet('Budget vs Expense', CompanyName, UserId);
        ExcelBuf.CloseBook();
        ExcelBuf.SetFriendlyFilename('Yearly Budget vs Expense.xlsx');
        ExcelBuf.OpenExcel();
    end;
}
