pageextension 50111 CustomerCardExt extends "Customer Card"
{
    layout
    {   
        addlast(General)
        {
            field("Credits Allowed"; Rec."Credits Allowed")
            {
                ApplicationArea = All;
            }
            field("Credits Used"; Rec."Credits Used")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("Loyality points allowed"; Rec."Loyality points allowed ")
            {
                ApplicationArea = All;
                Editable = true;
            }
            field("Loyality points used"; Rec."Loyality points used")
            {
                ApplicationArea = All;
                Editable = true;
            }

        }
         addlast(factboxes)
        {
            part(OpenDocsFactBox; "Customer Open Docs FactBox")
            {
                SubPageLink = "No." = field("No.");
                ApplicationArea=All;
            }
            part(CustomerContactFactBox; "Customer Contact FactBox")
            {
                SubPageLink = "No." = field("No.");
                ApplicationArea=All;
            }
        }
        
    
        
        
       
    }

    
    actions
    {
        addlast(Processing)
        {
            action("Modify Log")
            {
                ApplicationArea = All;
                Caption = 'Modify Log';
                RunObject = page "Modify Log list";
            }
            action("Problem ")
            {
                ApplicationArea = All;
                Caption = 'Problem';
                trigger OnAction()
                var
                    ProblemRec: Record "problems";
                    CustomerRec: Record Customer;
                begin
                    CustomerRec.Get(Rec."No.");
                    ProblemRec.Init();
                    ProblemRec."Customer.No" := CustomerRec."No.";
                    ProblemRec."customer Name" := CustomerRec."Name";
                    ProblemRec.Insert(true);
                    Page.Run(Page::"Problem card", ProblemRec);
                end;
                //RunObject = page "Problem card";
            }
        }
    }
     
}

