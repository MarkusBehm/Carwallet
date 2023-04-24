page 50311 api_waas_connectAccount

{
    PageType = API;
    APIPublisher = 'waas';
    APIGroup = 'wallet';
    APIVersion = 'v1.0';
    EntityName = 'connectedAcc';
    EntitySetName = 'connectedAccs';
    SourceTable = waas_T_ConnectAccount;
    DelayedInsert = true;
    ODataKeyFields = SystemId;


    layout
    {

        area(Content)
        {
            field(id; rec.SystemId) { }
            field(apipartner_Id; rec.api_partner) { }
            field(vIBAN; rec.viban) { }
            field(accountholder_name; rec.AccountholderName) { }

            field(iban; rec.IBAN) { }
            field(bic; rec.BIC) { }
            field(Bankname; rec.Bankname)
            { }
            field(activ; rec.aktiv) { Editable = false; }
            field(direct_debit_agreement; rec.direct_debit_agreement) { }


        }

    }
}



