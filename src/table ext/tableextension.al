tableextension 50115 CustomerExt extends Customer
{
    fields
    {
        field(50106; "Credits Allowed"; Decimal)
        {
            Caption = 'Credits Allowed';
            DataClassification = CustomerContent;
        }

        field(50101; "Credits Used"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Sales Line"."Amount"
                WHERE("Sell-to Customer No." = FIELD("No.")));
            Caption = 'Credits Used';
            Editable = false;
        }
        field(50000; "Start Date"; Date)
        {
            FieldClass = FlowFilter;
            Caption = 'Start Date';
        }

        field(50002; "Invoice Amount in Range"; Decimal)
        {
            FieldClass = FlowField;
            Caption = 'Invoice Amount in Range';
            CalcFormula = Sum("Cust. Ledger Entry".Amount
                              WHERE("Customer No." = FIELD("No."),
                                    "Posting Date" = field("Start Date")));
        }
        field(50003; "Loyality points allowed "; Integer)
        {
            
        }
        field(50004; "Loyality points used"; Integer)
        {
            
        }
    }

    trigger OnBeforeModify()
    var
        RecRef, xRecRef : RecordRef;
        FieldRef, xFieldRef : FieldRef;
        LogEntry: Record "Modify Log";
        i: Integer;
        FieldName: Text;
    begin
        RecRef.GetTable(Rec);
        xRecRef.GetTable(xRec);

        for i := 1 to RecRef.FieldCount do begin
            FieldRef := RecRef.FieldIndex(i);
            xFieldRef := xRecRef.FieldIndex(i);
            FieldName := FieldRef.Name;
            begin
                if Format(FieldRef.Value) <> Format(xFieldRef.Value) then begin
                    LogEntry.Init();

                    LogEntry."Entry No" := 0;
                    LogEntry."Customer No" := Rec."No.";
                    LogEntry."Old Value" := Format(XFieldRef.Value);
                    LogEntry."New Value" := Format(FieldRef.Value);
                    LogEntry."User ID" := UserId();
                    LogEntry.Insert();
                end;
            end;
        end;
    end;
}


tableextension 50145 customersextension extends Item
{
    fields
    {
        field(50110; "current inventory"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("No.")));
        }
    }
}
tableextension 50120 PruchaseApprovalExt extends "Purchase Header"
{
    fields
    {
        field(50104; "Approval Status"; Enum Microsoft.Purchases.Document."Approval status")
        {
            FieldClass = FlowField;
            CalcFormula = Max("Purchase Header"."Approval Status"
                WHERE("No." = FIELD("No.")));
        }
    }
}
