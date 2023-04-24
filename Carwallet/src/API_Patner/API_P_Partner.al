page 50329 API_P_Partner
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Tasks;
    SourceTable = API_Partner;

    layout
    {
        area(Content)

        {
            group(General)
            {
                field(Id; rec.Id)
                {
                    ApplicationArea = All;

                }
                field(Name; rec.Name)
                {
                    ApplicationArea = All;

                }
                field(synthix_partnerid; rec.synthix_partnerid)
                {
                    ApplicationArea = All;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = All;
                }
                field(vIBAN_gateway; rec.vIBAN_gateway)
                {
                    ApplicationArea = All;
                }
                field(vIBAN_gateway_account_id; rec.vIBAN_gateway_account_id)
                {
                    ApplicationArea = all;
                }
                field(vIBAN_routing_number; rec.vIBAN_routing_number)
                {
                    ApplicationArea = All;
                }
            }
            group(Pricing)
            {
                field(ppu_sct_sct; rec.ppu_sct_sct)
                {
                    Caption = ' SEPA SCT Pay-per-use ';
                    ApplicationArea = all;
                }
                field(ppu_sepa_sdd; rec.ppu_sepa_sdd)
                {
                    Caption = 'SEPA SDD Pay-per-use';

                    ApplicationArea = all;
                }
                field(ppu_viban_rtp; rec.ppu_viban_rtp)
                {
                    Caption = 'SEPA RTP Pay-per-use';

                    ApplicationArea = all;
                }
                field(ppu_viban_trx; rec.ppu_viban_trx)
                {
                    Caption = 'P2P Pay-per-use';

                    ApplicationArea = all;
                }
            }
            group(Statistic)
            {

                field(sum_sepa_sct; rec.sum_sepa_sct)
                {
                    Caption = 'Sum of SCT initiation';
                    ApplicationArea = all;
                }

                field(sum_sepa_sdd; rec.sum_sepa_sdd)
                {
                    Caption = 'Sum of SDD initiation';
                    ApplicationArea = all;
                }

                field(sum_viban_trx; rec.sum_viban_trx)
                {
                    Caption = 'Sum of P2P Transactions';
                    ApplicationArea = all;
                }
                field(sum_sepa_rtp; rec.sum_sepa_rtp)
                {
                    Caption = 'Sum of RTP initiation';
                    ApplicationArea = all;
                }
            }
            group("Email-communication english")
            {
                field(testEmail; rec.testEmail)
                {
                    CaptionML = ENU = 'Test Email Address',
                                DEU = 'Testmail adresse';
                    ApplicationArea = All;

                }
                field(welcomeTemplate; welcomeTemplate)
                {

                    ApplicationArea = All;
                    trigger OnAssistEdit()
                    begin
                        Upload(rec, 'welcomeEmailTemplate');
                    end;
                }
                field(collectionsTemplate; collectionsTemplate)
                {
                    ApplicationArea = All;
                    trigger OnAssistEdit()
                    begin
                        Upload(rec, 'collectionsTemplate');
                    end;
                }
                field(blockTemplate; blockTemplate)
                {

                    ApplicationArea = ALL;
                    trigger OnAssistEdit()
                    begin
                        Upload(rec, 'accountBlockEmailTemplate');
                    end;
                }
                field(unlockTemplate; unlockTemplate)
                {

                    ApplicationArea = All;
                    trigger OnAssistEdit()
                    begin
                        Upload(rec, 'accountdeBlockedEmailTemplate');
                    end;
                }
                field(cancelTemplate; cancelTemplate)
                {

                    ApplicationArea = All;
                    trigger OnAssistEdit()
                    begin
                        Upload(rec, 'accountDeletedEmailTemplate');
                    end;
                }

            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            group(Testmails)
            {

                action(SendMail)
                {
                    Caption = 'Send Test Welcome-Mail';
                    ApplicationArea = all;
                    trigger OnAction()
                    var
                        cuMgt: Codeunit waas_C_Mgt;
                        recAccount: Record virtual_bank_account;
                    begin
                        recAccount.email := rec.testEmail;
                        cuMgt.runWelcomeMail(recAccount, rec);
                    end;
                }
                action("Send Test Collection Mail")
                {
                    Caption = 'Send Test Collection Mail';
                    ApplicationArea = all;
                    trigger OnAction()
                    var
                        cuMgt: Codeunit waas_C_Mgt;
                        recAccount: Record virtual_bank_account;
                    begin
                        recAccount.email := rec.testEmail;
                        cuMgt.runCollectionMail(recAccount, rec);
                    end;
                }
                action(accountBlock)
                {
                    Caption = 'Send Test Accountblock Mail';
                    ApplicationArea = all;
                    trigger OnAction()
                    var
                        cuMgt: Codeunit waas_C_Mgt;
                        recAccount: Record virtual_bank_account;
                    begin
                        recAccount.email := rec.testEmail;
                        cuMgt.runBlockedVIBANMail(recAccount, rec);
                    end;
                }
                action(accountunBlock)
                {
                    Caption = 'Send Test Unlocked Account Mail';
                    ApplicationArea = all;
                    trigger OnAction()
                    var
                        cuMgt: Codeunit waas_C_Mgt;
                        recAccount: Record virtual_bank_account;
                    begin
                        recAccount.email := rec.testEmail;
                        cuMgt.sendUnlockMail(recAccount, rec);
                    end;
                }
                action(accountunCancel)
                {
                    Caption = 'Send Test Accountcancelation Mail';
                    ApplicationArea = all;
                    trigger OnAction()
                    var
                        cuMgt: Codeunit waas_C_Mgt;
                        recAccount: Record virtual_bank_account;
                    begin
                        recAccount.email := rec.testEmail;
                        cuMgt.sendCancelMail(recAccount, rec);
                    end;
                }
                action(sendWahtsApp)
                {
                    Caption = 'Send Test Wahtsappmail Mail';
                    ApplicationArea = all;
                    trigger OnAction()
                    var
                     cuwhatsApp : Codeunit API_C_PartnerNotification;
                    begin
                        cuwhatsApp.sendWhatsappToCarAdvisor();
                    end;
                }
            }



            //<img src= />



        }
    }
    trigger OnOpenPage()
    var
        cuA: Codeunit waas_C_ActivitiesMgt;

    begin

        cuA.CalcRTP();
        cuA.CalcSct();
        cuA.CalcSdd();
        cua.CalcTRX();

    end;

    trigger OnAfterGetRecord()
    begin
        collectionsTemplate := rec.GetcollectionEmailTemplate();

        welcomeTemplate := rec.GetwelcomeEmailTemplate();
        blockTemplate := rec.GetaccountBlockEmailTemplate();

        unlockTemplate := rec.GetaccountdeBlockedEmailTemplate();


        cancelTemplate := rec.GetaccountDeletedEmailTemplate();
    end;

    procedure setBlob(t: Text)
    var
        OutS: OutStream;
    begin

        rec.collectionEmailTemplate.CREATEOUTSTREAM(Outs);
        OutS.Write(t);

        rec.Modify();

    end;



    procedure Upload(recC: Record API_Partner; t: Text)
    var
        Outstr: OutStream;
        Instr: InStream;
        tempfilename: Text;
        DialogTitle: Label 'Pleas select a ';
    begin
        UploadIntoStream(DialogTitle + t, '', 'All files (*.*)|*.*', tempfilename, Instr);
        if not (tempfilename = '') then begin
            if t = 'welcomeEmailTemplate' then
                recC.welcomeEmailTemplate.CreateOutStream(Outstr);

            if t = 'collectionsTemplate' then
                recC.collectionEmailTemplate.CreateOutStream(Outstr);

            if t = 'accountBlockEmailTemplate' then
                recC.accountBlockEmailTemplate.CreateOutStream(Outstr);

            if t = 'accountdeBlockedEmailTemplate' then
                rec.accountdeBlockedEmailTemplate.CreateOutStream(Outstr);

            if t = 'accountDeletedEmailTemplate' then
                rec.accountDeletedEmailTemplate.CreateOutStream(Outstr);



            CopyStream(Outstr, Instr);
            recC.Modify();

        end;

    end;


    procedure DownloadTemplate()
    var
        Outstr: OutStream;
        ResponseStreasm: InStream;
        tempfilename: Text;
        DialogTitle: Label 'Pleas select a Productlogo';
    begin
        if rec.collectionEmailTemplate.HasValue then begin
            rec.CalcFields(collectionEmailTemplate);
            rec.collectionEmailTemplate.CreateInStream(ResponseStreasm);

            tempfilename := 'CollectionEmail_Template.html';

            DownloadFromStream(ResponseStreasm, 'Export', '', 'All files (*.*)|*.*', tempfilename);


        end else
            Error('No File available');

    end;



    var
        welcomeTemplate: Text;
        collectionsTemplate: Text;
        blockTemplate: Text;
        unlockTemplate: Text;
        cancelTemplate: Text;


}