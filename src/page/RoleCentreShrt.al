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
    layout
{
    area(rolecenter)
    {
        // Other groups & parts…

        part(ZynSubCue; "Subscription Cue Card")
        {
            ApplicationArea = All;
        }
    }
}

   


    
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
                    Caption = 'Leave Category';
                    ApplicationArea = All;
                    RunObject = page "Leave Cat List page";
                }
                action("Leave Request")
                {
                    Caption = 'Leave Request';
                    ApplicationArea = All;
                    RunObject = page "Leave Req List page";
                }
            }
            group("Expenses")
            {
                Caption='Expenses';
                action("Expense Category")
                {
                    Caption = 'Expense Category';
                    ApplicationArea = All;
                    RunObject = page "Category List Page";
                }
                action("Expense List")
                {
                    Caption = 'Expense List';
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
            group("Billing~Subscription")
            {
                Caption='Budget~Income';
                action("plan list")
                {
                    Caption = 'Budget List';
                    ApplicationArea = All;
                    RunObject = page "Budget List Page";
                }
                action("SubscriptionList")
                {
                    Caption = 'Income Category';
                    ApplicationArea = All;
                    RunObject = page " Income Category List Page";
                }
                
        }
    }
    }
    var
        CustomerRec: Record Customer;
 
}
 
 // it is the monthly based subcription plan  so that if i give the start date then the end date will be the same date but we could not define the months example if one customer is should give date like 1.1.2025 to 1.11.2025 that shouild be same date but month should be differ so we need to validate the date only after that we have to create a recurring invoice in the business central there is option called job queue enteries using that we have to create a un posted sales invoice that should check daliy if the next billing date in today then it should create a unposted sales invoice  that in the sales header the doucment type is invoice that time we aslo  need a boolean to check whether the invoice is created from the subcription or not 