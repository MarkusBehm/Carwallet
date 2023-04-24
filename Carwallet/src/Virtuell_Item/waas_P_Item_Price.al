page 50322 WaaS_P_vItem_price
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = WaaS_T_vItem_Price;

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
                field(name; Rec.name)
                {

                    ApplicationArea = All;
                }

                field(external_name; Rec.external_name)
                {
                    ApplicationArea = All;
                }
                field(currency_code; Rec.currency_code)
                {
                    ApplicationArea = All;
                }
                field(free_quantity; Rec.free_quantity)
                {
                    ApplicationArea = All;
                }
                field(is_taxable; Rec.is_taxable)
                {
                    ApplicationArea = All;
                }
                field(item_type; Rec.item_type)
                {
                    ApplicationArea = All;
                }
                field(Object; Rec.Object)
                {
                    ApplicationArea = All;
                }
                field(period; Rec.period)
                {
                    ApplicationArea = All;
                }
                field(period_unit; Rec.period_unit) { ApplicationArea = All; }
                field(price; Rec.price)
                {
                    ApplicationArea = All;
                }
                field(pricing_model; Rec.pricing_model) { ApplicationArea = All; }
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