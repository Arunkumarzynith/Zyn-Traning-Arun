table 50156 "Index Calc"
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; code; Code[20])
        {
            DataClassification = ToBeClassified;
            
        }
        field(2; "Entry NO"; Integer)
        {
            DataClassification = ToBeClassified;
            
        }
        field(3; year; Integer)
        {
            DataClassification = ToBeClassified;
            
        }
        field(4; value; Decimal)
        {
            DataClassification = ToBeClassified;
            
        }

    }
    
    keys
    {
        key(pk;  "Entry NO",code)
        {
            
            Clustered = true;
        
        }
        
    }
    
    
    
    
}