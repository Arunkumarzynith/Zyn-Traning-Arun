table 50114 "Modify Log"
{
    fields
    {
        field(50106; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = SystemMetadata;
        }
        field(50107; "Customer No"; Code[50])
        {
            Caption = 'Customer No';
            DataClassification = CustomerContent;
        }

        field(50109; "old Value"; Text[50])
        {
            Caption = 'Old Value';
            DataClassification = CustomerContent;
        }

        field(50110; "field name"; Text[50])
        {
            Caption = 'Old Value';
            DataClassification = CustomerContent;
        }
        field(50111; "New Value"; Text[50])
        {
            Caption = 'New Value';
            DataClassification = CustomerContent;
        }
        field(50112; "user id"; Text[50])
        {
            Caption = 'user id';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Entry No", "Customer No", "field name")
        {
            Clustered = true;
        }

    }
}