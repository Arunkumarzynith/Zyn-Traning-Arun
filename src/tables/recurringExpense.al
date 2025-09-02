table 50237 "Recurring Expense"
{

    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = SystemMetadata;
            AutoIncrement = true;

        }
       
        field(3; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
        }
        field(4; "Recurrence Pattern"; Enum "Recurrence Pattern")
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if "Start Date" <> 0D then
                    "Next Cycle date" := GetNextCycleDate("Start Date", "Recurrence Pattern");
            end;
        }
        field(5; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if "Recurrence Pattern" <> "Recurrence Pattern"::None then
                    "Next Cycle date" := GetNextCycleDate("Start Date", "Recurrence Pattern");
            end;
 
        }
        field(6; "Next Cycle date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "category"; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Category Table";
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }
    procedure GetNextCycleDate(CurrentDate: Date; Cycle: Enum "Recurrence Pattern"): Date
    begin
        case Cycle of
            Cycle::Weekly:
                exit(CalcDate('<+1W>', CurrentDate));
            Cycle::Monthly:
                exit(CalcDate('<+1M>', CurrentDate));
            
            Cycle::Yearly:
                exit(CalcDate('<+1Y>', CurrentDate));
            Cycle::Halfyearly:
                exit(CalcDate('<+6m>', CurrentDate));
        end;
    end;


     
}