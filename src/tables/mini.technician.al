table 50131 "technician"
{
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Tech ID"; Code[20])
        {
            Caption = 'ID';
            DataClassification = CustomerContent;
        }
        field(2; "Tech Name"; Text[100])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(3; "ph.no"; Text[100])
        {
            Caption = 'ph.no';
            DataClassification = CustomerContent;
        }
        field(4; "department"; Enum "Department")
        {
            Caption = 'department';
            DataClassification = CustomerContent;
        }
        field(5; "customer.no"; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = CustomerContent;
            TableRelation = Customer where("No." = field("customer.no"));
        }
        field(6;"customer name"; Text[100])
        {
            Caption = 'Customer Name';
            DataClassification = CustomerContent;
            TableRelation = Customer.Name where("No." = field("customer.no"));
        }
        field(7; "Count"; Integer)
        {
            Caption = 'Count';
            FieldClass = FlowField;
            CalcFormula =count(problems where("Technician ID" = field("Tech ID")));
        }
    }
    keys
    {
        key(PK; "Tech ID")
        {
            Clustered = true;
        }
    }
}