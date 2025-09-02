report 50144 "Sales Invoice RDLC"
{
    Caption = 'Sales Invoice RDLC';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'Reports\SalesInvoiceReport.rdlc';

    dataset
    {
        dataitem("Company Information"; "Company Information")
        {
            column(Name; Name) { }
            column(Address; Address) { }
            column(Picture; Picture) { }

            dataitem("SalesHeader"; "Sales Invoice Header")
            {
                column("DocumentNo"; "No.") { }
                column("CustomerNo"; "Sell-to Customer No.") { }
                column("CustomerName"; "Sell-to Customer Name") { }
                column("PostingDate"; "Posting Date") { }
                column("DocumentDate"; "Document Date") { }

                // Merged text columns
                column(BeginTextMerged; GetBeginText()) { }
                column(EndTextMerged; GetEndText()) { }

                dataitem("Sales Line"; "Sales Invoice Line")
                {
                    DataItemLink = "Document No." = field("No.");
                    column("ItemNo"; "No.") { }
                    column(Description; Description) { }
                    column(Quantity; Quantity) { }
                    column(Amount; Amount) { }
                }
                dataitem("Legder entry"; "Cust. Ledger Entry")
                {
                    DataItemLink = "Customer No." = field("Sell-to Customer No."),
                                   "Document No." = field("No.");

                    column(CLE_Description; Description) { }
                    column(CLE_Amount; Amount) { }
                    column(CLE_RemainingAmt; "Remaining Amount") { }
                }
            }
        }
    }

    var
        ExtTextRec: Record "Description table";

    local procedure GetBeginText(): Text
    var
        TempText: Text;
    begin
        Clear(TempText);
        ExtTextRec.Reset();
        ExtTextRec.SetRange("Document No.", "SalesHeader"."No.");
        ExtTextRec.SetRange("Document Type", ExtTextRec."Document Type"::"Posted Invoice");
        ExtTextRec.SetRange(Type, ExtTextRec.Type::Beinning); // Fix spelling if needed
        if ExtTextRec.FindSet() then
            repeat
                if TempText <> '' then
                    TempText += '\r\n'; // New line for RDLC
                TempText += DelChr(ExtTextRec.Text, '<>', ' '); // Trim spaces
            until ExtTextRec.Next() = 0;

        exit(TempText);
    end;

    local procedure GetEndText(): Text
    var
        TempText: Text;
    begin
        Clear(TempText);
        ExtTextRec.Reset();
        ExtTextRec.SetRange("Document No.", "SalesHeader"."No.");
        ExtTextRec.SetRange("Document Type", ExtTextRec."Document Type"::"Posted Invoice");
        ExtTextRec.SetRange(Type, ExtTextRec.Type::Ending);
        if ExtTextRec.FindSet() then
            repeat
                if TempText <> '' then
                    TempText += '\r\n';
                TempText += DelChr(ExtTextRec.Text, '<>', ' ');
            until ExtTextRec.Next() = 0;

        exit(TempText);
    end;


}
