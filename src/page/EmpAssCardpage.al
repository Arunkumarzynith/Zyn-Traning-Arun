page 50354 "Emp Asset Card"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "Emp Assets";

    layout
    {
        area(Content)
        {
            group(BudgetCard)
            { 
                field(EmpID; Rec.EmpID) { ApplicationArea = All; }
                field(AssetType;Rec.AssetType){ApplicationArea=All;}
                field(SerialNo; Rec.SerialNo) { ApplicationArea = All; }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        // After status changed we want page to re-evaluate "Editable" flags
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                field(AssignedDate; Rec.AssignedDate) { ApplicationArea = All; Editable = CanEditAssignedDate; }
                field(ReturnedDate; Rec.ReturnedDate) { ApplicationArea = All; Editable = CanEditReturnedDate; }
                field(LostDate; Rec.LostDate) { ApplicationArea = All; Editable = CanEditLostDate; }
            }
        }
    }

    var
        CanEditAssignedDate: Boolean;
    
        CanEditReturnedDate: Boolean;
        
        CanEditLostDate: Boolean;
trigger OnAfterGetRecord()
var
    AssetsRec: Record "Assets Table";
    ExpiryDate: Date;
    AssetStatus:Enum "asset Status";
begin
    // default
    CanEditAssignedDate := false;
    CanEditReturnedDate := false;
    CanEditLostDate := false;

    if Rec.SerialNo <> '' then begin
        AssetsRec.Reset();
        AssetsRec.SetRange(SerialNo, Rec.SerialNo);
        if AssetsRec.FindFirst() then begin
            AssetsRec.UpdateAvailability();

            case Rec.Status of
                AssetStatus::Assgned:
                    begin
                        CanEditAssignedDate := AssetsRec.Available;
                        CanEditReturnedDate := false;
                        CanEditLostDate := false;
                    end;
                AssetStatus::retruned:
                    begin
                        CanEditAssignedDate := false;
                        CanEditReturnedDate := true;   
                        CanEditLostDate := false;
                    end;
                AssetStatus::Lost:
                    begin
                        CanEditAssignedDate := false;
                        CanEditReturnedDate := false;
                        CanEditLostDate := true;
                    end;
            end;
        end;
    end;
end;
trigger OnQueryClosePage(CloseAction: Action): Boolean
begin
    case Rec.Status of
        Rec.Status::Assgned:
            if Rec.AssignedDate = 0D then
                Error('Assigned Date must be filled when status is Assigned.');
        Rec.Status::retruned:
            if (Rec.AssignedDate = 0D) or (Rec.ReturnedDate = 0D) then
                Error('Both Assigned Date and Returned Date must be filled when status is Returned.');
        Rec.Status::lost:
            if (Rec.AssignedDate = 0D) or (Rec.LostDate = 0D) then
                Error('Both Assigned Date and Lost Date must be filled when status is Lost.');
    end;
    exit(true);
end;
}

