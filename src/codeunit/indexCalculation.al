codeunit 50160 "Index Calculation Mgt"
{
    procedure CalculateIndexValues(IndexRec: Record "Index Table")
    var
        CalcRec: Record "Index Calc";
        CurrentYear: Integer;
        CurrentValue: Decimal;
        i: Integer;
        EntryNo: Integer;
        n: Integer;
    begin
        // Delete old records for this code
        CalcRec.Reset();
        CalcRec.SetRange(Code, IndexRec.Code);
        if CalcRec.FindSet() then
            CalcRec.DeleteAll();

        // Avoid running if data is incomplete
        if (IndexRec.StartYear = 0) or (IndexRec.EndYear = 0) or (IndexRec.PerINc = 0) then
            exit;

        n := (IndexRec.EndYear - IndexRec.StartYear)+1;
        CurrentValue := 100; // Base value
        EntryNo := 0;
        CurrentYear := IndexRec.StartYear;


        for i := 1 to n do begin
            EntryNo += 1;
            CalcRec.Init();
            CalcRec.Code := IndexRec.Code;
            CalcRec."Entry NO" := EntryNo;
            CalcRec.Year := CurrentYear;
            CalcRec.Value := Round(CurrentValue, 0.01);
            CalcRec.Insert();
            CurrentYear += 1;
            CurrentValue := CurrentValue + (CurrentValue * IndexRec.PerINc / 100);
        end;
    end;
}
