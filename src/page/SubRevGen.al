page 50427 "Subscription Cue Card"
{
    PageType = CardPart;
    ApplicationArea = All;
    Caption = 'Subscription Dashboard';

    layout
    {
        area(content)
        {
            cuegroup(Subscriptions)
            {
                Caption = 'Subscriptions';

                field("Active Subscriptions"; ActiveSub)
                {
                    ApplicationArea = All;
                    DrillDown = true;
                    trigger OnDrillDown()
                    var
                        SubRec: Record "Subscription Table";
                    begin
                        SubRec.SetRange(Status, SubRec.Status::Active);
                        Page.Run(Page::"Subscription List", SubRec);
                    end;
                }

                field("Subscription Revenue This Month"; RevenueThisMonth)
                {
                    ApplicationArea = All;
                    DrillDown = true;
                    trigger OnDrillDown()
                    var
                        SalesHdr: Record "Sales Header";
                        StartDate: Date;
                        EndDate: Date;
                    begin
                        StartDate := DMY2Date(1, Date2DMY(WorkDate(), 2), Date2DMY(WorkDate(), 3));
                        EndDate := WorkDate();

                        SalesHdr.SetRange("Document Type", SalesHdr."Document Type"::Invoice);
                        SalesHdr.SetRange("Document Date", StartDate, EndDate);
                        SalesHdr.SetFilter("Subscription ID", '<>%1', ''); 

                        Page.Run(Page::"Sales Invoice List", SalesHdr);
                    end;
                }
            }
        }
    }

    var
        ActiveSub: Integer;
        RevenueThisMonth: Decimal;

    trigger OnOpenPage()
    var
        SubRec: Record "Subscription Table";
        SalesHdr: Record "Sales Header";
        StartDate: Date;
        EndDate: Date;
        totalamnt:Decimal;
    begin
        // Active subscriptions
        SubRec.SetRange(Status, SubRec.Status::Active);
        ActiveSub := SubRec.Count();

        // Revenue this month
        StartDate := DMY2Date(1, Date2DMY(WorkDate(), 2), Date2DMY(WorkDate(), 3));
        EndDate := WorkDate();

        SalesHdr.SetRange("Document Type", SalesHdr."Document Type"::Invoice);
        SalesHdr.SetRange("Document Date", StartDate, EndDate);
        SalesHdr.SetFilter("Subscription ID", '<>%1', '');
        totalamnt:=0;
        if SalesHdr.FindSet() then begin
            SalesHdr.CalcFields(Amount);
            repeat

             totalamnt+=SalesHdr.Amount;
            until SalesHdr.Next()=0
        end;

        

        RevenueThisMonth := totalamnt;
    end;
}