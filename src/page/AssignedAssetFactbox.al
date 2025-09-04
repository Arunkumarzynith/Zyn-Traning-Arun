page 50375 "Assigned Assets Factbox"
{
Caption = 'Assigned Assets';
PageType = CardPart;
SourceTable = "Employ Table"; // Employee table
ApplicationArea = All;

layout
{
area(content)
{
cuegroup("Assets Summary")
{
field("Assigned Asset Count"; Rec."Assigned Asset Count")
{
ApplicationArea = All;
DrillDown = true;
DrillDownPageId = EmpAssetList;
}
}
}
}
}
