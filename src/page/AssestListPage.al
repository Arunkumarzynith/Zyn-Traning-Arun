page 50357 "Asset List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Assets Table";
    CardPageId = 50358;
    //Editable=false;
    InsertAllowed = false;
    ModifyAllowed = false;
    layout
    {
        area(Content)
        {
            repeater(AssetsList)
            {
                field(AssetType;Rec.AssetType) { ApplicationArea = All; }
                field(SerialNo;Rec.SerialNo) { ApplicationArea = All; }
                field(ProcurredDate;Rec.ProcurredDate){ApplicationArea=All;}
                field(Vendor;Rec.Vendor){ApplicationArea=All;}
                field(Available;Rec.Available){ApplicationArea=All;}
            }
        }
    }
}