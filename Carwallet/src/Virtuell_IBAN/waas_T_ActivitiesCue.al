table 50309 waas_T_ActivitiesCue
{
    Caption = 'Activities Cue';
    ReplicateData = false;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Due Date Filter"; Date)
        {
            Caption = 'Due Date Filter';
            Editable = false;
            FieldClass = FlowFilter;
        }
        field(3; "Overdue Date Filter"; Date)
        {
            Caption = 'Overdue Date Filter';
            FieldClass = FlowFilter;
        }
        field(7; "Top 10 Customer Sales YTD"; Decimal)
        {
            AutoFormatExpression = '<Precision,1:1><Standard Format,9>%';
            AutoFormatType = 11;
            Caption = 'Top 10 Customer Sales YTD';
        }
        field(12; "Requests to Approve"; Integer)
        {
            CalcFormula = Count("Approval Entry" WHERE("Approver ID" = FIELD("User ID Filter"),
                                                        Status = FILTER(Open)));
            ObsoleteState = Pending;
            ObsoleteReason = 'Replaced with Approvals Activities part';
            Caption = 'Requests to Approve';
            FieldClass = FlowField;
            ObsoleteTag = '17.0';
        }
        field(15; "User ID Filter"; Code[50])
        {
            Caption = 'User ID Filter';
            ObsoleteState = Pending;
            ObsoleteReason = 'Replaced with Approvals Activities part';
            FieldClass = FlowFilter;
            ObsoleteTag = '17.0';
        }
        field(17; "Due Next Week Filter"; Date)
        {
            Caption = 'Due Next Week Filter';
            FieldClass = FlowFilter;
        }
        field(20; "My Incoming Documents"; Integer)
        {
            CalcFormula = Count("Incoming Document" WHERE(Processed = CONST(false)));
            Caption = 'My Incoming Documents';
            FieldClass = FlowField;
        }
        field(21; "Non-Applied Payments"; Integer)
        {
            CalcFormula = Count("Bank Acc. Reconciliation" WHERE("Statement Type" = CONST("Payment Application")));
            Caption = 'Non-Applied Payments';
            FieldClass = FlowField;
        }



        field(25; "Inc. Doc. Awaiting Verfication"; Integer)
        {
            CalcFormula = Count("Incoming Document" WHERE("OCR Status" = CONST("Awaiting Verification")));
            Caption = 'Inc. Doc. Awaiting Verfication';
            FieldClass = FlowField;
        }
        field(26; "Purchase Orders"; Integer)
        {
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER(Order)));
            Caption = 'Purchase Orders';
            FieldClass = FlowField;
        }
        field(27; "Uninvoiced Bookings"; Integer)
        {
            Caption = 'Uninvoiced Bookings';
            Editable = false;
        }
        field(28; "IC Inbox Transactions"; Integer)
        {
            CalcFormula = Count("IC Inbox Transaction");
            Caption = 'IC Inbox Transactions';
            FieldClass = FlowField;
        }
        field(29; "IC Outbox Transactions"; Integer)
        {
            CalcFormula = Count("IC Outbox Transaction");
            Caption = 'IC Outbox Transactions';
            FieldClass = FlowField;
        }

        field(32; "Coupled Data Synch Errors"; Integer)
        {
            CalcFormula = Count("CRM Integration Record" WHERE(Skipped = CONST(true)));
            Caption = 'Coupled Data Synch Errors';
            FieldClass = FlowField;
        }
        field(33; "CDS Integration Errors"; Integer)
        {
            CalcFormula = Count("Integration Synch. Job Errors");
            Caption = 'Dataverse Integration Errors';
            FieldClass = FlowField;
        }
        field(110; "Last Date/Time Modified"; DateTime)
        {
            Caption = 'Last Date/Time Modified';
        }
        field(34; "Loan Own BS This Month"; Decimal)
        {
            CaptionML = ENU = 'Taken into own books This Month', DEU = 'In eingen Buch übernommen';
            AutoFormatExpression = GetAmountFormat;
            AutoFormatType = 11;
            DecimalPlaces = 0 : 0;
        }

        field(35; APIPartner; Integer)
        {
            CaptionML = ENU = 'Sum of API Partner', DEU = 'Anzhal der API Partner';
            FieldClass = FlowField;
            CalcFormula = count(API_Partner);
            AutoFormatExpression = GetAmountFormat;
            AutoFormatType = 11;
        }
        field(36; APIPartner_B2B; Integer)
        {
            CaptionML = ENU = 'API Partner Provider', DEU = 'API Partner Provider';
            AutoFormatExpression = GetAmountFormat;
            FieldClass = FlowField;
            CalcFormula = count(virtual_bank_account where(partnerProvider = filter(true)));

            AutoFormatType = 11;
        }
        field(39; vibans; Integer)
        {
            CaptionML = ENU = 'vIBANs', DEU = 'vIBANs';
            AutoFormatExpression = GetAmountFormat;
            FieldClass = FlowField;
            CalcFormula = count(virtual_bank_account);

            AutoFormatType = 11;
        }
        field(37; netrev_sepa_sdd; Decimal)
        {
            CaptionML = ENU = 'Revenue Direct Debit', DEU = 'BaaS - Deckungsbeitrag Direct Debit';
            AutoFormatExpression = GetAmountFormat;
            AutoFormatType = 11;

        }
        field(38; netrev_waas_trx; Decimal)
        {
            CaptionML = ENU = 'Revenue vIBAN', DEU = 'BaaS - Deckungsbeitrag vIBAN';
            AutoFormatExpression = GetAmountFormat;
            AutoFormatType = 11;

        }
        field(40; netrev_sepa_sct; Decimal)
        {
            CaptionML = ENU = 'Revenue Credit Transfere', DEU = 'BaaS - Deckungsbeitrag SCT';
            AutoFormatExpression = GetAmountFormat;
            AutoFormatType = 11;

        }
        field(41; netrev_waas_rtp; Decimal)
        {
            CaptionML = ENU = 'Revenue RTP', DEU = 'BaaS - Deckungsbeitrag RTP';
            AutoFormatExpression = GetAmountFormat;
            AutoFormatType = 11;

        }


        field(50; MMR; Decimal)
        {


        }
        field(51; ARR; Decimal)
        { }
        field(52; ARPA; Decimal)
        { }
        field(53; "Gross Profit"; Decimal)
        { }
        field(54; TCV; Decimal)
        { }
        field(55; ACV; Decimal)
        { }
        field(56; LTV; Decimal)
        { }
        field(57; "Deferred Revenue"; Decimal)
        { }
        field(58; Billings; Decimal)
        { }
        field(59; CAC; Decimal)
        { }
        field(60; "Concentration Risk"; Decimal)
        { }
        field(61; DAU; Decimal)
        { }
        field(62; MAU; Decimal)
        { }
        field(63; "Number of logins"; Decimal)
        { }
        field(64; "Activation Rate"; Decimal)
        { }
        field(65; "MoM Growth Rate"; Decimal)
        { }
        field(66; CMGR; Decimal)
        { }
        field(67; "Monthly Churn Rate"; Decimal)
        { }
        field(68; Retention; Decimal)
        { }
        field(69; "Gross Churn Rate"; Decimal)
        { }
        field(70; "Net Churn"; Decimal)
        { }
        field(71; "Burn Rate"; Decimal)
        { }
        field(72; TAM; Decimal)
        { }
        field(73; "MRR Projection"; Decimal)
        { }


    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    procedure GetAmountFormat(): Text
    var
        GeneralLedgerSetup: Record "General Ledger Setup";
        UserPersonalization: Record "User Personalization";
        CurrencySymbol: Text[10];
    begin
        GeneralLedgerSetup.Get();
        CurrencySymbol := GeneralLedgerSetup.GetCurrencySymbol;

        if UserPersonalization.Get(UserSecurityId) and (CurrencySymbol <> '') then
            case UserPersonalization."Locale ID" of
                1030, // da-DK
              1053, // sv-Se
              1044: // no-no
                    exit('<Precision,0:0><Standard Format,0>' + CurrencySymbol);
                2057, // en-gb
              1033, // en-us
              4108, // fr-ch
              1031, // de-de
              2055, // de-ch
              1040, // it-it
              2064, // it-ch
              1043, // nl-nl
              2067, // nl-be
              2060, // fr-be
              3079, // de-at
              1035, // fi
              1034: // es-es
                    exit(CurrencySymbol + '<Precision,0:0><Standard Format,0>');
            end;

        exit(GetDefaultAmountFormat);
    end;

    local procedure GetDefaultAmountFormat(): Text
    begin
        exit('<Precision,0:0><Standard Format,0>');
    end;
}
