page 50355 "Asset TypeCard"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "Asset Type";
    Caption = 'Asset Type';


    layout
    {
        area(Content)
        {
            group(AssetTypeCard)
            {
                field(Category; Rec.Category) { ApplicationArea = All; }
                field(Name;Rec.Name) { ApplicationArea = All; }
            }
        }
    }
}
