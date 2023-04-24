table 50315 WaaS_T_vItemGroup
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; id; code[30])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Name; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; id)
        {
            Clustered = true;
        }
    }


}