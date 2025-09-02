table 50148 "Description table"
{
    DataClassification = CustomerContent;
    fields
    {
        field(1; "line.no"; Integer)
        {
            Caption = 'Line No.';
            DataClassification = SystemMetadata;
            }
        field(2; "Text"; Text[100])
        {
            Caption = 'Text';
            DataClassification = CustomerContent;
        }
        field(3; "launguage code"; Code[10])
        {
            Caption = 'Language Code';
            DataClassification = CustomerContent;
            //TableRelation = Language where("Code" = field("launguage code"));
        }
        field(4; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = SystemMetadata;
           // TableRelation = "Sales Header" where("No." = field("Document No."));
        }
        field(5; "type"; Enum "Type")
        {
            Caption = 'Type';
            DataClassification = CustomerContent;
        }
        field(6; "Document Type"; Enum "Sales Document Type")
        {
        
            Caption = 'Document Type';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK;  "launguage code","line.no",Text,"Document No.","type")
        {
            Clustered = true;
        }
        
    }
}