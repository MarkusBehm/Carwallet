table 50312 waas_T_Transactions
{
    DataClassification = ToBeClassified;
    DrillDownPageId = waas_P_Transactions;

    LookupPageId = waas_P_Transactions;

    fields
    {
        field(1; techID; BigInteger)
        {
            DataClassification = ToBeClassified;

        }
        field(2; techvIban; Guid)
        {
            DataClassification = ToBeClassified;
        }
        field(99; vIBAN; Code[32])
        {
            DataClassification = ToBeClassified;
        }
        field(5; BookDt; Date) { DataClassification = ToBeClassified; }
        field(6; ValDt; Date) { DataClassification = ToBeClassified; }
        field(3; Amt; Decimal) { DataClassification = ToBeClassified; }
        field(4; Ccy; Code[3]) { DataClassification = ToBeClassified; }
        field(7; AcctSvcrRef; Text[249]) { DataClassification = ToBeClassified; }
        field(77; PmtInfId; Text[249]) { DataClassification = ToBeClassified; }
        field(78; InstrId; Text[249]) { DataClassification = ToBeClassified; }
        field(8; EndToEndId; TExt[100]) { DataClassification = ToBeClassified; }
        field(76; TxId; Text[100]) { DataClassification = ToBeClassified; }

        field(9; Dbtr_Nm; Text[100]) { DataClassification = ToBeClassified; }
        field(10; Dbtr_PstlAdr_Ctry; Text[100]) { DataClassification = ToBeClassified; }
        field(11; Dbtr_PstlAdr_AdrLine; Text[100]) { DataClassification = ToBeClassified; }
        field(12; DbtrAcct_Id_Iban; Text[100]) { DataClassification = ToBeClassified; }
        field(13; Cdtr_Nm; Text[100]) { DataClassification = ToBeClassified; }
        field(14; Cdtr_PstlAdr_Ctry; Text[100]) { DataClassification = ToBeClassified; }
        field(15; Cdtr_PstlAdr_AdrLine; Text[100]) { DataClassification = ToBeClassified; }
        field(16; CdtrAcct_Id_Iban; Text[100]) { DataClassification = ToBeClassified; }
        field(17; UltmCdtr_Nm; Text[100]) { DataClassification = ToBeClassified; }
        field(18; UltmCdtr_PstlAdr_Ctry; Text[100]) { DataClassification = ToBeClassified; }
        field(19; UltmCdtrPstlAdr_AdrLine; Text[100]) { DataClassification = ToBeClassified; }
        field(20; UltmCdtrAcc_IBAN; TExt[249]) { DataClassification = ToBeClassified; }

        field(21; Ustrd; TExt[249]) { DataClassification = ToBeClassified; }

        field(22; apipartnerId; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = API_Partner.Id;

        }
        field(23; SEPA_SDD_Init; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(24; SEPA_SCT_Init; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(25; SEPA_RTP_Init; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(26; collection_status; enum waas_collection_status)
        {

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


enum 50320 waas_collection_status
{
    Extensible = true;


    value(0; " ")
    {

    }
    value(1; not_initiated)
    {
    }

    value(2; sct_email_initiatet)
    {
    }
    value(3; rtp_email_initiated)
    {

    }
    value(4; sdd_initiatetd)
    {

    }
    value(5; paid_by_waas_Credit)
    {

    }

}

