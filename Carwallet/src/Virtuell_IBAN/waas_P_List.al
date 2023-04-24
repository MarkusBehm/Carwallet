page 50318 waas_P_List

{
    PageType = List;
    ApplicationArea = All;
    CaptionML = ENU = 'Wallet List',
                DEU = 'Wallet Liste';

    UsageCategory = Lists;
    SourceTable = virtual_bank_account;
    CardPageId = waas_P_Card;

    layout
    {
        area(Content)
        {
            repeater(GroupName)

            {
                field(virtual_iban; rec.virtual_iban) { ApplicationArea = All; }
                field(vItemName; Rec.vItemName) { ApplicationArea = All; }
                field(CompanyName; Rec.CompanyName)
                {
                    ApplicationArea = All;
                }
                field(customer_id; rec.customer_id) { ApplicationArea = All; }
                field(Fullname; rec.Fullname) { ApplicationArea = all; }

                field(Balance; rec.Balance) { ApplicationArea = All; }

                field(VIN; rec.VIN) { ApplicationArea = All; }
                field(apipartnerId; rec.apipartnerId)
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
        rec.CalcFields(rec.Balance, CompanyName);
    end;

    trigger OnOpenPage()
    begin
        rec.SetCurrentKey(SystemCreatedAt)
    end;
}