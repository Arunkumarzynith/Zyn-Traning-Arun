table 50379 "Plan Table"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1;"Plan ID"; Code[20])
        {  
            DataClassification = ToBeClassified; 
        }
        field(2; Fee; Decimal) 
        {
            DataClassification=ToBeClassified;
        }
        field(3; Name; Text[50])
        { 
            DataClassification=ToBeClassified; 
        }
        field(4; Status; Enum "Sub Plan Status")
        { 
            DataClassification=ToBeClassified; 
        }
    }

    keys
    {
        key(PK;"Plan ID") { Clustered = true; }
    }

    trigger OnModify()
    var
        SubscriptionRec: Record "Subscription table";
    begin
        // If this plan was set to Inactive
        if Rec.Status = Rec.Status::Inactive then begin
            SubscriptionRec.Reset();
            SubscriptionRec.SetRange("Plan ID", Rec."Plan ID");
            if SubscriptionRec.FindSet() then
                repeat
                    // If you want to archive first, implement archiving instead of delete
                    SubscriptionRec.Delete(true);
                until SubscriptionRec.Next() = 0;
        end;
    end;
}