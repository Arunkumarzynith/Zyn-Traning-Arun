page 50356 "Asset TypeList"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Asset Type";
    CardPageId = 50355;
    InsertAllowed = false;
    ModifyAllowed = false;
    layout
    {
        area(Content)
        {
            repeater(AssetList)
            {
                field(Category;Rec.Category) { ApplicationArea = All; }
                field(Name;Rec.Name) { ApplicationArea = All; }
            }
        }
        
    }
}