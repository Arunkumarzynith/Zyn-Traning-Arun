page 50257 "Category Budget FactBox"
{
    PageType = CardPart;
    SourceTable = "Category Table";
    ApplicationArea = All;
    Caption = 'Category Budget Summary';
 
    layout
    {
        area(content)
        {
            
            cuegroup(Summary)
            {
                field(CurrentMonth; CurrMonthBudget)
                {
                    ApplicationArea = All;
                    Caption = 'Current Month';
                    trigger OnDrillDown()
                    begin
                        OpenBudgetList(1);
                    end;
                }
                field(CurrentQuarter; CurrQuarterBudget)
                {
                    ApplicationArea = All;
                    Caption = 'Current Quarter';
                    trigger OnDrillDown()
                    begin
                        OpenBudgetList(2);
                    end;
                }
                field(CurrentHalfYear; CurrHalfYearBudget)
                {
                    ApplicationArea = All;
                    Caption = 'Current Half-Year';
                    trigger OnDrillDown()
                    begin
                        OpenBudgetList(3);
                    end;
                }
                field(CurrentYear; CurrYearBudget)
                {
                    ApplicationArea = All;
                    Caption = 'Current Year';
                    trigger OnDrillDown()
                    begin
                        OpenBudgetList(4);
                    end;
                }
                field(PrevYear; PrevYearBudget)
                {
                    ApplicationArea = All;
                    Caption = 'Previous Year';
                    trigger OnDrillDown()
                    begin
                        OpenBudgetList(5);
                    end;
                }
 
            }
        }
    }
 
    var
        BudgetRec: Record "Budget Table";
        CurrMonthBudget: Decimal;
        CurrQuarterBudget: Decimal;
        CurrHalfYearBudget: Decimal;
        CurrYearBudget: Decimal;
        PrevYearBudget: Decimal;
        CatRemainingBudget: Decimal;
        
 
    trigger OnAfterGetRecord()
    var
        StartDate: Date;
        EndDate: Date;
        CurrMonth: Integer;
        CurrQuarter: Integer;
        CurrYear: Integer;
        WorkDt: Date;
        PrevYear: Integer;
    begin
        Clear(CurrMonthBudget);
        Clear(CurrQuarterBudget);
        Clear(CurrHalfYearBudget);
        Clear(CurrYearBudget);
        Clear(PrevYearBudget);
        Clear(CatRemainingBudget);
 
        WorkDt := WorkDate();
        CurrYear := Date2DMY(WorkDt, 3);
        CurrMonth := Date2DMY(WorkDt, 2);
        CurrQuarter := (CurrMonth - 1) div 3 + 1;
        PrevYear := CurrYear - 1;
 
    
        
 
        // 🔹 Previous Year
        StartDate := DMY2Date(1, 1, PrevYear);
        EndDate := DMY2Date(31, 12, PrevYear);
        PrevYearBudget := GetBudgetTotal(Rec.Name, StartDate, EndDate);
 
        // 🔹 Current Month
        StartDate := DMY2Date(1, CurrMonth, CurrYear);
        EndDate := CalcDate('<CM>', StartDate);
        CurrMonthBudget := GetBudgetTotal(Rec.Name, StartDate, EndDate);
 
        // 🔹 Current Quarter
        StartDate := DMY2Date(1, (CurrQuarter - 1) * 3 + 1, CurrYear);
        EndDate := CalcDate('<CQ>', StartDate);
        CurrQuarterBudget := GetBudgetTotal(Rec.Name, StartDate, EndDate);
 
        // 🔹 Current Half-Year
        if CurrMonth <= 6 then begin
            StartDate := DMY2Date(1, 1, CurrYear);
            EndDate := DMY2Date(30, 6, CurrYear);
        end else begin
            StartDate := DMY2Date(1, 7, CurrYear);
            EndDate := DMY2Date(31, 12, CurrYear);
        end;
        CurrHalfYearBudget := GetBudgetTotal(Rec.Name, StartDate, EndDate);
 
        // 🔹 Current Year
        StartDate := DMY2Date(1, 1, CurrYear);
        EndDate := DMY2Date(31, 12, CurrYear);
        CurrYearBudget := GetBudgetTotal(Rec.Name, StartDate, EndDate);
    end;
 
    local procedure GetBudgetTotal(CategoryName: Code[100]; StartDate: Date; EndDate: Date): Decimal
var
        TempBudget: Record "Budget table";
    begin
        TempBudget.Reset();
        TempBudget.SetRange(Category, CategoryName);
        TempBudget.SetFilter("From Date", '<=%1', EndDate);
        TempBudget.SetFilter("To date ", '>=%1', StartDate);
        TempBudget.CalcSums(Amount);
        exit(TempBudget.Amount);
    end;
 
    local procedure OpenBudgetList(d: Integer)
    var
        BudgetList: Page "Budget List Page";
        StartDate: Date;
        EndDate: Date;
        CurrMonth: Integer;
        CurrQuarter: Integer;
        CurrYear: Integer;
        PrevYear: Integer;
        WorkDt: Date;
    begin
        WorkDt := WorkDate();
        CurrYear := Date2DMY(WorkDt, 3);
        CurrMonth := Date2DMY(WorkDt, 2);
        CurrQuarter := (CurrMonth - 1) div 3 + 1;
        PrevYear := CurrYear - 1;
 
        case d of
            1:
                begin
                    StartDate := DMY2Date(1, CurrMonth, CurrYear);
                    EndDate := CalcDate('<CM>', StartDate);
                end;
            2:
                begin
                    StartDate := DMY2Date(1, (CurrQuarter - 1) * 3 + 1, CurrYear);
                    EndDate := CalcDate('<CQ>', StartDate);
                end;
            3:
                begin
                    if CurrMonth <= 6 then begin
                        StartDate := DMY2Date(1, 1, CurrYear);
                        EndDate := DMY2Date(30, 6, CurrYear);
                    end else begin
                        StartDate := DMY2Date(1, 7, CurrYear);
                        EndDate := DMY2Date(31, 12, CurrYear);
                    end;
                end;
            4:
                begin
                    StartDate := DMY2Date(1, 1, CurrYear);
                    EndDate := DMY2Date(31, 12, CurrYear);
                end;
            5:
                begin
                    StartDate := DMY2Date(1, 1, PrevYear);
                    EndDate := DMY2Date(31, 12, PrevYear);
                end;
        end;
 
        BudgetRec.Reset();
        BudgetRec.SetRange("Category", Rec.Name);
        BudgetRec.SetFilter("From Date", '<=%1', EndDate);
        BudgetRec.SetFilter("To date ", '>=%1', StartDate);
        BudgetList.SetTableView(BudgetRec);
        BudgetList.Run();
    end;
}
 