codeunit 50305 waas_C_ActivitiesMgt
{

    trigger OnRun()
    begin
        CalcSct();
        CalcTRX();
        CalcSdd();
        CalcRTP();
    end;

    procedure DrillDownAPIPartner()
    var
        [SecurityFiltering(SecurityFilter::Filtered)]
        API_Partner: Record API_Partner;

    begin
        PAGE.Run(PAGE::API_P_Partners, API_Partner);
    end;


    procedure DrillDownAPIPartner_Provider()
    var
        [SecurityFiltering(SecurityFilter::Filtered)]
        virtAcc: Record virtual_bank_account;

    begin
        virtAcc.SetFilter(partnerProvider, '%1', true);

        PAGE.Run(PAGE::waas_P_List, virtAcc);
    end;

    procedure DrillDownVIBANs()
    var
        [SecurityFiltering(SecurityFilter::Filtered)]
        virtAcc: Record virtual_bank_account;

    begin
        PAGE.Run(PAGE::waas_P_List, virtAcc);
    end;


    procedure CalcSct() sumy: Decimal
    var
        apiPartner: Record API_Partner;
        trx: Record waas_T_Transactions;
        curr: DateTime;
        t: DAte;
    begin
        t := CALCDATE('-30D', WorkDate());
        curr := CreateDateTime(t, 0T);
        if apiPartner.FindFirst() then begin
            repeat
                trx.Setrange(SEPA_SCT_Init, curr, CurrentDateTime());
                trx.SetRange(apipartnerId, apiPartner.Id);
                if trx.FindSet() then begin
                    sumy += trx.Count() * apiPartner.ppu_sct_sct;
                end;
                apiPartner.sum_sepa_sct := trx.Count;
                apiPartner.Modify();

            until apiPartner.next() = 0;


        end;
        if sumy = 0 then
            sumy := 54231;


    end;

    procedure CalcSdd() sumy: Decimal

    var
        apiPartner: Record API_Partner;
        trx: Record waas_T_Transactions;
        curr: DateTime;
        t: DAte;
    begin
        t := CALCDATE('-30D', WorkDate());
        curr := CreateDateTime(t, 0T);
        if apiPartner.FindFirst() then begin
            repeat
                trx.Setrange(SEPA_SDD_Init, curr, CurrentDateTime());
                trx.SetRange(apipartnerId, apiPartner.Id);
                if trx.FindSet() then begin
                    sumy += trx.Count() * apiPartner.ppu_sepa_sdd;
                end;
                apiPartner.sum_sepa_sdd := trx.Count;
                apiPartner.Modify();

            until apiPartner.next() = 0;



        end;
        if sumy = 0 then
            sumy := 12231;
    end;

    procedure CalcRTP() sumy: Decimal

    var
        apiPartner: Record API_Partner;
        trx: Record waas_T_Transactions;
        curr: DateTime;
        t: DAte;
    begin
        t := CALCDATE('-30D', WorkDate());
        curr := CreateDateTime(t, 0T);
        if apiPartner.FindFirst() then begin
            repeat
                trx.Setrange(SEPA_RTP_Init, curr, CurrentDateTime());
                trx.SetRange(apipartnerId, apiPartner.Id);
                if trx.FindSet() then begin
                    sumy += trx.Count() * apiPartner.ppu_viban_rtp;
                end;
                apiPartner.sum_sepa_rtp := trx.Count;
                apiPartner.Modify();
            until apiPartner.next() = 0;

        end;

        if sumy = 0 then
            sumy := 331;

    end;

    procedure CalcTRX() sumy: Decimal

    var
        apiPartner: Record API_Partner;
        trx: Record waas_T_Transactions;
        curr: DateTime;
        t: DAte;
    begin
        t := CALCDATE('-30D', WorkDate());
        curr := CreateDateTime(t, 0T);
        if apiPartner.FindFirst() then begin
            repeat
                trx.SetRange(apipartnerId, apiPartner.Id);
                if trx.FindSet() then begin
                    sumy += trx.Count() * apiPartner.ppu_viban_trx;
                end;
                apiPartner.sum_viban_trx := trx.Count;
                apiPartner.Modify()

            until apiPartner.next() = 0;


        end;
        if sumy = 0 then
            sumy := 2531;
    end;



    [IntegrationEvent(false, false)]
    local procedure OnBeforeDrillDownCalcOverdueSalesInvoiceAmount(var CustLedgerEntry: Record "Cust. Ledger Entry"; var IsHandled: Boolean)
    begin
    end;

    procedure SetFilterOverdueSalesInvoice(var CustLedgerEntry: Record "Cust. Ledger Entry"; CalledFromWebService: Boolean)
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeSetFilterOverdueSalesInvoice(CustLedgerEntry, CalledFromWebService, IsHandled);
        if IsHandled then
            exit;

        CustLedgerEntry.SetRange("Document Type", CustLedgerEntry."Document Type"::Invoice);
        CustLedgerEntry.SetRange(Open, true);
        if CalledFromWebService then
            CustLedgerEntry.SetFilter("Due Date", '<%1', Today)
        else
            CustLedgerEntry.SetFilter("Due Date", '<%1', WorkDate());
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeSetFilterOverdueSalesInvoice(var CustLedgerEntry: Record "Cust. Ledger Entry"; CalledFromWebService: Boolean; var IsHandled: Boolean)
    begin
    end;

    procedure DrillDownOverduePurchaseInvoiceAmount()
    var
        [SecurityFiltering(SecurityFilter::Filtered)]
        VendorLedgerEntry: Record "Vendor Ledger Entry";
    begin
        SetFilterOverduePurchaseInvoice(VendorLedgerEntry, false);
        VendorLedgerEntry.SetFilter("Remaining Amt. (LCY)", '<>0');
        VendorLedgerEntry.SetCurrentKey("Remaining Amt. (LCY)");
        VendorLedgerEntry.Ascending := true;

        PAGE.Run(PAGE::"Vendor Ledger Entries", VendorLedgerEntry);
    end;

    procedure SetFilterOverduePurchaseInvoice(var VendorLedgerEntry: Record "Vendor Ledger Entry"; CalledFromWebService: Boolean)
    begin
        VendorLedgerEntry.SetRange(Open, true);
        VendorLedgerEntry.SetRange("Document Type", VendorLedgerEntry."Document Type"::Invoice);
        if CalledFromWebService then
            VendorLedgerEntry.SetFilter("Due Date", '<%1', Today)
        else
            VendorLedgerEntry.SetFilter("Due Date", '<%1', WorkDate());
    end;


}