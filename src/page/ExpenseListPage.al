page 50131 "Expense List Page"
{
    PageType = List;
    SourceTable = "Expense Table";
    ApplicationArea = All;
    Caption = 'Expense List';
    CardPageID = "Expense Card Page";
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Expense ID"; Rec."Expense ID")
                {
                    ApplicationArea = All;
                }
                field("Description"; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Amount"; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field("Date"; Rec.Date)
                {
                    ApplicationArea = All;
                }
                field("Category"; Rec.Category)
                {
                    ApplicationArea = All;
                }
                
            }
        }
        area(factboxes)
        {
            part("Budget Fact box"; BudgetListPart)
            {
                ApplicationArea = All;
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
                    Page.Run(Page::"Category List Page");
                end;
            }

            action(ExportToExcel)
            {
                ApplicationArea = All;
                Caption = 'Export Expenses to Excel';
                Image = Export;

                trigger OnAction()
                begin
                    Report.RunModal(Report::"Expense Export Report", true, true);
                end;
            }
        }
    }

    }
