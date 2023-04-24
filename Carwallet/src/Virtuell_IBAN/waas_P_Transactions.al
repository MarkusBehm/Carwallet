page 50321 waas_P_Transactions
{
    PageType = ListPart;
    ApplicationArea = All;
    CaptionML = ENU = 'Wallet Transactions',
                DEU = 'Wallet Transaktionen';

    UsageCategory = Lists;
    Editable = false;
    SourceTable = waas_T_Transactions;


    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(BookDt; rec.BookDt)
                {
                    CaptionML = ENU = 'Date',
                                DEU = 'Datum';

                    ApplicationArea = All;

                }


                field(Amt; rec.Amt)
                {
                    CaptionML = ENU = 'amount',
                                DEU = 'Betrag';
                    ApplicationArea = All;
                }

                field(Ccy; rec.Ccy)
                {
                    CaptionML = ENU = 'currency',
                                DEU = 'Währung';
                    ApplicationArea = All;
                }
                field(Dbtr_Nm; rec.Dbtr_Nm)
                {
                    CaptionML = ENU = 'Debtor', DEU = ' Zahlender';
                    ApplicationArea = All;
                }

                field(Ustrd; rec.Ustrd)
                {
                    CaptionML = ENU = 'Description',
                                DEU = 'Beschreibung';
                    ApplicationArea = All;
                }



                field(DbtrAcct_Id_IBAN; rec.DbtrAcct_Id_IBAN)
                { ApplicationArea = All; }

                field(Cdtr_Nm; rec.Cdtr_Nm)
                { ApplicationArea = All; }
                field(CdtrAcct_Id_Iban; rec.CdtrAcct_Id_Iban)
                { ApplicationArea = All; }
                field(UltmCdtr_Nm; rec.UltmCdtr_Nm)
                {

                    ApplicationArea = ALl;
                }
                field(ValDt; rec.ValDt)
                {
                    CaptionML = ENU = 'Valuta',
                                DEU = 'Valuta';
                    ApplicationArea = All;
                }
            }
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