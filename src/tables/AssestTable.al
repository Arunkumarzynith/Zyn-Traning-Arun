table 50350 "Assets Table"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(6;AssetNo;Integer)
        {
            AutoIncrement=true;
            DataClassification=ToBeClassified;
        }
        field(1;AssetType;Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation="Asset Type".Name;
        }
        field(2;SerialNo;Code[20])
        {
            DataClassification=ToBeClassified;
        }
        field(3;ProcurredDate;Date)
        {
            DataClassification=ToBeClassified;
            trigger OnValidate()
            begin
                UpdateAvailability();
            end;
        }
        field(4;Vendor;Text[50])
        {
            DataClassification=ToBeClassified;
        }
        field(5;Available;Boolean)
        {
            DataClassification=ToBeClassified;
        }
    }

    keys
    {
        key(PK;AssetNo,AssetType,SerialNo)
        {
            Clustered = true;
        }
    }

    // Public procedure so other objects can call it (we call it from pages/tables)
    procedure UpdateAvailability()
    var
        ExpiryDate: Date;
        Wk: Date;
    begin
        // Get the session Work Date
        Wk := System.WorkDate();

        if Rec.ProcurredDate = 0D then begin
            Rec.Available := false;
            exit;
        end;

        // Calculate expiry = procurred + 5 years
        ExpiryDate := System.CalcDate('<+5Y>', Rec.ProcurredDate);

        // Available while WorkDate <= expiry
        Rec.Available := (Wk <= ExpiryDate);
    end;

    trigger OnInsert()
    begin
        UpdateAvailability();
    end;

    trigger OnModify()
    begin
        UpdateAvailability();
    end;

    trigger OnDelete()
    begin
    end;

    trigger OnRename()
    begin
    end;
}