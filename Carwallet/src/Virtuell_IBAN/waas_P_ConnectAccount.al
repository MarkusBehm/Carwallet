page 50316 waas_P_ConnectAccount
{
    PageType = List;
    ApplicationArea = All;
    CaptionML = ENU = 'Connected Account', DEU = 'Verbundens Konto';
    UsageCategory = Lists;
    SourceTable = waas_T_ConnectAccount;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(AccountholderName; rec.AccountholderName)
                {
                    ApplicationArea = All;
                }
                field(IBAN; rec.IBAN)
                {
                    ApplicationArea = All;
                }
                field(BIC; rec.BIC)
                {
                    ApplicationArea = All;
                }
                field(Bankname; rec.Bankname)
                {
                    ApplicationArea = All;
                }
                field(aktiv; rec.aktiv)
                {
                    ApplicationArea = All;
                }
                field(direct_debit_agreement; rec.direct_debit_agreement)
                {
                    ApplicationArea = All;
                }


            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}