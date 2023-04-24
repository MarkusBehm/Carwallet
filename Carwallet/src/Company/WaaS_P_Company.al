page 50302 WaaS_P_Company
{
    PageType = Card;
    ApplicationArea = All;
    CaptionML = ENU = 'Company Card', DEU = 'Unternehmen Karte';
    UsageCategory = Administration;
    SourceTable = WaaS_T_Company;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                CaptionML = ENU = 'Company details',
                            DEU = 'Unternehmensdetails';
                field(CompanyName; rec.communityName)
                {
                    ApplicationArea = All;

                }
                field(juristic_code; rec.juristic_code)
                {
                    ApplicationArea = All;

                }
                field(company_number; rec.company_number)
                {
                    ApplicationArea = All;

                }

                field(current_registerstatus; rec.current_registerstatus)
                {
                    ApplicationArea = All;

                }
                field(mailAdress; rec.mailAdress)
                {
                    ApplicationArea = All;

                }
                field(telefon; rec.telephoneNumber)
                {
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

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}