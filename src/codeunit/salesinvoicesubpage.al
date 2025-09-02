codeunit 50123 "Sales Invoice SubpageHelper"
{
    procedure LoadExtendedTextLines(SalesHeader: Record "Sales Header")
    var
        ExtTextHeader: Record "Extended Text Header";
        ExtTextLine: Record "Extended Text Line";
        CustomExtText: Record "Description table";
        CustomerRec: Record Customer;
        LangCode: Code[10];
 
    begin
        // Delete existing lines for this document
        CustomExtText.SetRange("Document No.", SalesHeader."No.");
        CustomExtText.SetRange("type", CustomExtText."type"::Beinning);
            CustomExtText.DeleteAll();
 
        // Get Language Code from Customer or default to 'ENU'
        if CustomerRec.Get(SalesHeader."Sell-to Customer No.") then
            LangCode := CustomerRec."Language Code";

                // Filter lines from Extended Text Line table
                ExtTextLine.SetRange("No.", SalesHeader."Begining Text;");
                ExtTextLine.SetRange("Language Code", LangCode);
 
                if ExtTextLine.FindSet() then begin
                    repeat
                        CustomExtText.Init();
                        CustomExtText."Document No." := SalesHeader."No.";
                        CustomExtText."type" := CustomExtText."type"::Beinning;
                        CustomExtText."line.no" := ExtTextLine."Line No.";
                        CustomExtText."Text" := ExtTextLine.Text;
                        CustomExtText.Insert();
                    until ExtTextLine.Next() = 0;
                end;
    end;
    procedure LoadExtendTextlinesEnd(SalesHeader: Record "Sales Header")
    var
        ExtTextHeader: Record "Extended Text Header";
        ExtTextLine: Record "Extended Text Line";
        CustomExtText: Record "Description table";
        CustomerRec: Record Customer;
        LangCode: Code[10];
 
    begin
        // Delete existing lines for this document
        CustomExtText.SetRange("Document No.", SalesHeader."No.");
        CustomExtText.SetRange("type", CustomExtText."type"::Ending);
            CustomExtText.DeleteAll();
 
        // Get Language Code from Customer or default to 'ENU'
        if CustomerRec.Get(SalesHeader."Sell-to Customer No.") then
            LangCode := CustomerRec."Language Code";

                // Filter lines from Extended Text Line table
                ExtTextLine.SetRange("No.", SalesHeader."End Text");
                ExtTextLine.SetRange("Language Code", LangCode);
 
                if ExtTextLine.FindSet() then begin
                    repeat
                        CustomExtText.Init();
                        CustomExtText."Document No." := SalesHeader."No.";
                        CustomExtText."type" := CustomExtText."type"::Ending;
                        CustomExtText."line.no" := ExtTextLine."Line No.";
                        CustomExtText."Text" := ExtTextLine.Text;
                        CustomExtText.Insert();
                    until ExtTextLine.Next() = 0;
                end;
    end;
    
}