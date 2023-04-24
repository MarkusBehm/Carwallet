table 50310 waas_T_ConnectAccount
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; techId; BigInteger)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;

        }
        field(2; waas_id; Guid)
        {
            TableRelation = virtual_bank_account.techID;

        }

        field(3; IBAN; Code[32])
        {
            DataClassification = ToBeClassified;
        }
        field(4; BIC; Code[11])
        {
            DataClassification = ToBeClassified;
        }
        field(5; AccountholderName; Text[200])
        {
            CaptionML = ENU = 'Accountholder Name',
                        DEU = 'Kontoinhaber';
            DataClassification = ToBeClassified;
        }
        field(6; Bankname; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; aktiv; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8; direct_debit_agreement; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9; api_partner; Code[50])
        {

            DataClassification = ToBeClassified;
            TableRelation = API_Partner;
        }
        field(10; viban; CODe[32])
        {
            DataClassification = ToBeClassified;
            TableRelation = virtual_bank_account.virtual_iban;


        }
    }

    keys
    {
        key(Key1; techid)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    var
        virtRec: Record virtual_bank_account;
    begin
        TestField(api_partner);
        TestField(viban);
        TestField(IBAN);
        duplicateCheck(api_partner, viban, IBAN);
        virtRec.SetRange(virtual_iban, viban);
        if virtRec.FindFirst() then begin
            rec.waas_id := virtRec.techID;

        end;




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



    procedure duplicateCheck(partner: code[50]; waas_P: Code[32]; iban_P: Code[32])
    var
        recOWN: Record waas_T_ConnectAccount;
        lb: Label 'Connection exsits';
    begin

        recOWN.Setrange(api_partner, partner);
        recOWN.SetRange(viban, waas_P);
        recOWN.SetRange(IBAN, iban_P);
        if recOWN.FindFirst() then
            Error(lb);






    end;

}