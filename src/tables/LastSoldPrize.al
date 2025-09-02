table 50133 "Last Sold Prize"
{
    Caption = 'Last Sold Prize';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "CustomerNO"; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = CustomerContent;
        }
        field(2; "ItemNo."; Code[20])
        {
            Caption = 'ItemNo.';
            DataClassification = CustomerContent;
        }
        field(3; ItemPrize; Decimal)
        {
            Caption = 'Item Prize';
            DataClassification = CustomerContent;
        }
        field(4; "Posting date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(5; "Entry No."; Integer){
            Caption = 'entry No.';
            AutoIncrement = true;
        }
       
    }

    keys
    {
        key(PK;  "ItemNo.", "CustomerNo")
        {
            Clustered = true;
        }
        
    }

    
    
}