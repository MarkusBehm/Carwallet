page 50324 WaaS_P_vItemGroups
{
    PageType = List;
    ApplicationArea = All;
    Caption = 'Virtual Item Group';
    UsageCategory = Lists;
    SourceTable = WaaS_T_vItemGroup;
    CardPageId = WaaS_P_vItemGroups;

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