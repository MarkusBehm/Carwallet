table 50304 DB365_T_ActivitiesCue
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

        field(5; "Ongoing Quotes"; Integer)
        {
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER(Invoice)));
            CaptionML = ENU = ' Ongoing Quotes', DEU = 'Laufende Angebote';
            FieldClass = FlowField;
        }
        field(6; "Loan Sales This Month"; Decimal)
        {
            AutoFormatExpression = GetAmountFormat;
            AutoFormatType = 11;
            CaptionML = ENU = 'Loan Sales This Month', DEU = 'Kreditverkäufe in diesem Monat';
            DecimalPlaces = 0 : 0;

        }

        field(7; "Top 10 Customer Sales YTD"; Decimal)
        {
            AutoFormatExpression = '<Precision,1:1><Standard Format,9>%';
            AutoFormatType = 11;
            Caption = 'Top 10 Customer Sales YTD';
        }
        field(8; "Overdue Marketplace Amount"; Decimal)
        {
            AutoFormatExpression = GetAmountFormat;
            AutoFormatType = 11;
            CaptionML = ENU = 'Overdue Marketplace Amount', DEU = 'Überfällige Marktplatz Beträge';
            DecimalPlaces = 0 : 0;
        }
        field(9; "Overdue Loans Amount"; Decimal)
        {
            AutoFormatExpression = GetAmountFormat;
            AutoFormatType = 11;
            CaptionML = ENU = 'Overdue DB-Loans Amount', DEU = 'Überfällige OnBilanz Beträge';
            DecimalPlaces = 0 : 0;
        }
        field(10; "Average Collection Days"; Decimal)
        {
            CaptionML = ENU = 'Average Collection Days', DEU = 'Durchsch. Zahlungsausgelichstage';
            DecimalPlaces = 1 : 1;
        }
        field(11; "Ongoing Loan Quotes"; Integer)
        {
            CalcFormula = Count("Sales Header" WHERE("Document Type" = FILTER(Quote)));
            CaptionML = ENU = 'Ongoing Loan Quotes', DEU = 'Laufende Angebote';
            FieldClass = FlowField;
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
        field(13; "Sales Inv. - Pending Doc.Exch."; Integer)
        {
            CalcFormula = Count("Sales Invoice Header" WHERE("Document Exchange Status" = FILTER("Sent to Document Exchange Service" | "Delivery Failed")));
            Caption = 'Sales Invoices - Pending Document Exchange';
            Editable = false;
            FieldClass = FlowField;
        }
        field(14; "Sales CrM. - Pending Doc.Exch."; Integer)
        {
            CalcFormula = Count("Sales Cr.Memo Header" WHERE("Document Exchange Status" = FILTER("Sent to Document Exchange Service" | "Delivery Failed")));
            Caption = 'Sales Credit Memos - Pending Document Exchange';
            Editable = false;
            FieldClass = FlowField;
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

        field(23; "Sales Invoices Due Next Week"; Integer)
        {
            CalcFormula = Count("Cust. Ledger Entry" WHERE("Document Type" = FILTER(Invoice | "Credit Memo"),
                                                            "Due Date" = FIELD("Due Next Week Filter"),
                                                            Open = CONST(true)));
            Caption = 'Sales Invoices Due Next Week';
            Editable = false;
            FieldClass = FlowField;
        }
        field(24; "Ongoing Loan Orders"; Integer)
        {
            CalcFormula = Count("Sales Header" WHERE("Document Type" = FILTER(Order)));
            Caption = 'Ongoing Loan Orders';
            FieldClass = FlowField;
        }
        field(99; "Ongoing Loan Inquiries"; Integer)
        {
            CalcFormula = Count("Sales Header" WHERE("Document Type" = FILTER(Order)));
            Caption = 'Ongoing Loan Inquiries';
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
        field(31; "Outstanding Installments"; Integer)
        {
            CalcFormula = Count("Vendor Ledger Entry" WHERE("Document Type" = FILTER(Invoice),
                                                             Open = CONST(true)));
            CaptionML = ENU = 'Outstanding Installments', DEU = 'Öffene Rückzahlungen';
            Editable = false;
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
