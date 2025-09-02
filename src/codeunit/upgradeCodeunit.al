codeunit 50135 "Upgrade Last Sold Prize"
{
    Subtype = Upgrade;

    trigger OnUpgradePerCompany()
    var
        SalesInvoiceLine: Record "Sales Invoice Line";
        SalesInvHeader: Record "Sales Invoice Header";
        LastSoldPrice: Record "Last Sold Prize";
    begin
        // Go through all posted sales invoice lines
        if SalesInvoiceLine.FindSet() then
            repeat
               
                if SalesInvHeader.Get(SalesInvoiceLine."Document No.") then begin
                    LastSoldPrice.Reset();
                    LastSoldPrice.SetRange("CustomerNo", SalesInvoiceLine."Sell-to Customer No.");
                    LastSoldPrice.SetRange("ItemNo.", SalesInvoiceLine."No.");

                    if LastSoldPrice.FindFirst() then begin
                        // Update existing record with latest price & date
                        LastSoldPrice.ItemPrize := SalesInvoiceLine."Unit Price";
                        LastSoldPrice."Posting date" := SalesInvHeader."Posting Date";
                        LastSoldPrice.Modify(true);
                    end else begin
                        // Insert if missing
                        LastSoldPrice.Init();
                        LastSoldPrice."CustomerNo" := SalesInvoiceLine."Sell-to Customer No.";
                        LastSoldPrice."ItemNo." := SalesInvoiceLine."No.";
                        LastSoldPrice.ItemPrize := SalesInvoiceLine."Unit Price";
                        LastSoldPrice."Posting date" := SalesInvHeader."Posting Date";
                        LastSoldPrice.Insert(true);
                    end;
                end;
            until SalesInvoiceLine.Next() = 0;
    end;
}
