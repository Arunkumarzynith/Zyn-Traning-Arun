namespace DefaultPublisher.UpdateField;
using Microsoft.Foundation.Company;
using System.Environment;


pageextension 50127 companypageect extends Companies
{
    actions
    {
        addlast(processing)
        {
            action(updatefield)
            {
                Caption = 'Update_Field';
                ApplicationArea = all;
             
                RunObject = page "UpdatePage";
            }
        }
 
    }
}
 