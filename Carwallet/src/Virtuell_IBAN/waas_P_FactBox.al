page 50317 waas_P_FactBox
{
    PageType = CardPart;
    CaptionML = ENU = 'Wallet FactBox',
                DEU = 'Wallet FactBox';
    UsageCategory = None;
    SourceTable = virtual_bank_account;

    layout
    {
        area(Content)
        {

            group("Type")
            {

                CaptionML = ENU = 'Type',
                    DEU = 'Type';
                field(vItemName; Rec.vItemName)
                {
                    ApplicationArea = ALl;
                    Caption = 'Name';

                }
                field(vin; Rec.VIN)
                {
                    ApplicationArea = ALl;
                }
                field("license plate"; Rec."license plate")
                {
                    ApplicationArea = ALl;
                }
                field(HSN; Rec.HSN)
                {
                    ApplicationArea = ALl;
                }
                field(TSN; Rec.TSN)
                {
                    ApplicationArea = ALl;

                }

            }
            group(GroupName)
            {
                CaptionML = ENU = 'Wallet Status',
                            DEU = 'Wallet Status';
                field(Balance; rec.Balance)
                {
                    ApplicationArea = All;

                }
                field(blocked; rec.blocked)
                {
                    ApplicationArea = All;

                }
                field(blockReason; rec.blockReason)
                {
                    ApplicationArea = All;
                }
                field(blockedDateTime; rec.blockedDateTime)
                {
                    ApplicationArea = All;
                }
                field(deleted; rec.deleted)
                {
                    ApplicationArea = All;
                }
                field(deleteDateTime; rec.deleteDateTime)
                {
                    ApplicationArea = All;
                }


                group(Company)
                {
                    CaptionML = ENU = 'actual Tenant-Company',
                                    DEU = 'aktueller Mieter (Firma)';
                    Visible = rec.CompanyName <> '';

                    field(CompanyName; rec.CompanyName)
                    {

                        ApplicationArea = All;
                        CaptionML = ENU = 'Name', DEU = 'Name';
                        trigger OnAssistEdit()
                        var
                            com: Record WaaS_T_Company;
                        begin
                            com.FilterGroup(02);
                            if com.get(rec.companyId) then begin
                                com.FilterGroup(01);
                                Page.Run(Page::WaaS_P_Company, com);
                            end;
                        end;


                    }
                }

                group(Inhaber)
                {
                    CaptionML = ENU = 'actual Tenant',
                            DEU = 'aktueller Mieter';


                    field(Fullname; rec.Fullname)
                    {

                        ApplicationArea = All;
                        CaptionML = ENU = 'Name ', DEU = 'Name';
                        trigger OnAssistEdit()
                        var
                            person: Record WaaS_T_Person;
                        begin
                            person.FilterGroup(02);
                            if person.get(rec.customer_id) then
                                person.FilterGroup(01);
                            Page.Run(Page::WaaS_P_Person, person);
                        end;

                    }
                    field(optin; rec.optin)
                    {
                        ApplicationArea = All;
                    }

                    field(email; rec.email)
                    {
                        ApplicationArea = ALl;

                    }
                }

                group(ConnectedAccount)
                {
                    CaptionML = ENU = 'Connected Account',
                    DEU = 'Verbundenes Konto';
                    field(exAccountholderName; rec.exAccountholderName)
                    {
                        ApplicationArea = ALl;
                    }
                    field(exIBAN; rec.exIBAN)
                    {
                        ApplicationArea = ALl;
                    }
                    field(exBIC; rec.exBIC)
                    {
                        ApplicationArea = ALl;
                    }
                    field(exaktiv; rec.exaktiv)
                    {
                        ApplicationArea = ALl;

                    }
                    field(exdirect_debit_agreement; rec.exdirect_debit_agreement)
                    {
                        ApplicationArea = ALl;

                    }

                }



            }
        }
    }

}