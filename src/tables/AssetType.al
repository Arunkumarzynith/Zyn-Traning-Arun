table 50353 "Asset Type"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1;TypeNo;Integer)
        {
            AutoIncrement=true;
            DataClassification=ToBeClassified;
        }
        field(2;Category; Enum "Asset Type")
        {
            DataClassification = ToBeClassified;
        }
        field(3;Name;Text[50])
        {
            DataClassification=ToBeClassified;
        }
    }
    
    keys
    {
        key(PK;TypeNo,Name)
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        
    end;
    
    trigger OnModify()
    begin
        
    end;
    
    trigger OnDelete()
    begin
        
    end;
    
    trigger OnRename()
    begin
        
    end;
    
}