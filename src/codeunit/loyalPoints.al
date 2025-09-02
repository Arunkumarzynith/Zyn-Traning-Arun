codeunit 50139 "Loyal Points"
{


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostSalesDoc', '', true, true)]
    local procedure OnBeforePostSalesDoc(var SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean; PreviewMode: Boolean; var HideProgressWindow: Boolean; var IsHandled: Boolean; var CalledBy: Integer)
    var
        CustomerRec: Record Customer;
    begin
        if (SalesHeader."Document Type" in [SalesHeader."Document Type"::Invoice, SalesHeader."Document Type"::Order]) then begin



        if CustomerRec.Get(SalesHeader."Sell-to Customer No.") then begin
            if CustomerRec."Loyality points used" >= CustomerRec."Loyality points allowed " then
                Error('Cannot post invoice. Loyalty points limit (%1) reached for this customer.', CustomerRec."Loyality points allowed ");
        end;
    end;
    end;
}

codeunit 50140 "Loyal Points Update"
{


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', true, true)]
    // local procedure OnAfterPostSalesDoc(var SalesHeader: Record "Sales Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; SalesShptHdrNo: Code[20]; RetRcpHdrNo: Code[20]; SalesInvHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20]; CommitIsSuppressed: Boolean; InvtPickPutaway: Boolean; var CustLedgerEntry: Record "Cust. Ledger Entry"; WhseShip: Boolean; WhseReceiv: Boolean; PreviewMode: Boolean)
    // var
    //     CustomerRec: Record Customer;
    // begin
    //     if (SalesHeader."Document Type" in [SalesHeader."Document Type"::Invoice, SalesHeader."Document Type"::Order]) then begin

    //         if CustomerRec.Get(SalesHeader."Sell-to Customer No.") then begin
    //             CustomerRec."Loyality points used" += 10;
    //             CustomerRec.Modify();
    //         end;
    //     end;
    // end;


    local procedure OnAfterPostSales(var SalesHeader: Record "Sales Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; SalesShptHdrNo: Code[20]; RetRcpHdrNo: Code[20]; SalesInvHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20]; CommitIsSuppressed: Boolean; InvtPickPutaway: Boolean; var CustLedgerEntry: Record "Cust. Ledger Entry"; WhseShip: Boolean; WhseReceiv: Boolean; PreviewMode: Boolean)
    var
        SalesInvoiceLine: Record "Sales Invoice Line";
        LastSoldPrice: Record "Last Sold Prize";
        PostedInvoice: Record "Sales invoice Header";
    begin
        if SalesInvHdrNo <> '' then begin
            if PostedInvoice.Get(SalesInvHdrNo) then
                  SalesInvoiceLine.SetRange("Document No.", PostedInvoice."No.");
                if SalesInvoiceLine.FindSet() then
            repeat
                LastSoldPrice.Init();
                LastSoldPrice.CustomerNo := SalesInvoiceLine."Sell-to Customer No.";
                LastSoldPrice."ItemNo.":= SalesInvoiceLine."No.";
                LastSoldPrice.ItemPrize := SalesInvoiceLine."Unit Price";
                LastSoldPrice."Posting date" := PostedInvoice."Posting Date";
                LastSoldPrice.Insert(true);
            until SalesInvoiceLine.Next() = 0;
    end;end;
}