page 50203 "EmpAssetList"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Emp Assets";
    CardPageId = 50354;
    InsertAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(EmpAssetList)
            {
                field(EmpID; Rec.EmpID) { ApplicationArea = All; }
                field(SerialNo; Rec.SerialNo) { ApplicationArea = All; }
                field(Status; Rec.Status) { ApplicationArea = All; }
                field(AssignedDate; Rec.AssignedDate) { ApplicationArea = All; }
                field(ReturnedDate; Rec.ReturnedDate) { ApplicationArea = All; }
                field(LostDate; Rec.LostDate) { ApplicationArea = All; }
            }
        }

        area(FactBoxes)
        {
            part(AssetStats; "AssetStats Factbox")
            {
                ApplicationArea = All;
                SubPageLink = EmpID = field(EmpID); 
            }
            part(AssignedAssets; "Assigned Assets Factbox")
            {
                ApplicationArea = All;
                SubPageLink = "Emp Id." = field(EmpID);
            }
        }
        
    }

}