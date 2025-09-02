report 50101 "Update Posting Date"
{
    ProcessingOnly = true;
    UsageCategory = Tasks;
    ApplicationArea = All;
    Caption = 'Update Posting Date';
    dataset
    {
        dataitem(SalesHeader; "Sales Header")
        {
            DataItemTableView = where("Document Type" = const(Order));

            trigger OnAfterGetRecord()
            begin
                if SalesHeader.Status = SalesHeader.Status::Open then begin
                    SalesHeader."Posting Date" := NewPostingDate;
                    SalesHeader.Modify();
                    UpdatedCount += 1;
                end;
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group("Posting Date Update")
                {
                    field(NewPostingDate; NewPostingDate)
                    {
                        ApplicationArea = All;
                        Caption = 'New Posting Date';
                    }
                }
            }
        }
    }

    trigger OnPostReport()
    begin
        Message('%1 open Sales Orders were updated successfully.', UpdatedCount);
    end;

    var
        NewPostingDate: Date;
        UpdatedCount: Integer;
}
