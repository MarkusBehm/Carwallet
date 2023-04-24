page 50301 WaaS_P_Companies
{
    PageType = List;
    CaptionML = ENU = 'Companies', DEU = 'Unternehmen';
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = WaaS_T_Company;
    CardPageId = WaaS_P_Company;


    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                ShowCaption = false;
                field(CompanyName; rec.communityName)
                {
                    ApplicationArea = All;

                }
                field(juristic_code; rec.juristic_code)
                {
                    ApplicationArea = All;

                }

            }
        }
    }

}