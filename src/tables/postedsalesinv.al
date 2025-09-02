table 50123 "Posted Extended Text Table"
{
    DataClassification = CustomerContent;
 
    fields
    {
        field(1; "Document No."; Code[20]) { }
        field(2; "Line No."; Integer) { }
        field(3; "Text"; Text[100]) { }
        field(4; "Document Type"; enum "Sales Document Type") { }
 
    }
 
    keys
    {
        key(PK; "Document No.", "Line No.", "Text") { Clustered = true; }
    }
}