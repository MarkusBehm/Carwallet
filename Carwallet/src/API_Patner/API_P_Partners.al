page 50330 API_P_Partners
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = API_Partner;
    CardPageId = API_P_Partner;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Id; rec.Id)
                {
                    CaptionML = ENU = 'DUNS NO.',
                                DEU = 'DUNS NO.';
                    ApplicationArea = All;

                }
                field(Name; rec.Name)
                {
                    ApplicationArea = All;

                }
                field(synthix_partnerid; rec.synthix_partnerid)
                {
                    ApplicationArea = All;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = All;
                }
                field(vIBAN_gateway; rec.vIBAN_gateway)
                {
                    ApplicationArea = All;
                }
                field(vIBAN_gateway_account_id; rec.vIBAN_gateway_account_id)
                {
                    ApplicationArea = all;
                }
                field(vIBAN_routing_number; rec.vIBAN_routing_number)
                {
                    ApplicationArea = All;
                }


            }
        }
        area(Factboxes)
        {

        }
    }


}