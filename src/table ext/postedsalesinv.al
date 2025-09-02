tableextension 50112 "Posted Sales Header Ext" extends "Sales Invoice Header"
{
    fields
    {
        field(50100; "Beginning Text"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50101; "End Text"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        
    }

}