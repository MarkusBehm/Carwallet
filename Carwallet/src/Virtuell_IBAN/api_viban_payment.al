page 50312 api_waas_payment
{
    PageType = API;
    APIPublisher = 'waas';
    APIGroup = 'wallet';
    APIVersion = 'v1.0';
    EntityName = 'transfere';
    EntitySetName = 'transferes';
    SourceTable = waas_T_Transactions;
    DelayedInsert = true;
    ODataKeyFields = SystemId;


    layout
    {

        area(Content)
        {
            field(id; rec.SystemId) { }
            field(apipartner_Id; rec.apipartnerId) { }

            field(initiator_viban; rec.vIBAN)
            {

            }

            field(debtor_viban; rec.DbtrAcct_Id_Iban)
            {
            }
            field(creditor_viban; rec.CdtrAcct_Id_Iban)
            {
            }


            field(ammount; rec.Amt)
            {
            }

            field(currency; rec.Ccy)
            {
            }
            field(purpose_of_use; rec.Ustrd)
            {

            }
            field(collection_status; rec.collection_status) { Editable = false; }
        }


    }
    trigger OnNewRecord(BelowxRec: Boolean)
    var
        trx: Record waas_T_Transactions;
    begin
        if trx.FindLast() then
            rec.techID := trx.techID + 1
        else
            rec.techID := 1;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        vIBANRec: Record virtual_bank_account;
    begin
        validateTrx(rec.CdtrAcct_Id_Iban, rec.apipartnerId);
        validateTrx(rec.DbtrAcct_Id_Iban, rec.apipartnerId);
        if not vIBANRec.IsEmpty then begin
            rec.techvIban := vIBANRec.techID;
            rec.apipartnerId := vIBANRec.apipartnerId;
            rec.collection_status := rec.collection_status::" ";

            rec.BookDt := WorkDate();
            rec.ValDt := WorkDate();
            if rec.vIBAN = rec.DbtrAcct_Id_Iban then begin
                //auftraggeber gelich schulder  - da geld abfliest SOLL
                rec.collection_status := rec.collection_status::not_initiated;
                //make -0 
                rec.Amt := ABS(rec.Amt) * -1;

                counterBooking(rec, rec.CdtrAcct_Id_Iban, (rec.Amt * -1)); //haben + 
            end else begin
                if rec.vIBAN = rec.DbtrAcct_Id_Iban then begin
                    rec.Amt := ABS(rec.Amt);
                    counterBooking(rec, rec.DbtrAcct_Id_Iban, (rec.Amt * -1));//soll -
                end;
            end;
        end;

    end;



    procedure validateTrx(waas_L: Code[32]; partnerID_L: Code[100])
    var
        trx: Record waas_T_Transactions;
        vibnConnectAcc: Record waas_T_ConnectAccount;
        vIBAN: Record virtual_bank_account;
    begin
        if waas_L = '' then
            Error('error: 6574 - vIBAN parameter is not in json');
        if partnerID_L = '' then
            Error('error: 6575 partner_id parameter is not in json');
        vIBAN.SetRange(virtual_iban, waas_L);
        vIBAN.SetRange(apipartnerId, partnerID_L);
        if vIBAN.FindFirst() then begin
            if vIBAN.blocked then begin
                Error('error: 6578 Payment can not be processed! Reason: vIBAN is blocked. VIBAN: ' + vIBAN.virtual_iban + ' : blocked since: ' + format(vIBAN.blockedDateTime));
            end;
            if vIBAN.deleted then
                Error('error: 6579 Payment can not be processed! Reason: vIBAN is deleted. VIBAN: ' + vIBAN.virtual_iban + ' : ' + format(vIBAN.deleted));

            vibnConnectAcc.SetRange(waas_id, vIBAN.techID);
            if not vibnConnectAcc.FindFirst() then
                Error('error: 6580 Payment can not be processed! Please create a reference IBAN to this vIBAN.');
        end else
            Error('error: 6576 vIBAN ' + waas_L + ' n/a. under this partner id');

    end;






    procedure counterBooking(recO: Record waas_T_Transactions; waas_p: Code[32]; amt_p: Decimal)
    var
        trx: Record waas_T_Transactions;
        trx2: Record waas_T_Transactions;
        vIBAN: Record virtual_bank_account;
    begin

        trx.TransferFields(recO);

        if trx2.FindLast() then
            trx.techID := trx2.techID + 2
        else
            trx.techID := 2;

        trx.vIBAN := waas_p;
        vIBAN.SetRange(vIBAN.virtual_iban, waas_p);
        vIBAN.FindFirst();
        trx.techvIban := vIBAN.techID;
        trx.apipartnerId := vIBAN.apipartnerId;
        trx.Amt := amt_p;

        trx.Insert();

    end;



}




