table 50308 virtual_bank_account
{
    DataClassification = ToBeClassified;
    DrillDownPageId = waas_P_List;
    LookupPageId = waas_P_List;


    fields
    {
        field(1; techID; Guid)
        {
            DataClassification = ToBeClassified;

        }
        field(2; apipartnerId; Code[100])
        {
            CaptionML = ENU = 'Partner ID',
                        DEU = 'Partner ID';
            TableRelation = API_Partner.id;
        }
        field(3; syntix_db_clientId; Code[3]) { }
        field(4; virtual_iban; Code[32])
        {
            CaptionML = ENU = 'Wallet IBAN',
                        DEU = 'Wallet IBAN';
            DataClassification = ToBeClassified;
        }
        field(5; bank_name; Text[100]) { DataClassification = ToBeClassified; } // "TEST BANK",
        field(7; customer_id; BigInteger)
        {
            CaptionML = ENU = 'Customer Id',
                        DEU = 'Kunden Id';
            DataClassification = ToBeClassified;

        } //__test__KyVnHhSBWSvsr5M",
        field(8; deleted; Boolean)
        {
            CaptionML = ENU = 'deleted',
                        DEU = 'gelöscht';
            DataClassification = ToBeClassified;
        } // false,
        field(9; email; Text[100]) { DataClassification = ToBeClassified; } //: "Duncan@ac.com",
        field(10; gateway; Text[20])
        {

            FieldClass = FlowField;
            CalcFormula = lookup(API_Partner.viban_gateway where(id = field(apipartnerId)));
        } //: "stripe",
        field(11; gateway_account_id; Code[32])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(API_Partner.viban_gateway_account_id where(id = field(apipartnerId)));

        } //": "gw___test__KyVnGlSBWSv3GHt",
        field(13; object; Text[60]) { DataClassification = ToBeClassified; } //": "virtual_bank_account",
        field(14; reference_id; Code[10])
        {
            DataClassification = ToBeClassified;
        } //": "cus_I57FLcFhampr4H/src_1HUx16Jv9j0DyntJh6X59egJ",
        field(16; routing_number; Code[22])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(API_Partner.viban_routing_number where(id = field(apipartnerId)));

        } //": "110000000",
        field(17; scheme; Code[10]) { DataClassification = ToBeClassified; } //": "ach_credit",
        field(18; swift_code; Code[10]) { DataClassification = ToBeClassified; } //": "TSTEZ122",
        field(19; customerAccountNumer; Code[10]) { DataClassification = ToBeClassified; } //": "TSTEZ122",
        field(20; CountryCode; Code[2]) { DataClassification = ToBeClassified; } //": "TSTEZ122",
        field(21; "Api Partner"; Text[200])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(API_Partner.Id where(id = field(apipartnerId)));
        }

        field(22; Balance; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum(waas_T_Transactions.Amt where(vIBAN = field(virtual_iban)));
        }
        field(23; Fullname; Text[100])
        {

            DataClassification = ToBeClassified;
        }
        field(30; exIBAN; Code[32])
        {
            CaptionML = ENU = 'IBAN',
                        DEU = 'IBAN';
            FieldClass = FlowField;
            CalcFormula = lookup(waas_T_ConnectAccount.IBAN where(waas_id = field(techID)));

        }
        field(31; exBIC; Code[11])
        {
            CaptionML = ENU = 'BIC',
                        DEU = 'BIC';
            FieldClass = FlowField;
            CalcFormula = lookup(waas_T_ConnectAccount.BIc where(waas_id = field(techID)));

        }
        field(32; exAccountholderName; Text[200])
        {
            CaptionML = ENU = 'Accountholder Name',
                        DEU = 'Kontoinhaber';
            FieldClass = FlowField;
            CalcFormula = lookup(waas_T_ConnectAccount.AccountholderName where(waas_id = field(techID)));

        }
        field(33; exBankname; Text[50])
        {
            CaptionML = ENU = 'Bankname',
                        DEU = 'Name der Bank';
            FieldClass = FlowField;
            CalcFormula = lookup(waas_T_ConnectAccount.Bankname where(waas_id = field(techID)));

        }
        field(34; exaktiv; Boolean)
        {
            CaptionML = ENU = 'aktiv',
                        DEU = 'activ';
            FieldClass = FlowField;
            CalcFormula = lookup(waas_T_ConnectAccount.aktiv where(waas_id = field(techID)));

        }
        field(35; exdirect_debit_agreement; Boolean)
        {
            CaptionML = ENU = 'directdebit agreement',
                        DEU = 'Lastschriftvereinbarung';
            FieldClass = FlowField;
            CalcFormula = lookup(waas_T_ConnectAccount.direct_debit_agreement where(waas_id = field(techID)));

        }

        field(36; blocked; Boolean)
        {
            CaptionML = ENU = 'blocked',
                        DEU = 'sperre';
            DataClassification = ToBeClassified;
        }
        field(37; blockedDateTime; DateTime)
        {
            CaptionML = ENU = 'Time of the lock',
                        DEU = 'Zeitpunkt der Sperre';
            DataClassification = ToBeClassified;
        }
        field(38; deleteDateTime; DateTime)
        {
            CaptionML = ENU = 'Deletion time ',
                        DEU = 'Löschzeitpunkt';
            DataClassification = ToBeClassified;
        }
        field(39; blockReason; Text[100])
        {
            CaptionML = ENU = 'blocking reason',
                        DEU = 'Sperrgrund';
            DataClassification = ToBeClassified;

        }
        field(40; companyId; BigInteger)
        {
            CaptionML = ENU = 'Company Id',
                        DEU = 'Unternehmen Id';
        }
        field(41; CompanyName; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(WaaS_T_Company.communityName where(techId = field(companyId)));
        }
        field(42; preferd_compensation; Enum preferd_compensation)
        {

        }

        field(49; optin; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(44; sendWelcomeMail; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(45; sendCollectionMail; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(46; sendBlockMail; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(47; sendUnlockMail; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(48; sendCancelMail; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50; partnerProvider; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        field(51; vItem; Integer)
        {
            Caption = 'TypeNo.';

            TableRelation = WaaS_T_vItem.id;

        }
        field(52; vItemName; Text[100])
        {
            Caption = 'Typename';
            FieldClass = FlowField;
            CalcFormula = lookup(WaaS_T_vItem.externalName where(id = field(vItem)));
        }
        field(53; VIN; Text[30])
        {
            CaptionML = ENU = 'Vehicle-IdentNo.(VIN)', DEU = 'Fahrzeug-Identifikationsnr.(FIN)';
        }

        field(54; Image; Blob)
        {

            Subtype = Bitmap;


        }
        //http://maps.google.com/maps?z=12&t=m&q=loc:38.9419+-78.3020
        field(55;long;code[30]){
            CaptionML = ENU = 'longitude ', DEU = 'Längengrad';

        }
        field(56;lat;code[30]){
            CaptionML = ENU = 'latitude ', DEU = 'Breitengrad';

        }
         field(57; "license plate"; Text[30])
        {
            CaptionML = ENU = 'License plate', DEU = 'Kennzeichen';
        }
        field(58; "HSN"; Text[30])
        {
            CaptionML = ENU = 'Manufacturer', DEU = 'Hersteller';
        }

        field(59; "TSN"; Text[30])
        {
            CaptionML = ENU = 'TSN', DEU = 'TSN';
        }







    }

    keys
    {
        key(PK; techID)
        {
            Clustered = true;
        }

        key(SK; SystemCreatedAt)
        {

        }


    }

    var
        myInt: Integer;

    trigger OnInsert()
    var
        testRec: Record virtual_bank_account;
        customer: Record WaaS_T_Person;
        business: Record WaaS_T_Company;
        cuMgt: Codeunit waas_C_Mgt;
        apiPartner_L: Record API_Partner;
        vC_l: Code[10];
        dummy: Boolean;
    begin
        techID := CreateGuid();
        /*
        if UpperCase((CountryCode)) IN ['DE', 'UK', 'FR', 'IT', 'NL', 'PT'] then
            dummy := dummy
        else
            Error('Create vIBAN only allowed in isco Code and in coutries DE,UK,FR,IT,NL,PT');
        if (customer_id) = 0 then
            Message('Please define a customer Id');
        if apipartnerId = '' then
            Message('Please define a Provider Id');


        if rec.virtual_iban = '' then begin
            apiPartner_L.get(apipartnerId);
            apiPartner_L.TestField(viban_routing_number);
            rec.virtual_iban := cuMgt.create_viban(rec.CountryCode, apiPartner_L.viban_routing_number, vC_l);
            rec.customerAccountNumer := vC_l;
        end else
            Error('Wallet predefintion is not allowed. Wallet Creation is made by the system');
        customer.SetFilter(techid, '%1', customer_id);
        customer.SetRange(api_partner, apipartnerId);
        if customer.FindFirst() then begin
            rec.email := customer.emailAddress;
            rec.Fullname := customer.firstName + ' ' + customer.lastName;
        end else
            Error('Customer_id is n/a');
        business.SetFilter(techid, '%1', companyId);
        business.SetRange(api_partner, apipartnerId);
        if business.FindFirst() then begin
            rec.email := business.mailAdress;
            rec.Fullname := business.communityName;

        end;
        //testRec.setrange(virtual_iban, rec.virtual_iban);
        //if testRec.FindFirst() then Error('viban already exsists');
        */
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


