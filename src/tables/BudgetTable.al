table 50236 "Budget Table"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "BUdget ID"; Code[20])
        {
            Caption = 'Budget ID';
        }
        
        field(2; "Amount"; Decimal)
        {
            Caption = 'Amount';
        }
        field(3; "From date"; Date)
        {
            Caption = 'Date';
        }
        field(4; "To date "; date)
        {
            Caption = 'To date';
            
        }
        field(5; "Category"; Code[20])
        {
            Caption = 'Category ';
            TableRelation = "Category Table".Name;
            
        
        }
        
        
    }
 
    keys
    {
        key(PK; "BUdget ID")
        {
            Clustered = true;
        }
    }
    procedure GetLastBudget(CategoryCode: Code[20]): Boolean
    var
        TempRec: Record "Budget Table";
    begin
        TempRec.Reset();
        TempRec.SetRange("Category", CategoryCode);
        if TempRec.FindLast() then begin
            Rec := TempRec;
            exit(true);
        end;
        exit(false);
    end;

    procedure GetBudgetForDate(CategoryName: Code[20]; CurrentDate: Date): Boolean
    begin
        Reset();
        SetRange(Category, CategoryName);
        SetFilter("From date", '<=%1', CurrentDate);
        SetFilter("To date ", '>=%1', CurrentDate);
        exit(FindFirst());
    end;
 
}
 