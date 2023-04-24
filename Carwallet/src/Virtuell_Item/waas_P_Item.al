page 50323 WaaS_P_vItem
{
    PageType = Card;
    Caption = 'Virtual Item';
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = WaaS_T_vItem;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(id; Rec.id)
                {
                    ApplicationArea = All;

                }
                field(GroupType; Rec.GroupName)
                {
                    ApplicationArea = All;
                }

                field(item_group_id; Rec.item_group_id) { }
                field(name; Rec.name)
                {
                    ApplicationArea = All;
                }
                field(description; Rec.description)
                {
                    ApplicationArea = All;
                }
                field(externalName; Rec.externalName)
                {
                    ApplicationArea = All;

                }
                field(is_giftable; Rec.is_giftable)
                {
                    ApplicationArea = All;
                }
                field(is_shippable; Rec.is_shippable)
                {
                    ApplicationArea = All;

                }
                field(metered; Rec.metered)
                {
                    ApplicationArea = All;
                }
                field(status; Rec.status)
                {
                    ApplicationArea = All;
                }
                field(type; Rec.vItemtype)
                {
                    CaptionML = ENU = 'Type',
                                DEU = 'Typ';
                    ApplicationArea = All;
                }
                field(usage_calculation; Rec.usage_calculation)
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