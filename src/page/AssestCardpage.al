page 50358 "Asset Card"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "Assets Table";

    layout
    {
        area(Content)
        {
            group(BudgetCard)
            {
                field(AssetType; Rec.AssetType) { ApplicationArea = All; }
                field(SerialNo; Rec.SerialNo) { ApplicationArea = All; }
                field(ProcurredDate; Rec.ProcurredDate) { ApplicationArea = All; }
                field(Vendor; Rec.Vendor) { ApplicationArea = All; }
                field(Available; Rec.Available) { ApplicationArea = All; }
            }
        }
    }
}
