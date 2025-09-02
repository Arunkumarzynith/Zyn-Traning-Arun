page 50231 "Income List Page"
{
    PageType = List;
    SourceTable ="Income table";
    ApplicationArea = ALL;
    Caption = 'Income List';
    CardPageID = "Income Card Page";
    UsageCategory = "Lists";
    InsertAllowed = false;
    ModifyAllowed = false;
 
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Income ID"; Rec."Income ID")
                {
                    ApplicationArea = All;
                }
                field("Description"; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Amount";Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field("Date"; Rec.Date)
                {
                    ApplicationArea = All;
                }
                field("Category";Rec.Category)
                {
                    ApplicationArea = All;
                }
                field("Category name"; Rec."Category Name")
                {
                    ApplicationArea = All;
                }
               
 
            }
        }
    }
   
    actions
    {
        area(processing)
        {
            action(SelectCategory)
            {
                ApplicationArea = All;
                Caption = 'Category Selection';
                Image = New;
                trigger OnAction()
                begin
                    Page.Run(Page::"Income Category Card Page");
                end;
            }
 
            action(ExportToExcel)
            {
            ApplicationArea = All;
            Caption = 'Export Expenses to Excel';
            Image = Export;
 
            trigger OnAction()
            // var
            //     ExportReport: Report "Expense Export Report";
            //     FromDate: Date;
            //     ToDate: Date;
            //     Category: Code[100];
            //     ExpenseRec: Record "Expense Table";
            //     ExcelBuf: Record "Excel Buffer" temporary;
            //     RowNo: Integer;
            begin
                Report.RunModal(Report::"Income Export Report", true, true);
            end;
                // Open filter dialog
            //         if Report.RunModal(Report::"Expense Export Report", true, true, ExportReport) = Action::OK then begin
            //         // Get filters from report
            //         ExportReport.GetFilters(FromDate, ToDate, Category);
            //         ExpenseRec.Reset();
            //         if FromDate <> 0D then
            //             ExpenseRec.SetRange(Date, FromDate, ToDate);
            //         if Category <> '' then
            //             ExpenseRec.SetRange(Category, Category);
 
            //         if ExpenseRec.FindSet() then begin
                       
            //             ExcelBuf.DeleteAll();
            //             RowNo := 1;
            //             // Header row
            //             ExcelBuf.NewRow();
            //             ExcelBuf.AddColumn('Expense ID', false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
            //             ExcelBuf.AddColumn('Description', false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
            //             ExcelBuf.AddColumn('Amount', false, '', false, false, false, '', ExcelBuf."Cell Type"::Number);
            //             ExcelBuf.AddColumn('Date', false, '', false, false, false, '', ExcelBuf."Cell Type"::Date);
            //             ExcelBuf.AddColumn('Category', false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
 
            //             repeat
            //                 ExcelBuf.NewRow();
            //                 ExcelBuf.AddColumn(ExpenseRec."Expense ID", false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
            //                 ExcelBuf.AddColumn(ExpenseRec.Description, false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
            //                 ExcelBuf.AddColumn(Format(ExpenseRec.Amount), false, '', false, false, false, '', ExcelBuf."Cell Type"::Number);
            //                 ExcelBuf.AddColumn(ExpenseRec.Date, false, '', false, false, false, '', ExcelBuf."Cell Type"::Date);
            //                 ExcelBuf.AddColumn(ExpenseRec.Category, false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
            //             until ExpenseRec.Next() = 0;
 
            //             // Create Excel file
            //             ExcelBuf.CreateNewBook('Expenses');
            //             ExcelBuf.WriteSheet('Expenses', CompanyName, UserId);
            //             ExcelBuf.CloseBook();
            //             ExcelBuf.OpenExcel();
            //         end else
            //             Message('No expenses found for selected filters.');
            //     end;
           
        }
 
        }
   
    }
   
   
}