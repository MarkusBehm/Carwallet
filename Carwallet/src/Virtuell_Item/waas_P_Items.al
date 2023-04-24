page 50326 WaaS_P_vItems
{
    PageType = List;
    Caption = 'Virtual Items';
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = WaaS_T_vItem;
    CardPageId = WaaS_P_vItem;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Family Name"; Rec.GroupName)
                {
                    ApplicationArea = All;
                }
                field(id; Rec.id)
                {
                    ApplicationArea = All;

                }
                field(name; Rec.name)
                {
                    ApplicationArea = All;
                }
                field(externalName; Rec.externalName)
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
    trigger OnAfterGetRecord()
    begin
        rec.CalcFields(GroupName);
    end;
}