codeunit 50128 "Beginning Text Transfer"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterSalesInvHeaderInsert', '', true, true)]
    local procedure OnAfterSalesInvHeaderInsert(var SalesInvHeader: Record "Sales Invoice Header"; SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean; WhseShip: Boolean; WhseReceive: Boolean; var TempWhseShptHeader: Record "Warehouse Shipment Header"; var TempWhseRcptHeader: Record "Warehouse Receipt Header"; PreviewMode: Boolean)
    var
        CustomExtText: Record "Description table";
        PostedExtText: Record "Description table";
    begin
        SalesInvHeader."Beginning Text" := SalesHeader."Begining Text;";
        // Copy to Posted Extended Text Table
        CustomExtText.SetRange("Document No.", SalesHeader."No.");
        CustomExtText.SetRange("type", CustomExtText."type"::Beinning);
            repeat
                
                PostedExtText.Init();
                PostedExtText.TransferFields(CustomExtText);
                PostedExtText."Document No." := SalesInvHeader."No.";
                PostedExtText.Type:= CustomExtText."type"::Beinning;
                PostedExtText."Document Type" := SalesHeader."Document Type"::"posted invoice";
                PostedExtText."line.no" := CustomExtText."line.no";
                PostedExtText."Text" := CustomExtText."Text";
                PostedExtText.Insert();
            until CustomExtText.Next() = 0;
 
        // Delete from ExtendedTextTable
        CustomExtText.SetRange("Document No.", SalesHeader."No.");
        CustomExtText.SetRange("type", CustomExtText."type"::Beinning);
            CustomExtText.DeleteAll();
    end;
}
 
 codeunit 50129 "Ending Text Transfer"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterSalesInvHeaderInsert', '', true, true)]
    local procedure OnAfterSalesInvHeaderInsert(var SalesInvHeader: Record "Sales Invoice Header"; SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean; WhseShip: Boolean; WhseReceive: Boolean; var TempWhseShptHeader: Record "Warehouse Shipment Header"; var TempWhseRcptHeader: Record "Warehouse Receipt Header"; PreviewMode: Boolean)
    var
        CustomExtText: Record "Description table";
        PostedExtText: Record "Description table";
    begin
        SalesInvHeader."End Text" := SalesHeader."End Text";
        // Copy to Posted Extended Text Table
        CustomExtText.SetRange("Document No.", SalesHeader."No.");
        CustomExtText.SetRange("type", CustomExtText."type"::  Ending);
            repeat
                
                PostedExtText.Init();
                PostedExtText.TransferFields(CustomExtText);
                PostedExtText."Document No." := SalesInvHeader."No.";
                PostedExtText.Type:= CustomExtText."type"::Ending;
                PostedExtText."Document Type" := SalesHeader."Document Type"::"posted invoice";
                PostedExtText."line.no" := CustomExtText."line.no";
                PostedExtText."Text" := CustomExtText."Text";
                PostedExtText.Insert();
            until CustomExtText.Next() = 0;
 
        // Delete from ExtendedTextTable
        CustomExtText.SetRange("Document No.", SalesHeader."No.");
        CustomExtText.SetRange("type", CustomExtText."type"::Ending);
            CustomExtText.DeleteAll();
    end;
}
 