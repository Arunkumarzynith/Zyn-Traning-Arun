page 50209 Zyn_Rolecentre
{
    PageType = RoleCenter;
    ApplicationArea = All;
    Caption = 'Role Centre';
    SourceTable = Customer;
    // layout
    // {
    //     area(RoleCenter)
    //     {
    //         group(Controlgroup)
    //         {
    //             Caption = 'Customer Dashboard';
    //         }
    //         part(Cues; "customer cue card")
    //         {
    //             ApplicationArea = All;
    //         }
    //     }
    // }
    actions
    {
        area(embedding)
        {
 
            action("Customers")
            {
                ApplicationArea = All;
 
                Caption = 'Customer list';
                RunObject = page "Customer list";
            }
 
        }
        area(sections)
        {
            group("Assets")
            {
                Caption = 'Assets';
 
                action("Asset List")
                {
                    Caption = 'Asset List';
                    ApplicationArea = All;
                    RunObject = page "Asset List";
                }
                action("Employee List")
                {
                    Caption = 'Employee List';
                    ApplicationArea = All;
                    RunObject = page "Employee List";
                }
 
                action("Employee Assets")
                {
                    Caption = 'Employee Assets';
                    ApplicationArea = All;
                    RunObject = page "EmpAssetList";
                }
            }
            group("Leave Management")
            {
                Caption='Leave Management';
                action("Leave Category")
                {
                    Caption = 'Asset List';
                    ApplicationArea = All;
                    RunObject = page "Leave Cat List page";
                }
                action("Leave Request")
                {
                    Caption = 'Asset List';
                    ApplicationArea = All;
                    RunObject = page "Leave Req List page";
                }
            }
            group("Expenses")
            {
                Caption='Expenses';
                action("Expense Category")
                {
                    Caption = 'Asset List';
                    ApplicationArea = All;
                    RunObject = page "Category List Page";
                }
                action("Expense List")
                {
                    Caption = 'Asset List';
                    ApplicationArea = All;
                    RunObject = page "Expense List Page";
                }
                action("Recurring Expense")
                {
                    Caption='Recurring Expense';
                    ApplicationArea=All;
                    RunObject=page Recurringpage;
                }
            }
            group("Budget~Income")
            {
                Caption='Budget~Income';
                action("Budget List")
                {
                    Caption = 'Budget List';
                    ApplicationArea = All;
                    RunObject = page "Budget List Page";
                }
                action("Income Category")
                {
                    Caption = 'Income Category';
                    ApplicationArea = All;
                    RunObject = page " Income Category List Page";
                }
                action("Income List")
                {
                    Caption = 'Income List';
                    ApplicationArea = All;
                    RunObject = page "Income List Page";
                }
            }
        }
    }
    var
        CustomerRec: Record Customer;
 
}
 
 