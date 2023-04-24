page 50314 "BrokerView"
{
    Caption = 'Brocker View';
    PageType = CardPart;
    RefreshOnActivate = true;
    SourceTable = virtual_bank_account;

    layout
    {
        area(content)
        {
            cuegroup("My cars")
            {
                Caption = 'My Cars';
                field("myCare"; i)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'not payed';
                    Image = Checklist;
                    ToolTip = 'Specifies the number of pending tasks that are assigned to you or to a group that you are a member of.';

                    trigger OnDrillDown()
                    var
                        walletList: Page waas_P_List;
                    begin
                        walletList.Run();
                    end;
                }
            }
            cuegroup("Company Cars")
            {
                Caption = 'Company Cars';
                field("CompCar"; i2)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'not payed';
                    Image = Checklist;
                    ToolTip = 'Specifies the number of pending tasks that are assigned to you or to a group that you are a member of.';

                    trigger OnDrillDown()
                    var

                    begin
                        Page.Run(Page::waas_P_List);
                    end;
                }
            }
        }
    }

    actions
    {
    }

    var
        i: Integer;
        i2: Integer;

    trigger OnOpenPage()
    begin
        i := getPendingMyCar();
        i2 := getPendingCompCar();
    end;

    procedure getPendingMyCar(): Integer
    begin

        exit(5)
    end;

    procedure getPendingCompCar(): Integer
    begin
        exit(70)
    end;
}
