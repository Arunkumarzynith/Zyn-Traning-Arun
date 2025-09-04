tableextension 50100 SalesInvoiceCard extends "Sales Header"
{
    fields
    {
        field(50100; "Begining Text;"; Text[100])
        {
            Caption = 'Beginning Text';
            TableRelation = "Standard Text".Code;
        }
        field(50101; "End Text"; Text[100])
        {
            Caption = 'End Text';
            TableRelation = "Standard Text".Code;
        }
        field(50102; "End Invoice Text"; Text[100])
        {
            Caption = 'End Invoice Text';
            TableRelation = "Standard Text".Code;
        }
        field(50103; "Beginning Invoice  Text"; Text[100])
        {
            Caption = 'Beginning Invoice  Text';
            TableRelation = "Standard Text".Code;
        }
        field(50104; "Last Sold Prize"; Decimal)
        {
            caption = 'Last sold Prize' ;
            FieldClass = FlowField;
            CalcFormula = max("Last Sold Prize".ItemPrize Where (CustomerNo= field("Sell-to Customer No.") 
                , "Posting date" = field("Latest posting date")));
        }
        field(50105; "Latest posting date"; Date)
        {
            Caption = 'Latest Posting Date';
            FieldClass = FlowField;
            CalcFormula = max("Last Sold Prize". "Posting date" Where (CustomerNo= field("Sell-to Customer No.")));
        }
        field(50000; "Subscription ID"; Code[20])
        {
            Caption = 'Subscription ID';
            DataClassification = CustomerContent;
        }
        


    }
    trigger OnAfterDelete()
    var
        SubpageextRec: Record "Description table";
    begin
        SubpageextRec.SetRange("Document Type", Rec."Document Type");
        SubpageextRec.SetRange("Document No.", Rec."No.");
        if not SubpageextRec.IsEmpty then
            SubpageextRec.DeleteAll();
    end;

}