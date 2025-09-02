pageextension 50108 SalesInvoiceListExt extends "Sales Invoice List"
{
    actions
    {
        addlast(Processing)
        {
            action(BulkPostSalesInvoices)
            {
                ApplicationArea = All;
                Caption = 'Bulk Post';
                Image = Post;

                trigger OnAction()
                var
                    ReportSelection: Report "Bulk Post Sales Invoices";
                begin
                    Report.RunModal(Report::"Bulk Post Sales Invoices", true, true);
                end;
            }
        }
    }
}
