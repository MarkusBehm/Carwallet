codeunit 50302 WaaS_Installer
{
    trigger OnRun()
    begin
        caseBuilder('CarWallet');
        // caseBuilder('ImmoverwalterWallet')

    end;



    var
        myInt: Integer;


    procedure caseBuilder(caseB: text)
        ;
    begin
        case caseB of
            'CarWallet':
                begin
                    testAPIPartner('Hamburg', 'HH1');
                    testAPIPartner('Köln', 'K1');
                    testAPIPartner('München', 'M1');
                    textCaseVIBAN_CarWallet('HH1');
                    textCaseVIBAN_CarWallet('K1');
                    textCaseVIBAN_CarWallet('M1');
                    createCarGroups();
                    createCarvItems();
                    createvItemPrice();
                end;


        end;
    end;

    procedure testAPIPartner(kunde: Text; kundeID: Text)
    var
        partner: Record API_Partner;
        outstrea: OutStream;
        Instr: InStream;
        t: text;

    begin
        partner.Init();
        partner.Id := kundeID;
        partner.Name := Kunde;
        partner.Description := 'Slogan';
        partner.synthix_partnerid := 987;
        partner.vIBAN_gateway := 'Deutsche Bank';
        partner.vIBAN_gateway_account_id := 'DE9997070707070';
        partner.vIBAN_routing_number := '999';
        partner.ppu_sct_sct := 0.25;
        partner.ppu_sepa_sdd := 0.25;
        partner.ppu_viban_trx := 0.001;
        partner.ppu_viban_rtp := 0.32;
        partner.addAzureClientID := '{48f73329-3401-4506-97da-76a4c0b364bf}';


        partner.welcomeEmailTemplate.CreateOutStream(outstrea);
        outstrea.Write('Welcome');

        partner.accountBlockEmailTemplate.CreateOutStream(outstrea);
        outstrea.Write('Block');

        partner.accountdeBlockedEmailTemplate.CreateOutStream(outstrea);
        outstrea.Write('Unlock');

        partner.collectionEmailTemplate.CreateOutStream(outstrea);
        outstrea.Write('Collection');

        partner.Insert();
    end;

    procedure textCaseVIBAN_CarWallet(kundeId: text)
    begin
        if kundeId = 'PA1' then
            testviban(kundeId, 'CarWallet', 'PorscheAustria1', '', false, false, false, false, 'PorscheAustria1', 0);
        if kundeId = 'SA1' then
            testviban(kundeId, 'CarWallet', 'SkodaAustria1', '', false, false, false, false, 'SkodaAustria1', 0);
        if kundeId = 'PI1' then
            testviban(kundeId, 'CarWallet', 'ProscheItaly1', '', false, false, false, false, 'ProscheItaly1', 0);
        if kundeId = 'PG1' then
            testviban(kundeId, 'CarWallet', 'ProscheGermany1', '', false, false, false, false, 'ProscheGermany1', 0);
        if kundeId = 'PG2' then
            testviban(kundeId, 'CarWallet', 'ProscheGermany2', '', false, false, false, false, 'ProscheGermany2', 0);


        //noraml alles cool
        testvIBAN(kundeId, 'CarWallet', 'Dennis', 'Hellweg', false, false, false, false, '', 4);
        //wallet überzogen
        testvIBAN(kundeId, 'CarWallet', 'Tom', 'Ford', true, false, true, true, '', 1);
        //gelöscht kein api call mehr möglich
        //block walltet riskcheck
        testvIBAN(kundeId, 'CarWallet', 'Tatjana', 'Trump', true, false, false, true, '', 2);
        testvIBAN(kundeId, 'CarWallet', 'James', 'Wellkamp', false, true, false, true, '', 3);
        //TKE
        testvIBAN(kundeId, 'CarWallet', 'Max', 'Muster', false, false, false, true, '', 4);
        //Insurance
        testvIBAN(kundeId, 'CarWallet', 'Leo', 'Muster', false, false, false, true, '', 5);
        //Insurance
        testvIBAN(kundeId, 'CarWallet', 'Dennis', 'Muster', false, false, false, true, '', 5);
        //Aufladen
        testvIBAN(kundeId, 'CarWallet', 'Erhard', 'Muster', false, false, false, true, '', 5);
        //Aufladen
        testvIBAN(kundeId, 'CarWallet', 'Marcel', 'Muster', false, false, false, true, '', 4);
        //Aufladen
        testvIBAN(kundeId, 'CarWallet', 'Lisa', 'Muster', false, false, false, true, '', 3);
        //Aufladen
        testvIBAN(kundeId, 'CarWallet', 'Gina', 'Muster', false, false, false, true, '', 2);
        //Aufladen
        //Aufladen
        testvIBAN(kundeId, 'CarWallet', 'Teresia', 'Muster', false, false, false, true, '', 1);
        //Aufladen
        testvIBAN(kundeId, 'CarWallet', 'Gunna', 'Muster', false, false, false, true, '', 4);
        //Aufladen
        testvIBAN(kundeId, 'CarWallet', 'Ahmend', 'Muster', false, false, false, true, '', 6);
        //Aufladen
        testvIBAN(kundeId, 'CarWallet', 'Klaus', 'Muster', false, false, false, true, '', 3);

        //noraml alles cool
        testvIBAN(kundeId, 'CarWallet', 'Klara', 'Soma', false, false, false, true, '', 4);
        testvIBAN(kundeId, 'CarWallet', 'Anna', 'Hartmann', false, false, false, true, '', 4);
        testvIBAN(kundeId, 'CarWallet', 'Donata', 'Timber', false, false, false, true, '', 4);

        //wallet überzogen
        testvIBAN(kundeId, 'CarWallet', 'Matthias', 'Illinger', true, false, true, true, '', 3);
        //gelöscht kein api call mehr möglich
        testvIBAN(kundeId, 'CarWallet', 'Max', 'Flachinger', false, true, false, true, '', 6);
        //block walltet riskcheck
        testvIBAN(kundeId, 'CarWallet', 'Lena', 'Lohbinger', true, false, false, true, '', 5);
    end;

    procedure testviban(apiPartner_p: COde[50]; caseB: Text[20]; vor_p: Text[20]; nach_p: text[20]; block: Boolean; deleted: Boolean; minus: Boolean; company_P: Boolean; compName: Text[100]; vItemNo_P: Integer)
    var
        partner: Record API_Partner;
        vIBANRec: Record virtual_bank_account;
        vibanConnectAcc: Record waas_T_ConnectAccount;
        vibanTrx: Record waas_T_Transactions;
        cuIBAN: Codeunit waas_C_Mgt;

        partnerIdCode: Code[50];
        idate: Integer;



    begin
        partner.get(apiPartner_p);

        vIBANRec.Init();
        vIBANRec.techID := CreateGuid();
        vIBANRec.virtual_iban := cuIBAN.create_viban('DE', '999', vIBANRec.customerAccountNumer);
        vIBANRec.CountryCode := 'DE';
        vIBANRec.apipartnerId := apiPartner_p;
        vIBANRec.blocked := block; //wallet überzogen
        vIBANRec.deleted := deleted; //kein api call mehr möglich

        if company_P then
            vIBANRec.companyId := createComp(compName, 'GmbH', 'DE');

        vIBANRec.customer_id := createaPerson(vor_P, nach_p);
        vIBANRec.Fullname := vor_p + ' ' + nach_p;
        vIBANRec.email := vor_p + '.' + nach_p + '@gmail.com';
        vIBANRec.vItem := vItemNo_P;
        vIBANRec.VIN := 'WPOZZZ91ZGS15' + format(Random(99999));
        vIBANRec."license plate" := 'HH-AL-098';
        vIBANRec."HSN" := '0058';
        vIBANRec."TSN" := 'AJO 00018';
        
        vIBANRec.Insert();
        Commit();


        vibanConnectAcc.waas_id := vIBANRec.techID;
        vibanConnectAcc.AccountholderName := compName;
        vibanConnectAcc.api_partner := apiPartner_p;
        vibanConnectAcc.IBAN := 'DE02120300000000202051';
        vibanConnectAcc.BIC := 'BYLADEM1001';
        vibanConnectAcc.Bankname := 'DEUTSCHE KREDITBANK BERLIN';
        vibanConnectAcc.aktiv := true;
        vibanConnectAcc.direct_debit_agreement := true;

        vibanConnectAcc.Insert();
        idate := 1;


        if not vibanTrx.FindLast() then
            vibanTrx.techID := 1
        else
            vibanTrx.techID := vibanTrx.techID + 1;

        repeat

            vibanTrx.BookDt := WorkDate() + idate;
            vibanTrx.techvIban := vIBANRec.techID;
            vibanTrx.apipartnerId := apiPartner_p;
            vibanTrx.ValDt := vibanTrx.BookDt;

            vibanTrx.collection_status := vibanTrx.collection_status::" ";
            vibanTrx.vIBAN := vIBANRec.virtual_iban;
            prgetRandomTrasxText_Carwallet(vibanTrx, idate, partner.Name);
            idate := 10;
            vibanTrx.Ccy := 'EUR';
            vibanTrx.Insert();


            vibanTrx.techID := vibanTrx.techID + 1;
            vibanTrx.techvIban := vIBANRec.techID;
            vibanTrx.vIBAN := vIBANRec.virtual_iban;
            vibanTrx.apipartnerId := apiPartner_p;
            vibanTrx.collection_status := vibanTrx.collection_status::not_initiated;
            prgetRandomTrasxText_Carwallet(vibanTrx, idate, partner.Name);
            vibanTrx.Dbtr_Nm := vIBANRec.Fullname;

            vibanTrx.Ustrd := vibanTrx.Dbtr_Nm + ',' + vibanTrx.Ustrd;
            vibanTrx.Dbtr_Nm := vibanTrx.Dbtr_Nm;//'TK Elevator GmbH';
            vibanTrx.Amt := vibanTrx.Amt * -1;

            vibanTrx.Insert();
            vibanTrx.techID := vibanTrx.techID + 1;

            idate += 1;


        until idate >= 10;




    end;

    procedure createaPerson(fn_P: Text; ln_P: Text): Integer
    var

        dbAcc: Record waas_T_Person;
        dbAdress: Record waas_T_Adresses;
        comp_T: Record waas_T_Person;
        enum_academicTitle: Enum enum_academicTitle;
        enum_community: Enum enum_community;
        enum_sex: Enum enum_sex;
        enum_proprietaryStatus: enum enum_proprietaryStatus;
        enum_employmentStatus: enum enum_employmentStatus;
        eunm_employmentLevel: enum eunm_employmentLevel;
        enum_maritalStatus: Enum enum_maritalStatus;
        enum_legalform: ENum enum_legalform;
        enum_accountProductId: Enum enum_accountProductId;
        enum_savingsAccountProduct: ENum enum_savingsAccountProduct;

        MyInStream: InStream;
        MessageText: Text;
        uri: Text;
        _queryObj: Text;
        accessToken: Text;
        RMethod: text;




    begin
        if comp_T.FindLast() then
            dbAcc.techId := comp_T.techId + 1
        else
            dbAcc.techId := 1;
        dbAcc.personCommunityType := '';
        //partners
        dbAcc.index := 1;
        dbAcc.firstName := fn_P;
        dbAcc.lastName := ln_P;
        dbAcc.emailAddress := fn_P + ln_P + '@gmail.com';
        dbAcc.sex := enum_sex::MALE;
        dbAcc.dateOfBirth := 19850202D;
        dbAcc.placeOfBirth := 'Hamburg';
        dbAcc.schufaAccordance := true;
        dbAcc.nationality := 'GERMAN';
        dbAcc.maritalStatus := enum_maritalStatus::SINGLE;
        dbAcc.maidenName := '';
        dbAcc.academicTitle := enum_academicTitle::" ";
        dbAcc.proprietaryStatus := enum_proprietaryStatus::OWN_PROPERTY;
        dbAcc.employmentStatus := enum_employmentStatus::EMPLOYED;
        //registerAdress

        dbAdress.techID := CreateGuid();
        dbAdress.street := 'Haulandsweg';
        dbAdress.houseNumber := '21';
        dbAdress.zip := '21220';
        dbAdress.city := 'Seevetal';
        dbAdress.country := 'GER';
        dbAdress.Insert();


        dbAcc.AdressID := dbAdress.techID;
        //communicationAdress
        dbAcc.comm_city := '';
        dbAcc.comm_country := '';
        dbAcc.comm_houseNumber := '';
        dbAcc.comm_street := '';
        dbAcc.comm_zipCode := '';
        //phone
        dbAcc.telephoneNumber := '40406123';
        dbAcc.phoneareaCode := '4105';
        dbAcc.phoneinternationalAreaCode := '+49';
        //email
        //employemtInfo
        dbAcc.industryCodeEmployer := '';
        dbAcc.employmentLevel := eunm_employmentLevel::MASTER;
        dbAcc.employedSince := '2004';
        //selfemploymentInfo
        dbAcc.industryCodeSelfEmployer := '';
        dbAcc.legalForm := enum_legalform::FREELANCER;
        dbAcc.self_employedSince := '';
        //tax
        dbAcc.isBornInTheUS := false;
        dbAcc.isNonGermanTaxPayer := false;
        dbAcc.isGermanTaxPayer := true;
        dbAcc.isSecondNationalityUS := false;
        dbAcc.tin := '12345678911';
        dbAcc.selfEmployedTaxID := '';
        dbAcc.nonGermanTaxPayerCountry1 := '';
        dbAcc.nonGermanTaxId1 := '';
        dbAcc.nonGermanTaxPayerCountry2 := '';
        dbAcc.nonGermanTaxId2 := '';
        dbAcc.nonGermanTaxPayerCountry3 := '';
        dbAcc.nonGermanTaxId3 := '';
        //ende
        dbAcc.isActingForOwnAccount := true;
        //currentaccount
        dbAcc.accountProductId := enum_accountProductId::DB_AKTIVKONTO;
        dbAcc.accountCurrency := 'EUR';
        dbAcc.isSalaryAccount := true;
        dbAcc.periodicIncomingPayments := true;
        dbAcc.endDateYoungAccount := '';
        //ende
        //overdraft
        dbAcc.requestedOverdraftCredit := 500;
        //saving
        //bAcc.savingsAccountProduct := enum_savingsAccountProduct::NB_TAGESGELDKONTO;

        dbAcc.netIncome := 2700;
        dbAcc.rentalExpenses := 450;
        dbAcc.loanExpenses := 500;
        dbAcc.additionalLoanExpenses := 12;
        dbAcc.insuranceExpenses := 50;
        dbAcc.dependentChildren := 0;
        dbAcc.alimonyPayment := 0;
        dbAcc.Insert();
        Commit();
        exit(dbAcc.techId);



    end;

    local procedure prgetRandomTrasxText_Carwallet(var vibanTrx: Record waas_T_Transactions; i: Integer; debtor: Text)
    var
        vIbanRec: Record virtual_bank_account;

    begin

        case i of
            1:
                begin

                    vibanTrx.Ustrd := '#Rent'+format(Today)+Format(Today+10);
                    vibanTrx.Dbtr_Nm := debtor;
                    vibanTrx.Amt := 495.55;
                    vIbanRec.SetRange(Fullname, vibanTrx.Dbtr_Nm);
                    if vIbanRec.FindFirst() then
                        vibanTrx.CdtrAcct_Id_Iban := vIbanRec.virtual_iban;
                end;
            2:
                begin
                    vibanTrx.Ustrd := '#ENBW Strom 26.88KwH ID:32Ytf16a54a';
                    vibanTrx.Dbtr_Nm := debtor;
                    vibanTrx.Amt := 45.85;
                    vIbanRec.SetRange(Fullname, vibanTrx.Dbtr_Nm);
                    if vIbanRec.FindFirst() then
                        vibanTrx.CdtrAcct_Id_Iban := vIbanRec.virtual_iban;
                end;
            3:
                begin
                    vibanTrx.Ustrd := '#Zusatzfahrer Paket 4.78 ID:65asxx23';
                    vibanTrx.Dbtr_Nm := debtor;
                    vibanTrx.Amt := 5.99;
                    vIbanRec.SetRange(Fullname, vibanTrx.Dbtr_Nm);
                    if vIbanRec.FindFirst() then
                        vibanTrx.CdtrAcct_Id_Iban := vIbanRec.virtual_iban;

                end;

            4:
                begin
                    
                    vibanTrx.Ustrd := '#ARAL PowerCharge 12.55KwH';
                    vibanTrx.Dbtr_Nm := debtor;
                    vibanTrx.Amt := 25.99;
                    vIbanRec.SetRange(Fullname, vibanTrx.Dbtr_Nm);
                    if vIbanRec.FindFirst() then
                        vibanTrx.CdtrAcct_Id_Iban := vIbanRec.virtual_iban;

                end;
            5:
                begin
                    
                    vibanTrx.Ustrd := '#CARGlass Rech.Nr.234511';
                    vibanTrx.Dbtr_Nm := debtor;
                    vibanTrx.Amt := 655.99;
                    vIbanRec.SetRange(Fullname, vibanTrx.Dbtr_Nm);
                    if vIbanRec.FindFirst() then
                        vibanTrx.CdtrAcct_Id_Iban := vIbanRec.virtual_iban;

                end;
            6:
                begin
                end;

            7:
                begin
                end;

            8:
                begin
                end;
            9:
                begin
                end;

            10:
                begin
                end;

        end;



    end;


    local procedure prgetRandomTrasxText(var vibanTrx: Record waas_T_Transactions; i: Integer)
    var
        vIbanRec: Record virtual_bank_account;

    begin

        case i of
            1:
                begin
                    vibanTrx.Amt := 258.09;
                    vibanTrx.Ustrd := 'E-Checkup Semperstr.22 Aufzug2321112 25.7.2022';
                    vibanTrx.Dbtr_Nm := 'ElectroHeinz GmbH';
                    vIbanRec.SetRange(Fullname, vibanTrx.Dbtr_Nm);
                    if vIbanRec.FindFirst() then
                        vibanTrx.vIBAN := vIbanRec.virtual_iban;



                end;
            2:
                begin
                    vibanTrx.Amt := 9.99;
                    vibanTrx.Ustrd := 'Hotline ABO 24/7 #75737474 9.99';
                    vibanTrx.Dbtr_Nm := 'Vodafone';
                    vIbanRec.SetRange(Fullname, vibanTrx.Dbtr_Nm);
                    if vIbanRec.FindFirst() then
                        vibanTrx.vIBAN := vIbanRec.virtual_iban;
                end;
            3:
                begin
                    vibanTrx.Amt := 9.99;
                    vibanTrx.Ustrd := 'ABO WLAN-Modul #75737474 16.99';
                    vibanTrx.Dbtr_Nm := 'Vodafone';
                    vIbanRec.SetRange(Fullname, vibanTrx.Dbtr_Nm);
                    if vIbanRec.FindFirst() then
                        vibanTrx.vIBAN := vIbanRec.virtual_iban;
                end;

            4:
                begin
                    vibanTrx.Amt := 849.55;
                    vibanTrx.Ustrd := 'Miete Mai23';
                    vibanTrx.Dbtr_Nm := 'VONOVIA';
                    vIbanRec.SetRange(Fullname, vibanTrx.Dbtr_Nm);
                    if vIbanRec.FindFirst() then
                        vibanTrx.vIBAN := vIbanRec.virtual_iban;
                end;
            5:
                begin
                    vibanTrx.Amt := 144.33;
                    vibanTrx.Ustrd := 'Netfilx ABO';
                    vibanTrx.Dbtr_Nm := 'Netfilx';
                    vIbanRec.SetRange(Fullname, vibanTrx.Dbtr_Nm);
                    if vIbanRec.FindFirst() then
                        vibanTrx.vIBAN := vIbanRec.virtual_iban;
                end;
            6:
                begin
                    vibanTrx.Amt := 269.88;
                    vibanTrx.Ustrd := 'Haftpflicht&Hausrat Versicherung';
                    vibanTrx.Dbtr_Nm := 'Allianz AG';
                    vIbanRec.SetRange(Fullname, vibanTrx.Dbtr_Nm);
                    if vIbanRec.FindFirst() then
                        vibanTrx.vIBAN := vIbanRec.virtual_iban;
                end;

            7:
                begin
                    vibanTrx.Amt := 549.55;
                    vibanTrx.Ustrd := 'Hemden ReinigungsService';
                    vibanTrx.Dbtr_Nm := 'ReinigungMayer';
                    vIbanRec.SetRange(Fullname, vibanTrx.Dbtr_Nm);
                    if vIbanRec.FindFirst() then
                        vibanTrx.vIBAN := vIbanRec.virtual_iban;
                end;

            8:
                begin
                    vibanTrx.Amt := 144.99;
                    vibanTrx.Ustrd := 'Nebekosten 31.03-31-12.22';
                    vibanTrx.Dbtr_Nm := 'VONOVIA';
                    vIbanRec.SetRange(Fullname, vibanTrx.Dbtr_Nm);
                    if vIbanRec.FindFirst() then
                        vibanTrx.vIBAN := vIbanRec.virtual_iban;
                end;
            9:
                begin
                    vibanTrx.Amt := 194.99;
                    vibanTrx.Ustrd := 'Parkplatz E65 UG2';
                    vibanTrx.Dbtr_Nm := 'VONIVIA';
                    vIbanRec.SetRange(Fullname, vibanTrx.Dbtr_Nm);
                    if vIbanRec.FindFirst() then
                        vibanTrx.vIBAN := vIbanRec.virtual_iban;
                end;

            10:
                begin
                    vibanTrx.Amt := 649.99;
                    vibanTrx.Ustrd := 'Mitgliedbeitrag Mai';
                    vibanTrx.Dbtr_Nm := 'Life Fitness GmbH';
                    vIbanRec.SetRange(Fullname, vibanTrx.Dbtr_Nm);
                    if vIbanRec.FindFirst() then
                        vibanTrx.vIBAN := vIbanRec.virtual_iban;
                end;

        end;



    end;

    procedure createComp(Name: Text; Juri: Text; contr: text): BigInteger
    var
        comp_L: Record waas_T_Company;
        comp_T: Record waas_T_Company;
        adr: Record waas_T_Adresses;
    begin
        adr.street := 'Elbchaussee';
        adr.houseNumber := '44';
        adr.city := 'Hamburg';
        adr.country := contr;
        adr.addressType := 'BUSINESS';
        adr.techID := CreateGuid();
        adr.Insert();


        comp_L.Init();
        if comp_T.FindLast() then
            comp_L.techId := comp_T.techId + 1
        else
            comp_L.techId := 1;
        comp_L.communityName := Name;
        comp_L.company_number := 'HR1235d6';
        comp_L.AdressID := adr.techID;
        comp_L.agb := true;
        comp_L.IBAN := 'DE123456978912';
        comp_L.BIc := 'BYNLADEMXXX';
        comp_L.current_registerstatus := 'Approved';
        comp_L.juristic_code := Juri;
        comp_L.Insert();
        exit(comp_L.techId);

    end;



    procedure createCarGroups()
    var
        recGroup: Record waas_T_vItemGroup;
    begin

        recGroup.Name := 'BYD';
        recGroup.id := 'BYD';
        recGroup.Insert();

        recGroup.Name := 'LYNC';
        recGroup.id := 'LYNC';
        recGroup.Insert();

        recGroup.Name := 'Polestar';
        recGroup.id := 'PLST';
        recGroup.Insert();


        recGroup.Name := 'Volkswagen';
        recGroup.id := 'VW';
        recGroup.Insert();

        recGroup.Name := 'Tesla';
        recGroup.id := 'TESLA';
        recGroup.Insert();

        recGroup.Name := 'MG';
        recGroup.id := 'MG';
        recGroup.Insert();


    end;


    procedure createCarvItems()
    var
        recItem: Record waas_T_vItem;
    begin

        recItem.id := 0;
        recItem.externalName := 'BYD Atto 3';
        recItem.name := 'BYDAtto3';
        recItem.item_group_id := 'BYD';
        recItem.description := 'Elektro Limousine';
        recItem.Insert();



        recItem.id := 0;
        recItem.externalName := 'Lync o1';
        recItem.name := 'LYNCo1';
        recItem.item_group_id := 'LYNC';
        recItem.description := 'SUV Hybrid';
        recItem.Insert();


        recItem.id := 0;
        recItem.externalName := 'MG MG5';
        recItem.name := 'MGmg5';
        recItem.item_group_id := 'MG';
        recItem.description := 'Combi Electro';
        recItem.Insert();


        recItem.id := 0;
        recItem.externalName := 'Polestar 2';
        recItem.name := 'Polestar2';
        recItem.item_group_id := 'PLST';
        recItem.description := 'Elektro Limousine';
        recItem.Insert();

        recItem.id := 0;
        recItem.externalName := 'Tesla 3';
        recItem.name := 'Tesla Model 3';
        recItem.item_group_id := 'TESLA';
        recItem.description := 'Electro Limousine';
        recItem.Insert();


        recItem.id := 0;
        recItem.externalName := 'VW Tiguan';
        recItem.name := 'VW Tiguan';
        recItem.item_group_id := 'VW';
        recItem.description := 'SUV';
        recItem.Insert();

    end;







    procedure createvItemPrice()
    var
        recItemPrice: Record waas_T_vItem_Price;
    begin


        recItemPrice.currency_code := 'EUR';
        recItemPrice.external_name := 'Auslandsfahrt';
        recItemPrice.free_quantity := 0;
        recItemPrice.id := 'GER_CROSSBOARDER_Pakage';
        recItemPrice.is_taxable := true;
        recItemPrice.item_id := 1;
        recItemPrice.item_type := recItemPrice.item_type::addon;
        recItemPrice.name := 'standard EUR monthly';
        recItemPrice.period := 1;
        recItemPrice.period_unit := recItemPrice.period_unit::month;
        recItemPrice.price := 9.98;
        recItemPrice.pricing_model := recItemPrice.pricing_model::flat_fee;
        recItemPrice.price_in_decimal := 9.98;
        recItemPrice.Insert();


        recItemPrice.techid := 0;
        recItemPrice.currency_code := 'EUR';
        recItemPrice.external_name := 'Zusatzfahrer';
        recItemPrice.free_quantity := 1;
        recItemPrice.id := 'GER_AddOnDriver_Pakage';
        recItemPrice.is_taxable := true;
        recItemPrice.item_id := 1;
        recItemPrice.item_type := recItemPrice.item_type::addon;
        recItemPrice.name := 'standard EUR monthly';
        recItemPrice.period := 1;
        recItemPrice.period_unit := recItemPrice.period_unit::month;
        recItemPrice.price := 9.98;
        recItemPrice.pricing_model := recItemPrice.pricing_model::flat_fee;
        recItemPrice.price_in_decimal := 9.98;
        recItemPrice.Insert();


        recItemPrice.techid := 0;
        recItemPrice.currency_code := 'EUR';
        recItemPrice.external_name := 'Ergo Insassenschutz';
        recItemPrice.free_quantity := 1;
        recItemPrice.id := 'GER_ZR_PassangerIns_Pakage';
        recItemPrice.is_taxable := true;
        recItemPrice.item_id := 1;
        recItemPrice.item_type := recItemPrice.item_type::addon;
        recItemPrice.name := 'standard EUR monthly';
        recItemPrice.period := 1;
        recItemPrice.price := 5.98;
        recItemPrice.pricing_model := recItemPrice.pricing_model::per_Unit;
        recItemPrice.price_in_decimal := 5.98;
        recItemPrice.Insert();


        recItemPrice.techid := 0;
        recItemPrice.currency_code := 'EUR';
        recItemPrice.external_name := 'Ergo Auslandskrankenversicherung';
        recItemPrice.free_quantity := 1;
        recItemPrice.id := 'GER_ERGO_AKV_Pakage';
        recItemPrice.is_taxable := true;
        recItemPrice.item_id := 1;
        recItemPrice.item_type := recItemPrice.item_type::addon;
        recItemPrice.name := 'standard EUR';
        recItemPrice.period := 1;
        recItemPrice.period_unit := recItemPrice.period_unit::year;
        recItemPrice.price := 19.98;
        recItemPrice.pricing_model := recItemPrice.pricing_model::per_Unit;
        recItemPrice.price_in_decimal := 19.98;
        recItemPrice.Insert();







    end;


}

//pageextension 54545 asdf extends 21