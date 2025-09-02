// codeunit 50100 "Customer Replicator"
// {
//     Subtype = Normal;

//     var
//         IsReplicating: Boolean;

//     [EventSubscriber(ObjectType::Table, Database::Customer, 'OnAfterInsertEvent', '', false, false)]
//     local procedure OnCustomerAfterInsert(var Rec: Record Customer; RunTrigger: Boolean)
//     begin
//         if IsReplicating then
//             exit;

//         ReplicateCustomer(Rec);
//     end;

//     [EventSubscriber(ObjectType::Table, Database::Customer, 'OnAfterModifyEvent', '', false, false)]
//     local procedure OnCustomerAfterModify(var Rec: Record Customer; var xRec: Record Customer; RunTrigger: Boolean)
//     begin
//         if IsReplicating then
//             exit;

//         ReplicateCustomer(Rec);
//     end;

//     local procedure ReplicateCustomer(var SourceCustomer: Record Customer)
//     var
//         TargetCustomer: Record Customer;
//     begin
//         IsReplicating := true;

//         // Change to the target company 
//         TargetCustomer.ChangeCompany('ZynithArun');

//         if not TargetCustomer.Get(SourceCustomer."No.") then begin
//             TargetCustomer := SourceCustomer;
//             TargetCustomer.Insert(false); // Prevent recursion
//         end else begin
//             TargetCustomer := SourceCustomer;
//             TargetCustomer.Modify(false); // Prevent recursion
//         end;

//         IsReplicating := false;
//     end;
// }
