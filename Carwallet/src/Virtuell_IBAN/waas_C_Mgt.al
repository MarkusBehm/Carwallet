codeunit 50306 waas_C_Mgt
{
    trigger OnRun()
    begin


        mailRunner();
        // if sdd_initiating() then;

    end;

    var
        Result: Dictionary of [Text, Text];



    procedure sdd_initiating(): Boolean
    var

        trx: Record waas_T_Transactions;
        trxNew: Record waas_T_Transactions;

        trx2: Record waas_T_Transactions;
        vIBAN: Record virtual_bank_account;
        apiPartner: Record API_Partner;
        MyNotification: Notification;



    begin

        trx.SetRange(collection_status, trx.collection_status::not_initiated);
        trx.Setfilter(Amt, '<%1', 0);

        if trx.FindSet(true) then begin

            repeat
                if vIBAN.get(trx.techvIban) then begin
                    if vIBAN.preferd_compensation = vIBAN.preferd_compensation::sdd then begin
                        apiPartner.get(vIBAN.apipartnerId);

                        trxNew.TransferFields(trx);
                        if trx2.FindLast() then
                            trxNew.techID := trx2.techID + 1
                        else
                            trxNew.techID := 1;
                        trxNew.CdtrAcct_Id_Iban := trx.DbtrAcct_Id_Iban;
                        trxNew.collection_status := trx.collection_status::sdd_initiatetd;
                        trxNew.DbtrAcct_Id_Iban := apiPartner.viban_gateway_account_id;
                        trxNew.vIBAN := apiPartner.viban_gateway_account_id;
                        trxNew.Insert();


                        trx.collection_status := trx.collection_status::sdd_initiatetd;
                        trx.SEPA_SDD_Init := CurrentDateTime();
                        //call API
                        trx.Modify();
                    end;
                end else begin
                    MyNotification.Message := 'techVIBAN not exsist ' + (trx.techvIban);
                    MyNotification.Scope := NotificationScope::LocalScope;
                    MyNotification.Send();
                end;
            until trx.NEXT <= 0;




        end;




    end;

    procedure create_viban(icoCountry3166: Code[2]; clientId: Code[3]; var accNo: Code[10]): Code[27]
    var
        prefix: CODe[2];
        checkSum: Code[2];
        bankSortCode: Code[20];
        bankId: Code[50];
        ibanCustomer: Code[27];
        modNUmber: BigInteger;

        cs: BigInteger;

    begin

        //UK
        //if prefix <> 'DE' then


        if (icoCountry3166 = '') then
            Error('ISO Countrycode is empty');
        if (StrLen(icoCountry3166) <= 1) then
            Error('ISO Country Code 3166 must have 2 characters');
        if (clientId = '') then
            Error('clientdID is empty');
        if (StrLen(clientId) <= 2) then
            Error('ClientId must have 3 characters');


        prefix := UpperCase(icoCountry3166);
        checkSum := '00';
        if prefix = 'DE' then
            bankSortCode := '12070070';
        if prefix = 'UK' then
            bankSortCode := 'DEUT234238';
        if prefix = 'FR' then
            bankSortCode := '1778900999';
        if prefix = 'IT' then
            bankSortCode := '0310401633';
        if prefix = 'NL' then
            bankSortCode := 'DEUT7';
        if prefix = 'PT' then
            bankSortCode := '50004399999';


        bankId := bankSortCode + (replaceLetter(CopyStr(prefix, 1, 1))) + (replaceLetter(copystr(prefix, 2, 1))) + checkSum;
        if (prefix = 'UK') or (prefix = 'NL') then
            bankId := DelStr(bankId, 1, 4);

        Evaluate(modNUmber, bankId);
        modNUmber := modNUmber mod 97;

        cs := 98 - modNUmber;
        accNo := getNextCustomerAccountNumber(prefix);
        if prefix = 'DE' then
            ibanCustomer := prefix + Format(cs) + bankSortCode + clientId + accNo;
        if prefix = 'UK' then
            ibanCustomer := prefix + Format(cs) + bankSortCode + clientId + accNo;
        if prefix = 'FR' then
            ibanCustomer := prefix + '76' + bankSortCode + clientId + accNo + Format(cs);
        if prefix = 'IT' then
            ibanCustomer := prefix + Format(cs) + bankSortCode + clientId + accNo;
        if prefix = 'NL' then
            ibanCustomer := prefix + Format(cs) + bankSortCode + clientId + accNo;
        if prefix = 'PT' then
            ibanCustomer := prefix + bankSortCode + clientId + accNo + Format(cs);

        exit(ibanCustomer);





    end;


    local procedure getNextCustomerAccountNumber(countryCode: Code[2]): Code[10]
    var
        recVIBAN: Record virtual_bank_account;
        returnValue: Code[10];
    begin
        recVIBAN.SetRange(CountryCode, countryCode);
        recVIBAN.SetCurrentKey(SystemCreatedAt);
        if recVIBAN.FindLast() then begin
            returnValue := IncStr(recVIBAN.customerAccountNumer);
            if countryCode = 'DE' then begin
                if StrLen(returnValue) > 7 then
                    Error('Accountnumber Rage is full');
                if countryCode = 'UK' then
                    if StrLen(returnValue) > 6 then
                        Error('Accountnumber Rage is full');//6 digits
                if countryCode = 'DE' then
                    if StrLen(returnValue) > 7 then
                        Error('Accountnumber Rage is full');//7 Digits
                if countryCode = 'FR' then
                    if StrLen(returnValue) > 8 then
                        Error('Accountnumber Rage is full');//8 digits
                if countryCode = 'IT' then
                    if StrLen(returnValue) > 9 then
                        Error('Accountnumber Rage is full');//9 digits
                if countryCode = 'NL' then
                    if StrLen(returnValue) > 7 then
                        Error('Accountnumber Rage is full');//7 digits
                if countryCode = 'PT' then
                    if StrLen(returnValue) > 9 then
                        Error('Accountnumber Rage is full');//9 digits    

            end

        end
        else begin
            if countryCode = 'UK' then
                returnValue := '000001';//6 digits
            if countryCode = 'DE' then
                returnValue := '0000001';//7 Digits
            if countryCode = 'FR' then
                returnValue := '00000001';//8 digits
            if countryCode = 'IT' then
                returnValue := '000000001';//9 digits
            if countryCode = 'NL' then
                returnValue := '0000001';//7 digits
            if countryCode = 'PT' then
                returnValue := '000000001';//9 digits


        end;

        exit(returnValue);
    end;

    local procedure replaceLetter(number: Code[1]) returnV: Code[2]

    begin

        case
          UpperCase(number) of
            'A':
                returnV := '10';
            'B':
                returnV := '11';
            'C':
                returnV := '12';
            'D':
                returnV := '13';
            'E':
                returnV := '14';
            'F':
                returnV := '15';
            'G':
                returnV := '16';
            'H':
                returnV := '17';
            'I':
                returnV := '18';
            'J':
                returnV := '19';
            'K':
                returnV := '20';
            'L':
                returnV := '21';
            'M':
                returnV := '22';
            'N':
                returnV := '23';
            'O':
                returnV := '23';
            'P':
                returnV := '25';
            'Q':
                returnV := '26';
            'R':
                returnV := '27';
            'S':
                returnV := '28';
            'T':
                returnV := '29';
            'U':
                returnV := '30';
            'V':
                returnV := '31';
            'W':
                returnV := '32';
            'X':
                returnV := '33';
            'Y':
                returnV := '34';
            'Z':
                returnV := '35';
        end;
    end;

    procedure ImportCamt53()
    var
        InS: InStream;
        FileName: Text;
        XmlDoc: XmlDocument;
        Root: XmlElement;
        Records: XmlNodeList;
        Records1: XmlNodeList;
        Records2: XmlNodeList;
        att: XmlAttribute;


        Node: XmlNode;
        fieldnode1: XmlNode;
        fieldFor1: XmlElement;

        fieldnode2: XmlNode;
        fieldFor2: XmlElement;
        e: XmlElement;
        camt53GroupHeader: record camt53GroupHeader;
        camt53statement: Record camt53statement;
        camt53Account: Record camt53Account;
        camt53BAL: Record camt53BAL;
        camt53Ntry: Record camt53Ntry;

        camt53Ntry2: Record camt53Ntry;

        fieldnode: XmlNode;
        fieldFor: XmlElement;
        Ref: RecordRef;
        FieldRef: FieldRef;
        i: Integer;
    begin
        if UploadIntoStream('Upload XML', '', '', FileName, InS) then begin
            if XmlDocument.ReadFrom(InS, XmlDoc) then begin
                XmlDoc.GetRoot(Root);
                Records := Root.GetChildElements();
                camt53GroupHeader.Init();
                camt53GroupHeader.techId := CreateGuid();

                foreach Node in Records do begin
                    e := Node.AsXmlElement();
                    if e.LocalName = 'BkToCstmrStmt' then begin
                        Records := e.GetChildElements();
                        foreach Node in records do begin
                            e := Node.AsXmlElement();
                            if e.LocalName = 'GrpHdr' then begin
                                Records1 := e.GetChildElements();
                                foreach fieldnode1 in Records1 do begin
                                    fieldFor1 := fieldnode1.AsXmlElement();
                                    case fieldFor1.LocalName of
                                        'MsgId':
                                            camt53GroupHeader.MsgId := fieldFor1.InnerText;
                                        'CreDtTm':
                                            camt53GroupHeader.CreDtTm := fieldFor1.InnerText;
                                    end;
                                end;
                            end;
                            camt53statement.Init();
                            camt53statement.techId := camt53GroupHeader.techId;
                            camt53Account.Init();
                            camt53Account.techId := camt53GroupHeader.techId;
                            if e.LocalName = 'Stmt' then begin
                                Records1 := e.GetChildElements();
                                foreach fieldnode1 in records1 do begin
                                    fieldFor1 := fieldnode1.AsXmlElement();
                                    case fieldFor1.LocalName of
                                        'Id':
                                            camt53statement.Id := fieldFor1.InnerText;
                                        'ElctrncSeqNb':
                                            camt53statement.ElctrncSeqNb := fieldFor1.InnerText;
                                        'CreDtTm':
                                            EVALUATE(camt53statement.CreDtTm, fieldFor1.InnerText, 9);
                                        'Acct':
                                            begin
                                                Records2 := fieldFor1.GetChildElements();
                                                foreach fieldnode2 in records2 do begin
                                                    fieldFor2 := fieldnode2.AsXmlElement();
                                                    case fieldFor2.LocalName of
                                                        'Id':
                                                            begin
                                                                Records2 := fieldFor2.GetChildElements();
                                                                foreach fieldnode2 in records2 do begin
                                                                    fieldFor2 := fieldnode2.AsXmlElement();
                                                                    case fieldFor2.LocalName of
                                                                        'IBAN':
                                                                            camt53Account.IBAN := fieldFor2.InnerText;
                                                                    end;
                                                                end;
                                                            end;
                                                        'Ccy':
                                                            camt53Account.Ccy := fieldFor2.InnerText;

                                                    end;
                                                end;
                                            end;
                                        'Bal':
                                            begin
                                                camt53BAL.Init();
                                                camt53BAL.GrpHeadertechid := camt53GroupHeader.techId;
                                                Records1 := fieldFor1.GetChildElements();
                                                foreach fieldnode1 in records1 do begin
                                                    fieldFor1 := fieldnode1.AsXmlElement();
                                                    case fieldFor1.LocalName of
                                                        'Tp':
                                                            begin
                                                                Records2 := fieldFor1.GetChildElements();
                                                                foreach fieldnode2 in records2 do begin
                                                                    fieldFor2 := fieldnode2.AsXmlElement();
                                                                    case fieldFor2.LocalName of
                                                                        'Amt':
                                                                            begin
                                                                                Evaluate(camt53BAL.Amt, fieldFor2.InnerText, 9);
                                                                                fieldFor2.Attributes().Get(1, att);
                                                                                camt53BAL.Amt_Ccy := att.Value;
                                                                            end;

                                                                    end;
                                                                end;
                                                            end;
                                                    end;
                                                    camt53BAL.techId := 0;
                                                    camt53BAL.Insert();
                                                end;
                                            end;


                                        'Ntry':
                                            begin
                                                Records1 := fieldFor1.GetChildElements();
                                                camt53Ntry.Init();

                                                if camt53Ntry2.FindLast() then
                                                    camt53Ntry.techId := camt53Ntry2.techId + 1
                                                else
                                                    camt53Ntry.techId := 1;
                                                camt53Ntry.GrpHeadertechid := camt53GroupHeader.techId;


                                                foreach fieldnode1 in records1 do begin
                                                    fieldFor1 := fieldnode1.AsXmlElement();
                                                    case fieldFor1.LocalName of
                                                        'Amt':
                                                            begin
                                                                Evaluate(camt53Ntry.Amt, fieldFor1.InnerText, 9);
                                                                fieldFor1.Attributes().Get(1, att);
                                                                camt53Ntry.Ccy := att.Value;
                                                            end;
                                                        'AcctSvcrRef':
                                                            begin
                                                                camt53Ntry.AcctSvcrRef := fieldFor1.InnerText;
                                                            end;
                                                        'ValDt':
                                                            begin
                                                                Records2 := fieldFor1.GetChildElements();
                                                                foreach fieldnode2 in records2 do begin
                                                                    fieldFor2 := fieldnode2.AsXmlElement();
                                                                    case fieldFor2.LocalName of
                                                                        'Dt':
                                                                            begin
                                                                                Evaluate(camt53Ntry.ValDt, fieldFor2.InnerXml, 9);
                                                                            end;

                                                                    end;
                                                                end;

                                                            end;
                                                        'BookgDt':
                                                            begin
                                                                Records2 := fieldFor1.GetChildElements();
                                                                foreach fieldnode2 in records2 do begin
                                                                    fieldFor2 := fieldnode2.AsXmlElement();
                                                                    case fieldFor2.LocalName of
                                                                        'Dt':
                                                                            begin
                                                                                Evaluate(camt53Ntry.BookgDt, fieldFor2.InnerText, 9);
                                                                            end;

                                                                    end;
                                                                end;
                                                            end;
                                                        'NtryDtls':
                                                            begin
                                                                getNtryDtls(camt53Ntry, fieldFor1);
                                                            end;
                                                    end;
                                                end;

                                                camt53Ntry.Insert();
                                            end;

                                    end;
                                end;
                            end;









                        end;
                        camt53statement.Insert();
                        camt53Account.Insert();
                        camt53GroupHeader.Insert();
                    end;

                end;
            end;

        end;
        moveToTransactions(camt53GroupHeader.techId);

    end;


    local procedure getNtryDtls(var camt53Ntry: Record camt53Ntry; fieldFor1: XmlElement);
    var
        Records: XmlNodeList;
        node: XmlNode;
        element: XmlElement;

        Records1: XmlNodeList;
        node1: XmlNode;
        element1: XmlElement;

        Records2: XmlNodeList;
        node2: XmlNode;
        element2: XmlElement;

    begin

        Records := fieldFor1.GetChildElements();
        foreach node in records do begin
            element := node.AsXmlElement();
            case element.LocalName of
                'TxDtls':
                    begin
                        Records := element.GetChildElements();
                        foreach node in records do begin
                            element := node.AsXmlElement();
                            case element.LocalName of
                                'Refs':
                                    begin
                                        Records1 := element.GetChildElements();
                                        foreach node1 in Records1 do begin
                                            element1 := node1.AsXmlElement();
                                            case element1.LocalName of
                                                'EndToEndId':
                                                    camt53Ntry.EndToEndId := element1.InnerText;
                                            end;
                                        end;
                                    end;
                                'RltdPties':

                                    begin
                                        Records1 := element.GetChildElements();
                                        foreach node1 in Records1 do begin
                                            element1 := node1.AsXmlElement();
                                            case element1.LocalName of
                                                'Dbtr':
                                                    begin
                                                        Records1 := element.GetChildElements();
                                                        foreach node1 in Records1 do begin
                                                            element1 := node1.AsXmlElement();
                                                            case element1.LocalName of
                                                                'Nm':
                                                                    camt53Ntry.Dbtr_Nm := element1.InnerText;
                                                                'PstlAdr':
                                                                    begin

                                                                        Records1 := element.GetChildElements();
                                                                        foreach node1 in Records1 do begin
                                                                            element1 := node1.AsXmlElement();
                                                                            case element1.LocalName of
                                                                                'Ctry':
                                                                                    camt53Ntry.Cdtr_PstlAdr_Ctry := element1.InnerText;
                                                                                'AdrLine':
                                                                                    camt53Ntry.Cdtr_PstlAdr_AdrLine := element1.InnerText;

                                                                            end;
                                                                        end;

                                                                    end;
                                                            end;
                                                        end;
                                                    end;
                                                'DbtrAcct':
                                                    begin
                                                        Records1 := element.GetChildElements();
                                                        foreach node1 in Records1 do begin
                                                            element1 := node1.AsXmlElement();
                                                            case element1.LocalName of
                                                                'Id':
                                                                    begin
                                                                        Records1 := element1.GetChildElements();
                                                                        foreach node1 in Records1 do begin
                                                                            element1 := node1.AsXmlElement();
                                                                            case element1.LocalName of
                                                                                'IBAN':
                                                                                    camt53Ntry.DbtrAcct_Id_Iban := element1.InnerText;
                                                                            end;
                                                                        end;
                                                                    end;
                                                            end;
                                                        end;
                                                    end;
                                                'Cdtr':
                                                    begin
                                                        Records1 := element.GetChildElements();
                                                        foreach node1 in Records1 do begin
                                                            element1 := node1.AsXmlElement();
                                                            case element1.LocalName of
                                                                'Nm':
                                                                    camt53Ntry.Cdtr_Nm := element1.InnerText;
                                                                'PstlAdr':
                                                                    begin

                                                                        Records1 := element1.GetChildElements();
                                                                        foreach node1 in Records1 do begin
                                                                            element1 := node1.AsXmlElement();
                                                                            case element1.LocalName of
                                                                                'Ctry':
                                                                                    camt53Ntry.Cdtr_PstlAdr_Ctry := element1.InnerText;
                                                                                'AdrLine':
                                                                                    camt53Ntry.Cdtr_PstlAdr_AdrLine := element1.InnerText;

                                                                            end;
                                                                        end;

                                                                    end;
                                                            end;
                                                        end;
                                                    end;
                                                'CdtrAcct':
                                                    begin
                                                        Records1 := element.GetChildElements();
                                                        foreach node1 in Records1 do begin
                                                            element1 := node1.AsXmlElement();
                                                            case element1.LocalName of
                                                                'Id':
                                                                    begin
                                                                        Records1 := element1.GetChildElements();
                                                                        foreach node1 in Records1 do begin
                                                                            element1 := node1.AsXmlElement();
                                                                            case element1.LocalName of
                                                                                'IBAN':
                                                                                    camt53Ntry.CdtrAcct_Id_Iban := element1.InnerText;
                                                                            end;
                                                                        end;
                                                                    end;
                                                            end;
                                                        end;
                                                    end;
                                                'UltmCdtr':
                                                    begin
                                                        Records1 := element.GetChildElements();
                                                        foreach node1 in Records1 do begin
                                                            element1 := node1.AsXmlElement();
                                                            case element1.LocalName of
                                                                'Nm':
                                                                    camt53Ntry.Cdtr_Nm := element1.InnerText;
                                                                'PrvtId':
                                                                    begin

                                                                        Records1 := element1.GetChildElements();
                                                                        foreach node1 in Records1 do begin
                                                                            element1 := node1.AsXmlElement();
                                                                            case element1.LocalName of
                                                                                'Othr':
                                                                                    begin
                                                                                        Records1 := element1.GetChildElements();
                                                                                        foreach node1 in Records1 do begin
                                                                                            element1 := node1.AsXmlElement();
                                                                                            case element1.LocalName of
                                                                                                'Id':
                                                                                                    camt53Ntry.UltmCdtrAcc_IBAN := element1.InnerText;

                                                                                            end;

                                                                                        end;
                                                                                    end;

                                                                            end;
                                                                        end;
                                                                    end;
                                                            end;
                                                        end;
                                                    end;
                                            end;
                                        end;
                                    end;
                                'RmtInf':
                                    begin
                                        Records1 := element.GetChildElements();
                                        foreach node1 in Records1 do begin
                                            element1 := node1.AsXmlElement();
                                            case element1.LocalName of
                                                'Ustrd':
                                                    begin
                                                        camt53Ntry.Ustrd := element1.InnerText;
                                                    end;
                                            end;

                                        end;

                                    end;
                            end;

                        end;
                    end;
            end;
        end;
    end;

    local procedure moveToTransactions(grpHdr: Guid)
    var
        vIbanTrx: Record waas_T_Transactions;
        vIbanTrxDummy: Record waas_T_Transactions;
        camt53Trx: Record camt53Ntry;
        i: Integer;


    begin



        IF (camt53Trx.FindSet()) THEN BEGIN
            vIbanTrx.LOCKTABLE;
            IF (vIbanTrx.FINDLAST) THEN
                i := vIbanTrx.techID + 1
            ELSE
                i := 1;
            REPEAT
                vIbanTrx.TransferFields(camt53Trx);
                vIbanTrx.techID := i;
                vIbanTrx.INSERT;
                i += 1;

            UNTIL (camt53Trx.Next = 0)
        END;
        COMMIT;
        // The inserts are performed here.  





    end;

    local procedure GetText(e: XmlElement;
    Name:
        Text):
                Text
    var
        FieldNode: XmlNode;
    begin
        foreach FieldNode in e.GetChildElements(Name) do
            exit(FieldNode.AsXmlElement().InnerText);
    end;

    local procedure GetInteger(e: XmlElement; Name: Text): Integer
    var
        FieldNode: XmlNode;
        value: Integer;
    begin
        foreach FieldNode in e.GetChildElements(Name) do
            if evaluate(Value, FieldNode.AsXmlElement().InnerText, 9) then
                exit(value);
    end;

    local procedure GetDateTime(e: XmlElement; Name: Text): DateTime
    var
        FieldNode: XmlNode;
        value: DateTime;
    begin
        foreach FieldNode in e.GetChildElements(Name) do
            if evaluate(Value, FieldNode.AsXmlElement().InnerText, 9) then
                exit(value);
    end;




    procedure mailRunner(): Boolean
    var
        recAccount: Record virtual_bank_account;
        apiPartner: Record API_Partner;
        b: Boolean;
    begin


        recAccount.SetRange(sendWelcomeMail, false);
        recAccount.SetRange(optIN, true);
        if recAccount.FindSet() then begin
            repeat
                if apiPartner.get(recAccount.apipartnerId) then begin
                    if runWelcomeMail(recAccount, apiPartner) then begin
                        recAccount.sendWelcomeMail := true;
                        recAccount.Modify();
                    end

                end;
            until recAccount.Next() = 0;

        end;

        //blocked
        recAccount.Reset();
        recAccount.SetRange(sendBlockMail, false);
        recAccount.SetRange(blocked, true);
        recAccount.SetRange(optIN, true);
        if recAccount.FindSet() then begin
            repeat
                if apiPartner.get(recAccount.apipartnerId) then begin
                    if runBlockedVIBANMail(recAccount, apiPartner) then begin
                        recAccount.sendBlockMail := true;
                        recAccount.Modify();
                    end

                end;
            until recAccount.Next() = 0;

        end;
        //collection
        recAccount.Reset();
        recAccount.SetRange(sendCollectionMail, false);
        recAccount.SetRange(optIN, true);
        if recAccount.FindSet() then begin

            repeat
                if apiPartner.get(recAccount.apipartnerId) then begin
                    recAccount.CalcFields(Balance);
                    if recAccount.Balance <= 0 then begin
                        if runCollectionMail(recAccount, apiPartner) then begin
                            recAccount.sendCollectionMail := true;
                            recAccount.Modify();
                        end
                    end

                end;
            until recAccount.Next() = 0;

        end;
    end;



    procedure runWelcomeMail(viban: Record virtual_bank_account; apiPRec: Record API_Partner): Boolean
    var
        Mail: Codeunit "Email Message";
        Email: Codeunit Email;
        Recipients: List of [Text];
        Body: Text;
        MyNotification: Notification;

    begin
        if (viban.Email <> '') then begin
            if apiPRec.welcomeEmailTemplate.HasValue then begin
                Body := apiPRec.GetwelcomeEmailTemplate();
                Body := Body.Replace('%%%%VIBAN%%%%', 'DE551203000121334545');
                Recipients.add(viban.email);
                Mail.Create(Recipients, 'Welcome on board! Legitimation vor Aktivierung deiner Virtuellen IBAN', Body, true);
                EMail.Send(mail, Enum::"Email Scenario"::Default);

            end else begin
                Error('No email template available');
            end;
            exit(true);

        end;
        exit(false)
    end;


    procedure runCollectionMail(viban: Record virtual_bank_account; apiPRec: Record API_Partner): Boolean
    var
        Mail: Codeunit "Email Message";
        Email: Codeunit Email;
        Recipients: List of [Text];
        Body: Text;
        MyNotification: Notification;
        User: Record "User Task";
    begin
        if (viban.Email <> '') then begin
            if apiPRec.collectionEmailTemplate.HasValue then begin
                Body := apiPRec.GetcollectionEmailTemplate();
                Body := Body.Replace(' %%%%sum%%%%', '-26,30');
                Body := Body.Replace('%%%%SEPAQRCODE%%%%', 'https://qrcode.tec-it.com/API/QRCode?data=BCD%0a002%0a1%0aSCT%0aRLNWATWW%0a%c3%84rzte+ohne+Grenzen%0aAT973200000000518548%0aEUR77.77%0a%0a%0aSpende%0aSpende+f%c3%bcr+MSF+Nothilfe&backcolor=%23ffffff');
                Recipients.add(viban.email);
                Mail.Create(Recipients, 'Please fund your vIBAN', Body, true);
                EMail.Send(mail, Enum::"Email Scenario"::Default);
            end else begin
                Error('No email template available');

            end;


        end;
        exit(true)

    end;

    procedure runBlockedVIBANMail(viban: Record virtual_bank_account; apiPRec: Record API_Partner): Boolean
    var
        Mail: Codeunit "Email Message";
        Email: Codeunit Email;
        Recipients: List of [Text];
        Body: Text;
        MyNotification: Notification;
    begin

        if (viban.Email <> '') then begin
            if apiPRec.accountBlockEmailTemplate.HasValue then begin
                Body := apiPRec.GetaccountBlockEmailTemplate();
                Body := Body.Replace('%%%%IABN%%%%', viban.virtual_iban);
                Body := Body.Replace(' %%%%sum%%%%', '-26,30');
                Recipients.add(viban.Email);
                Mail.Create(Recipients, 'Testmail-vIBAN was Blocked', Body, true);
                EMail.Send(mail, Enum::"Email Scenario"::Default);
            end else begin
                Error('No email template available');

            end;
        end;
        exit(true)
    end;

    procedure sendUnlockMail(viban: Record virtual_bank_account; apiPRec: Record API_Partner)

    var
        Mail: Codeunit "Email Message";
        Email: Codeunit Email;
        Recipients: List of [Text];
        Body: Text;
        MyNotification: Notification;
    begin

        if (viban.Email <> '') then begin
            if apiPRec.accountdeBlockedEmailTemplate.HasValue then begin
                Body := apiPRec.GetaccountdeBlockedEmailTemplate();
                Body := Body.Replace('%%%%partnername%%%%', apiPRec.Name);
                Recipients.add(viban.email);
                Mail.Create(Recipients, 'Testmail-vIBAN was Unlucked', Body, true);
                EMail.Send(mail, Enum::"Email Scenario"::Default);
            end else begin
                Error('No email template available');

            end;
        end;
    end;

    procedure sendCancelMail(viban: Record virtual_bank_account; apiPRec: Record API_Partner)
    var
        Mail: Codeunit "Email Message";
        Email: Codeunit Email;
        Recipients: List of [Text];
        Body: Text;
        MyNotification: Notification;
    begin

        if (viban.Email <> '') then begin
            if apiPRec.collectionEmailTemplate.HasValue then begin
                Body := apiPRec.GetaccountDeletedEmailTemplate();
                Body := Body.Replace('%%%%partnername%%%%', apiPRec.Name);
                Recipients.add(viban.Email);
                Mail.Create(Recipients, 'Testmail-vIBAN-Contract was Canceld', Body, true);
                EMail.Send(mail, Enum::"Email Scenario"::Default);
            end else begin
                Error('No email template available');

            end;

        end;
    end;
}