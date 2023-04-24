page 50306 WaaS_P_Persons
{
    PageType = List;
    UsageCategory = Lists;
    SourceTable = WaaS_T_Person;
    ApplicationArea = All;
    CaptionML = ENU = 'Person List', DEU = 'Personen Liste';
    CardPageID = WaaS_P_Person;


    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(tecId; rec.techId)
                {
                    ApplicationArea = All;

                }
                field(firstName; rec.firstName)
                {
                    ApplicationArea = All;

                }
                field(lastName; rec.lastName)
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
                CaptionML = DEU = 'Einkommen', ENU = 'Income';
                ApplicationArea = All;

                trigger OnAction();
                begin
                    Message('Einkommen');
                end;
            }
            action(ActionName1)
            {
                CaptionML = DEU = 'Finanzielle Situation', ENU = 'Financial Situation';
                ApplicationArea = All;

                trigger OnAction();
                begin
                    Message('Assets');
                end;
            }
        }
    }
}