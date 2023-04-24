table 50307 WaaS_T_Person
{



    fields
    {
        field(1; techId; BigInteger)
        {
            DataClassification = ToBeClassified;
        }


        field(111; personCommunityType; Text[7])
        { DataClassification = ToBeClassified; }
        field(2; index; Integer)
        { DataClassification = ToBeClassified; }
        field(3; firstName; Text[50])
        {
            CaptionML = ENU = 'Firstname', DEU = 'Vorname';
            DataClassification = ToBeClassified;
        }
        field(4; lastName; Text[50])
        {

            CaptionML = ENU = 'Lastname', DEU = 'Nachname';
            DataClassification = ToBeClassified;
        }
        field(5; sex; Enum enum_sex)

        {
            CaptionML = ENU = 'Sex', DEU = 'Geschlecht';

            DataClassification = ToBeClassified;
        }
        field(6; dateOfBirth; Date)
        {
            CaptionML = ENU = 'Date of Birth', DEU = 'Geburtstag';
            DataClassification = ToBeClassified;
        }
        field(7; placeOfBirth; Text[50])
        {
            CaptionML = ENU = 'Place of Birth', DEU = 'Geburtsort';
            DataClassification = ToBeClassified;
        }
        field(8; schufaAccordance; Boolean)
        {
            CaptionML = ENU = 'SCHUFA Consent',
                        DEU = 'SCHUFA Einwilligung';
            DataClassification = ToBeClassified;
        }
        field(9; nationality; Text[50])
        {

            CaptionML = ENU = 'nationality', DEU = 'nationalität';
            DataClassification = ToBeClassified;
        }
        field(10; maritalStatus; Enum enum_maritalStatus)
        {
            CaptionML = ENU = 'material Status',
                        DEU = 'Lebenssituation';
            DataClassification = ToBeClassified;
        }
        field(100; maidenName; Text[50])
        { DataClassification = ToBeClassified; }
        field(11; academicTitle; Enum enum_academicTitle)
        {
            CaptionML = ENU = 'Academic Title',
                    DEU = 'Akatdmische Titel';
            DataClassification = ToBeClassified;
        }
        field(12; proprietaryStatus; Enum enum_proprietaryStatus)
        {
            CaptionML = ENU = 'Proprietary Status',
                        DEU = 'Eigentumsstatus';
            DataClassification = ToBeClassified;
        }
        field(13; employmentStatus; Enum enum_employmentStatus)
        {
            CaptionML = ENU = 'Employmentstatus',
                        DEU = 'Beschäftigung Status';
            DataClassification = ToBeClassified;
        }
        //registeredAddress; 
        field(888; AdressID; Guid)
        {

            CaptionML = ENU = 'Adress ID', DEU = 'Adressen ID';
            TableRelation = WaaS_T_Adresses.techID;

        }
        field(14; reg_street; Text[150])
        {
            CaptionML = ENU = 'Street', DEU = 'Strasse';
            FieldClass = FlowField;
            CalcFormula = lookup(WaaS_T_Adresses.street where(techID = field(AdressID)));

        }
        field(15; reg_houseNumber; Text[100])
        {
            CaptionML = ENU = 'Housenumber', DEU = 'Hausnummer';
            FieldClass = FlowField;
            CalcFormula = lookup(WaaS_T_Adresses.houseNumber where(techID = field(AdressID)));
        }
        field(16; reg_zipCode; Text[100])
        {
            CaptionML = ENU = 'ZipCode', DEU = 'PLZ';
            FieldClass = FlowField;
            CalcFormula = lookup(WaaS_T_Adresses.zip where(techID = field(AdressID)));
        }
        field(17; reg_city; Text[100])
        {
            CaptionML = ENU = 'City', DEU = 'Ort';
            FieldClass = FlowField;
            CalcFormula = lookup(WaaS_T_Adresses.city where(techID = field(AdressID)));
        }
        field(18; reg_country; Text[50])
        {
            CaptionML = ENU = 'Country', DEU = 'Land';
            FieldClass = FlowField;
            CalcFormula = lookup(WaaS_T_Adresses.country where(techID = field(AdressID)));
        }
        //communicationAddress
        field(20; comm_street; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(21; comm_houseNumber; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(22; comm_zipCode; Text[50])
        { DataClassification = ToBeClassified; }
        field(23; comm_city; Text[50])
        { DataClassification = ToBeClassified; }
        field(24; comm_country; Text[50])
        { DataClassification = ToBeClassified; }
        //phonenumber    
        field(25; phoneinternationalAreaCode; Text[50])
        {
            CaptionML = ENU = 'Phone Country Code', DEU = 'Tele.Ländercode';
            DataClassification = ToBeClassified;
        }
        field(26; phoneareaCode; Text[50])
        { DataClassification = ToBeClassified; }
        field(27; telephoneNumber; Text[50])
        {
            CaptionML = ENU = 'Phonenumber', DEU = 'Telefonnummer';
            DataClassification = ToBeClassified;
        }

        field(28; emailAddress; Text[50])
        {
            CaptionML = ENU = 'Email', DEU = 'Email';
            DataClassification = ToBeClassified;
        }
        //employmentInformation
        field(29; industryCodeEmployer; Text[50])
        {
            CaptionML = ENU = 'Industry Code',
                        DEU = 'Branchen Code';
            DataClassification = ToBeClassified;
        }
        field(30; employmentLevel; Enum eunm_employmentLevel)
        {
            CaptionML = ENU = 'Employment Level',
                        DEU = 'Anstellungsverhältniss';
            DataClassification = ToBeClassified;
        }
        field(31; employedSince; Text[50])
        {
            CaptionML = ENU = 'Employed Since',
                        DEU = 'angestellt seit';
            DataClassification = ToBeClassified;
        }
        //selfEmploymentInformation
        field(32; industryCodeSelfEmployer; Text[50])
        {
            CaptionML = ENU = 'Industrial Code',
                                    DEU = 'Branchen Code';
            DataClassification = ToBeClassified;
        }
        field(33; legalForm; Enum enum_legalform)
        {
            CaptionML = ENU = 'Legal Form',
                                    DEU = 'Rechtsform';
            DataClassification = ToBeClassified;
        }
        field(34; self_employedSince; Text[50])
        { DataClassification = ToBeClassified; }
        //taxInformation
        field(35; isBornInTheUS; Boolean)

        {
            CaptionML = ENU = 'born in USA', DEU = 'geboren in USA';

            DataClassification = ToBeClassified;
        }
        field(36; isNonGermanTaxPayer; Boolean)
        {
            CaptionML = ENU = 'non german Taxpayer', DEU = 'keine deutsche Steueransässigkeit';
            DataClassification = ToBeClassified;
        }
        field(37; isGermanTaxPayer; Boolean)
        {
            CaptionML = ENU = 'german Taxpayer', DEU = 'deutsche Steueransässigkeit';
            DataClassification = ToBeClassified;
        }
        field(38; isSecondNationalityUS; Boolean)
        {
            CaptionML = ENU = 'second natinality in USA', DEU = 'zweite Staatsbürgerschaft in den USA';

            DataClassification = ToBeClassified;
        }
        field(39; tin; Text[50])
        {
            CaptionML = ENU = 'Tax ID Number',
                        DEU = 'TIN';
            DataClassification = ToBeClassified;
        }
        field(40; selfEmployedTaxID; Text[50])
        {
            CaptionML = ENU = 'Tax ID selfemployed', DEU = 'Selbständig SteuerID';

            DataClassification = ToBeClassified;
        }
        field(41; nonGermanTaxPayerCountry1; Text[50])
        {
            CaptionML = ENU = 'Taxcountry 1', DEU = 'Steuerausland 1';
            DataClassification = ToBeClassified;
        }
        field(42; nonGermanTaxId1; Text[50])
        {
            CaptionML = ENU = 'Taxcountry 1 ID', DEU = 'SteuerID 1 fürs Ausland';
            DataClassification = ToBeClassified;
        }
        field(43; nonGermanTaxPayerCountry2; Text[50])
        {
            CaptionML = ENU = 'Taxcountry 2', DEU = 'Steuerausland 2';

            DataClassification = ToBeClassified;
        }
        field(44; nonGermanTaxId2; Text[50])
        {
            CaptionML = ENU = 'Taxcountry 2 ID', DEU = 'SteuerID 2 fürs Ausland';

            DataClassification = ToBeClassified;
        }
        field(45; nonGermanTaxPayerCountry3; Text[50])
        {
            CaptionML = ENU = 'Taxcountry ID', DEU = 'Steuerausland 3';

            DataClassification = ToBeClassified;
        }
        field(46; nonGermanTaxId3; Text[50])
        {
            CaptionML = ENU = 'Taxcountry 3 ID', DEU = 'SteuerID 3 fürs Ausland';

            DataClassification = ToBeClassified;
        }

        field(47; isActingForOwnAccount; Boolean)
        {
            CaptionML = ENU = 'acting for Own account', DEU = 'Kontoführung auf eigen Rechnung';
            DataClassification = ToBeClassified;
        }
        //currentAccount
        field(49; accountProductId; Enum enum_accountProductId)
        { DataClassification = ToBeClassified; }
        field(50; accountCurrency; CODE[3])
        { DataClassification = ToBeClassified; }
        field(51; isSalaryAccount; Boolean)
        { DataClassification = ToBeClassified; }
        field(52; periodicIncomingPayments; Boolean)
        { DataClassification = ToBeClassified; }
        field(53; endDateYoungAccount; Text[50])
        { DataClassification = ToBeClassified; }
        //overdraftCredit
        field(54; requestedOverdraftCredit; Integer)
        { DataClassification = ToBeClassified; }
        //savingsAccount
        field(55; savingsAccountProduct; Enum enum_savingsAccountProduct)
        { DataClassification = ToBeClassified; }

        //creditCard

        field(60; creditCardpartnerIndex; Integer)
        { DataClassification = ToBeClassified; }

        field(61; creditcardproduct; Enum enum_card)
        { DataClassification = ToBeClassified; }

        field(62; creitcardlimit; Integer)
        { DataClassification = ToBeClassified; }


        //debitMasterCard
        field(70; DebitCardpartnerIndex; Integer)
        { DataClassification = ToBeClassified; }

        field(71; debitCardproduct; Enum enum_Card)
        //[DB_DEUTSCHE_BANK_CARD_PLUS, NB_MASTERCARD_DIREKT_WITHOUT_SOLVENCY, NB_MASTERCARD_DIREKT_WITH_SOLVENCY] 
        { DataClassification = ToBeClassified; }


        //"digitalServices

        field(81; partnerIndex; Integer)
        { DataClassification = ToBeClassified; }

        field(82; requestedPFM; Enum enum_PFM)
        { DataClassification = ToBeClassified; }


        //processControls
        field(90; legitimationRedirectUrl; Text[50])
        { DataClassification = ToBeClassified; }

        field(91; receiveStatusNotifications; Boolean)
        { DataClassification = ToBeClassified; }

        field(92; notificationUrl; Text[50])
        { DataClassification = ToBeClassified; }


        field(93; documentType; Enum identification_documents)
        {
            CaptionML = ENU = 'Type od Document', DEU = 'Legitimationsdokument Art';
            DataClassification = ToBeClassified;
        }
        field(94; documentNumber; Text[200])
        {
            CaptionML = ENU = 'Id Number', DEU = 'Ausweissnummer';
            DataClassification = ToBeClassified;
        }
        field(95; documentIssueDate; Date)
        {
            CaptionML = ENU = 'Document Issuedate', DEU = 'Austelltdatum';
            DataClassification = ToBeClassified;
        }
        field(96; documentIssuingAuthority; Text[200])
        {
            CaptionML = ENU = 'Document issuing authority', DEU = 'Austellenden Behörde';
            DataClassification = ToBeClassified;
        }
        field(97; documentExpirationDate; Date)
        {
            CaptionML = ENU = 'Document expirationdate', DEU = 'Ablaufdatum';
            DataClassification = ToBeClassified;
        }

        field(99; business_emailAddress; Text[50])
        {
            CaptionML = ENU = 'Business email', DEU = 'Geschäfts email';
            DataClassification = ToBeClassified;
        }
        field(104; netIncome; Integer)
        {
            CaptionML = ENU = 'Net Income', DEU = 'Nettoeinkommen';
            DataClassification = ToBeClassified;
        }
        field(105; rentalExpenses; Integer)
        {
            CaptionML = ENU = 'Rental Expenses', DEU = 'Mietausgaben';
            DataClassification = ToBeClassified;
        }
        field(107; loanExpenses; Integer)
        {
            CaptionML = ENU = 'Loan Expenses', DEU = 'Kreditausgaben';
            DataClassification = ToBeClassified;
        }
        field(108; additionalLoanExpenses; Integer)
        {

            CaptionML = ENU = 'Additional Loan Expenses', DEU = 'sonst. Ausgaben Verbindlichkeiten';
            DataClassification = ToBeClassified;
        }
        field(109; insuranceExpenses; Integer)
        {

            CaptionML = ENU = 'Insurance Expenses', DEU = 'Versicherungen';
            DataClassification = ToBeClassified;
        }
        field(110; dependentChildren; Integer)
        {
            CaptionML = ENU = 'Dependet Children',
                        DEU = 'Unterhaltspflichtige Kinder';
            DataClassification = ToBeClassified;
        }
        field(112; alimonyPayment; Integer)
        {
            CaptionML = ENU = 'Alimony Payments',
                        DEU = 'Unterhaltszahlungen';
            DataClassification = ToBeClassified;
        }
        field(115; Employment_relationship; enum Employment_relationship)
        {
            CaptionML = ENU = 'Employment relationship',
                        DEU = 'Arbeitsverhältnis';
            DataClassification = ToBeClassified;
        }

        field(113; "number of salaries per year"; Integer)
        {
            CaptionML = ENU = 'number of salaries per year',
                        DEU = 'Anzahl Gehälter';
            DataClassification = ToBeClassified;
        }

        field(114; EmployeeName; Text[100])
        {
            CaptionML = ENU = 'Employee Name',
                        DEU = 'Arbeitgeber Name';
            DataClassification = ToBeClassified;
        }


        field(119; PSDII; Boolean)
        { DataClassification = ToBeClassified; }
        field(120; Creditreform; Boolean)
        {
            DataClassification = ToBeClassified;
        }


        field(121; Retirementdate; Date)
        {
            CaptionML = ENU = 'Retirement Begindate',
                        DEU = 'Renteneintritt';
            DataClassification = ToBeClassified;
        }
        field(122; RetirementAmmount; Decimal)
        {
            CaptionML = ENU = 'Retirement Ammount',
                        DEU = 'Rente';
            DataClassification = ToBeClassified;
        }

        field(123; RetirementAmmountPrivat; Decimal)
        {
            CaptionML = ENU = 'Retirement Ammount Privat',
                        DEU = 'Renten Privat';
            DataClassification = ToBeClassified;
        }

        field(124; RetirementOtherIncome; Decimal)
        {
            CaptionML = ENU = 'Retirement Other Income',
                        DEU = 'sonst. Rentenbezüge ';
            DataClassification = ToBeClassified;
        }

        field(125; Probationaryperiod; Boolean)
        {
            CaptionML = ENU = 'Probationaryperiod',
                        DEU = 'Probezeit';
            DataClassification = ToBeClassified;
        }



        field(126; "Ancillary income"; Decimal)
        {

            CaptionML = ENU = 'Ancillary income',
                        DEU = 'Nebeneinkünfte';
            DataClassification = ToBeClassified;
        }

        field(127; "Spouses alimony"; Decimal)
        {

            CaptionML = ENU = 'Spouses alimony',
                        DEU = 'Ehegattenunterhalt';
            DataClassification = ToBeClassified;
        }

        field(128; variableIncome; Decimal)
        {

            CaptionML = ENU = 'Variable Income',
                        DEU = 'Variable Einkünfte';
            DataClassification = ToBeClassified;
        }

        field(129; LoanLiability; Decimal)
        {
            CaptionML = ENU = 'Loanliability',
                        DEU = 'Kreditverbindlichkeiten';
            DataClassification = ToBeClassified;
        }
        field(130; mothLoanLiability; Decimal)
        {
            CaptionML = ENU = 'Loanliability',
                        DEU = 'Kreditverbindlichkeiten';
            DataClassification = ToBeClassified;
        }




        field(131; Savings; Decimal)
        {
            CaptionML = ENU = 'Savings',
                        DEU = 'Sparguthaben';
            DataClassification = ToBeClassified;
        }
        field(132; mothlySavings; Decimal)
        {

            CaptionML = ENU = 'mth. saving',
                        DEU = 'mlt.Sparrate';
            DataClassification = ToBeClassified;
        }

        field(134; Depot; Decimal)
        {
            CaptionML = ENU = 'Depot',
                        DEU = 'Depotguthaben';
            DataClassification = ToBeClassified;
        }
        field(135; mothlsEx; Decimal)
        {
            CaptionML = ENU = 'mth.Invest',
                        DEU = 'mtl. Invest';
            DataClassification = ToBeClassified;
        }
        field(136; baus; Decimal)
        {
            CaptionML = ENU = 'Home loan savings',
                        DEU = 'Bausparen';
            DataClassification = ToBeClassified;
        }
        field(137; mothlbau; Decimal)
        {
            CaptionML = ENU = 'mth. Homeloan savings',
                        DEU = 'mtl. Bausparrate';
            DataClassification = ToBeClassified;
        }
        field(138; leben; Decimal)
        {
            CaptionML = ENU = 'Life insurance saving',
                        DEU = 'Lebensversicherungguthaben';
            DataClassification = ToBeClassified;
        }
        field(139; motnhlyLeen; Decimal)
        {
            CaptionML = ENU = 'mth. Lifeinsur. rate',
                        DEU = 'Sparrate Lebensvers.';
            DataClassification = ToBeClassified;
        }
        field(140; otherSave; Decimal)
        {
            CaptionML = ENU = 'other Savings',
                        DEU = 'andere Guthaben';
            DataClassification = ToBeClassified;
        }
        field(141; mothlSave; Decimal)
        {
            CaptionML = ENU = 'Loanliability',
                        DEU = 'Kreditverbindlichkeiten';
            DataClassification = ToBeClassified;
        }

        field(150; PassPortImage; Blob)
        {
            Subtype = Bitmap;

            CaptionML = ENU = 'Passport or Id Card', DEU = 'Reisepass  oder Personalausweis';
        }
        field(151; SignImage; Blob)
        {
            Subtype = Bitmap;

            CaptionML = ENU = 'Signature sample', DEU = 'Unterschriftenprobe';
        }
        field(152; api_partner; CODE[50])
        {
            // TableRelation = API_Partner.Id;
            DataClassification = ToBeClassified;

        }







    }
    keys
    {
        key(PK; techId)
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        TestField(rec.api_partner);
    end;
}






















