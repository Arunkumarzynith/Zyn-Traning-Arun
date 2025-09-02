tableextension 50114 "Posted Sales Credit Ext" extends "Sales Cr.Memo Header"
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