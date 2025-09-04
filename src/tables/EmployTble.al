table 50276 "Employ Table"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Emp Id."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Name; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; role; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Department; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50; "Assigned Asset Count"; Integer)
{
FieldClass = FlowField;
CalcFormula = count("Emp Assets" where(EmpID = field("Emp Id."),
Status = const(Assgned)));
}

    }
    keys
    {
        key(PK; "Emp id.")
        {
            Clustered = true;
        }
    }
}