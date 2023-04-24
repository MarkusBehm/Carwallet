
table 50314 WaaS_T_vItem
{
    DataClassification = ToBeClassified;
    DrillDownPageId = WaaS_P_vItems;
    LookupPageId = WaaS_P_vItems;

    fields
    {
        field(1; id; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;

        }
        field(2; name; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(3; externalName; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(4; description; Text[249])
        {
            DataClassification = ToBeClassified;

        }
        field(5; status; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(6; item_group_id; Code[30])
        {
            TableRelation = WaaS_T_vItemGroup.id;
            DataClassification = ToBeClassified;

        }
        field(7; vItemtype; enum vItemType)
        {
            DataClassification = ToBeClassified;

        }
        field(8; is_shippable; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(9; is_giftable; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(10; metered; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(11; usage_calculation; enum usage_calculation)
        {
            DataClassification = ToBeClassified;
        }
        field(12; GroupName; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(WaaS_T_vItemGroup.Name where(id = field(item_group_id)));
        }
        //Possible values are
        //sum_of_usages
        //the net quantity is the sum of the quantity of all usages for the current term.
        //last_usage
        //from among the usage records for the item price with usage_date within the relevant billing period, the quantity of the usage record with the most recent usage_date is taken as the net quantity consumed.
        //max_usage
        //from among the usage records for the item price with usage_date within the relevant billing period, the quantity of the usage record with the maximum value is taken as the net quantity consumed.




    }

    keys
    {
        key(Key1; id)
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