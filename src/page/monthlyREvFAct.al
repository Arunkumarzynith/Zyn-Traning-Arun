page 50221 "Monthly Revenue FactBox"
{
    PageType = CardPart;
    ApplicationArea = All;
    Caption = 'Revenue This Month';

    layout
    {
        area(content)
        {
            field("Revenue (This Month)"; GetMonthlyRevenue())
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }

    local procedure GetMonthlyRevenue(): Decimal
    var
        SalesLine: Record "Sales Invoice Line";
        StartDate: Date;
        EndDate: Date;
        Total: Decimal;
    begin
        StartDate := DMY2DATE(1, DATE2DMY(TODAY,2), DATE2DMY(TODAY,3));
        EndDate := CALCDATE('<CM>', StartDate);

        SalesLine.Reset();
        SalesLine.SetRange("Posting Date", StartDate, EndDate);
        if SalesLine.FindSet() then
            repeat
                Total += SalesLine.Amount;
            until SalesLine.Next() = 0;

        exit(Total);
    end;
}
