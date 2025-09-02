table 50155 "Index Table"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; PerINc; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                CalcMgt: Codeunit "Index Calculation Mgt";
            begin
                CalcMgt.CalculateIndexValues(Rec);
            end;
        }
        field(4; StartYear; Integer)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                CalcMgt: Codeunit "Index Calculation Mgt";
            begin
                CalcMgt.CalculateIndexValues(Rec);
            end;
        }
        field(5; EndYear; Integer)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                CalcMgt: Codeunit "Index Calculation Mgt";
            begin
                CalcMgt.CalculateIndexValues(Rec);
            end;
        }
    }

    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }
}
