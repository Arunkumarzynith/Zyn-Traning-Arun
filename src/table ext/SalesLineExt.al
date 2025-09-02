tableextension 50119 SalesLineExt extends "Sales Line"
{
    trigger OnInsert()
    begin
        CheckCustomerCreditLimit();
    end;

    trigger OnModify()
    begin
        CheckCustomerCreditLimit();
    end;

    local procedure CheckCustomerCreditLimit()
    var
        CustomerRec: Record Customer;
    begin
        if "Sell-to Customer No." = '' then
            exit;

        if CustomerRec.Get("Sell-to Customer No.") then begin
            CustomerRec.CalcFields("Credits Used");


            if (CustomerRec."Credits Used" + "Amount") > CustomerRec."Credits Allowed" then
                Error(
                    'Credit limit exceeded for customer %1. Used: %2, Allowed: %3',
                    CustomerRec."No.", CustomerRec."Credits Used" + "Amount", CustomerRec."Credits Allowed");
        end;
    end;
}