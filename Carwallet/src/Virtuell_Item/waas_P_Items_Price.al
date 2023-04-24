page 50325 WaaS_P_vItems_price
{
    PageType = List;
    Caption = 'Virtual Item Pricing';
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = WaaS_T_vItem_Price;
    CardPageId = WaaS_P_vItem_price;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(id; Rec.id)
                {
                    ApplicationArea = All;

                }
                 field(external_name;rec.external_name)
                {
                    ApplicationArea = All;

                }
                field(name; Rec.name)
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