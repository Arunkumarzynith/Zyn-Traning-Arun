codeunit 50125 "Customer Publisher"
{
    [IntegrationEvent(false, false)]
    procedure OnAfterNewCustomerCreated(var Customer: Record Customer)
    begin
        // Event published after a new customer is created
    end;
}