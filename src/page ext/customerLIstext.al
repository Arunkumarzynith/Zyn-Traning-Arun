pageextension 50122 customerlistExt extends "Customer List"
{
    layout
    {
        addlast(FactBoxes)
        {
            part("Customer Open Docs FactBox"; "Customer Open Docs FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No.");
            }
            part(CustomerContactFactBox; "Customer Contact FactBox")
            {
                SubPageLink = "No." = field("No.");
                ApplicationArea=All;
            }
        }

    }


}