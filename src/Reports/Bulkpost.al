report 50102 "Bulk Post Sales Invoices"
{
    ProcessingOnly = true;
    UsageCategory = Tasks;
    ApplicationArea = All;
    Caption = 'Bulk Post Sales Invoices';

    dataset
    {
        dataitem(SalesHeader; "Sales Header")
        {
            DataItemTableView = where("Document Type" = const(Invoice));

            // Allow filtering by Customer or Invoice No.

            trigger OnAfterGetRecord()
            var
                SalesPost: Codeunit "Sales-Post";
            begin
                
                    SalesPost.Run(SalesHeader);
                    PostedCount += 1;
                
            end;
        }
    }

    trigger OnPostReport()
    begin
        Message('%1 sales invoices have been posted successfully.', PostedCount);
    end;

    var
        PostedCount: Integer;
}
