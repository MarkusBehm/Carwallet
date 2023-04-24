table 50313 WaaS_T_vItem_Price

{
    DataClassification = ToBeClassified;
    LookupPageId = WaaS_P_vItems_price;
    DrillDownPageId = WaaS_P_vItems_price;

    fields
    {
        field(1; techid; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; currency_code; code[3]) { DataClassification = ToBeClassified; }//": "USD",
        field(3; external_name; Text[50]) { DataClassification = ToBeClassified; }// "silver USD",
        field(4; free_quantity; Integer) { DataClassification = ToBeClassified; }// 0,Free quantity the subscriptions of this item_price will have. Only the quantity more than this will be charged for the subscription.
        field(5; id; Text[100]) { DataClassification = ToBeClassified; }// "silver-USD-monthly",
        field(6; is_taxable; Boolean)
        {
            TableRelation = WaaS_T_vItem.id;
            DataClassification = ToBeClassified;
        }// true, The identifier for the item price. It is unique and immutable.Specifies whether taxes apply to this item price. This value is set and returned even if Taxes have been disabled in Chargebee. However, the value is effective only while Taxes are enabled.
        field(7; item_id; BigInteger) { DataClassification = ToBeClassified; }// "silver",The id of the item that the item price belongs to.
        field(8; item_type; OPtion)
        {
            OptionMembers = plan,addon,charge;
            DataClassification = ToBeClassified;
        }// "plan",Type of item.
         //Possible values are
         //plan
         //An essential component of a subscription. Every subscription has exactly one plan. It has a recurring charge and its period defines the billing period of the subscription.
         //addon
         //A recurring component that can be added to a subscription in addition to its plan.
         //charge
         //A non-recurring component that can be added to a subscription in addition to its plan. An charge can also be applied to a customer directly without being applied to a subscription.
        field(9; name; Text[50]) { DataClassification = ToBeClassified; }// "silver USD monthly",A unique display name for the item price in the Chargebee UI. If external_name is not provided, this is also used in customer-facing pages and documents such as invoices and hosted pages.
        field(10; Object; Text[50]) { DataClassification = ToBeClassified; }// "item_price",
        field(11; period; INteger) { DataClassification = ToBeClassified; }// 1,
                                                                           //When the item type is plan: The billing period of the plan in period_units. For example, create a 6 month plan by providing period as 6 and period_unit as month.
                                                                           //When item type is addon: The period of the addon in period_units. For example, create an addon with a 2 month period by providing period as 2 and period_unit as month. The period of an addon is the duration for which its price applies. When attached to a plan, the addon is billed for the billing period of the plan. Learn more.

        field(12; period_unit; Option)
        {
            OptionMembers = day,week,month,year;
            DataClassification = ToBeClassified;
        }// "month",
        field(13; price; decimal) { DataClassification = ToBeClassified; }// 1000,
        //The cost of the item price when the pricing model is flat_fee. When the pricing model is per_unit, it is the price per unit quantity of the item. Not applicable for the other pricing models. The value is in the minor unit of the currency.
        field(14; pricing_model; Option)
        {
            OptionMembers = flat_fee,per_Unit,tiered,volume,stairstep;

            DataClassification = ToBeClassified;
        }
        // "per_unit",
        // flat_fee
        //A fixed price that is not quantity-based.
        //per_unit
        //A fixed price per unit quantity.
        //tiered
        //The per unit price is based on the tier that the total quantity falls in.
        //volume
        //There are quantity tiers for which per unit prices are set. Quantities are purchased from successive tiers.
        //stairstep
        //A quantity-based pricing scheme. The item is charged a fixed price based on the tier that the total quantity falls in.
        field(16; status; Text[50]) { DataClassification = ToBeClassified; }// "active",
        field(18; price_in_decimal; Decimal) { DataClassification = ToBeClassified; }
        //The price of the item when the pricing_model is flat_fee. When the pricing model is per_unit, it is the price per unit quantity of the item. Not applicable for the other pricing models. The value is in decimal and in major units of the currency. Also, this is only applicable when multi-decimal pricing is enabled.
    }

    keys
    {
        key(PK; techid)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}
