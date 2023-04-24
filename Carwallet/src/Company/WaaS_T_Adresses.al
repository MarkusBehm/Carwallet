table 50301 WaaS_T_Adresses
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; techID; Guid)
        {
            DataClassification = ToBeClassified;
        }
        field(2; street; Text[150])
        {
            DataClassification = ToBeClassified;

        }
        field(3; houseNumber; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(4; zip; code[100])
        {
            DataClassification = ToBeClassified;

        }
        field(5; city; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(6; country; Text[3])
        {
            DataClassification = ToBeClassified;
        }

        field(8; registeredResidence; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(9; addressType; Code[50])
        {
            DataClassification = ToBeClassified;

        }
        field(10; originId; BigInteger)
        {
            DataClassification = ToBeClassified;
        }
        field(11; comapny_originId; BigInteger)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; techID)
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