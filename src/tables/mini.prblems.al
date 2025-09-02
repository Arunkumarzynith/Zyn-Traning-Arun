 table 50132 "problems"
{
    DataClassification = CustomerContent;
    fields
    {
        field(1;"Entry.no"; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = SystemMetadata;
            AutoIncrement = true;
        }

        field(2; "Problem"; Enum "Problemenum")
        {
            Caption = 'Problem';
            DataClassification = CustomerContent;
        }
        field(3; "Dept"; Enum "Department")
        {
            Caption = 'Dept';
            DataClassification = CustomerContent;
        }
        field(4; "Technician ID"; Text[100])
        {
            Caption = 'Technician Id';
            DataClassification = CustomerContent;
            TableRelation = Technician."Tech ID" where("department" = field("Dept"));
            Editable=false;

   }
        field(5; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            //FieldClass = FlowField;
            //CalcFormula = lookup("customer".name where("No." = field("Customer.No")));
        }

        field(6; "Description"; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(7; "Date"; Date) 
        {
            Caption = 'Date';
            DataClassification = CustomerContent;

        }
        field(8; "Customer.No"; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = SystemMetadata;
            Editable = false;
            //TableRelation = Customer where("No." = field("Customer.No"));
        }
        
    }
    keys
    {
        key(PK; "Entry.no","Customer.No")
        {
            Clustered = true;
        }
        
    }

}