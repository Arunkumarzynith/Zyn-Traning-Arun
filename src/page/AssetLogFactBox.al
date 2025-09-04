page 50205 "AssetStats Factbox"
{
    PageType = CardPart;
    ApplicationArea = All;
    SourceTable = "Emp Assets";
    Caption = 'Asset History';

    layout
    {
        area(Content)
        {
            field(AssignedCount; AssignedCount)
            {
                ApplicationArea = All;
                Caption = 'Assigned';
                Editable = false;
            }
            field(ReturnedCount; ReturnedCount)
            {
                ApplicationArea = All;
                Caption = 'Returned';
                Editable = false;
            }
            field(LostCount; LostCount)
            {
                ApplicationArea = All;
                Caption = 'Lost';
                Editable = false;
            }
        }
    }

    var
        AssignedCount: Integer;
        ReturnedCount: Integer;
        LostCount: Integer;

    trigger OnAfterGetRecord()
    var
        TmpRec: Record "Emp Assets";
        AssetStatus: Enum "asset Status";
    begin
        TmpRec.Reset();
        TmpRec.SetRange(Status, AssetStatus::Assgned);
        AssignedCount := TmpRec.Count();

        TmpRec.Reset();
        TmpRec.SetRange(Status, AssetStatus::retruned);
        ReturnedCount := TmpRec.Count();

        TmpRec.Reset();
        TmpRec.SetRange(Status, AssetStatus::Lost);
        LostCount := TmpRec.Count();
    end;
}