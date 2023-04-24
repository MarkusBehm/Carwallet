page 50319 waas_P_MeterdList

{
    PageType = ListPart;
    ApplicationArea = All;
    CaptionML = ENU = 'Metered List',
                DEU = 'Liste';

    UsageCategory = Lists;
    SourceTable = WaaS_T_Metering;
    CardPageId = waas_P_Card;

    layout
    {
        area(Content)
        {
            repeater(GroupName)

            {


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
    trigger OnAfterGetRecord()
    begin
    end;

    trigger OnOpenPage()
    begin
        rec.SetCurrentKey(SystemCreatedAt)
    end;
}