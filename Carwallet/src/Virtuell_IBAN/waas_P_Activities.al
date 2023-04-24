page 50313 waas_P_Activities
{
    Caption = 'Wallet Activities';
    PageType = CardPart;
    RefreshOnActivate = true;
    ShowFilter = false;
    SourceTable = waas_T_ActivitiesCue;

    layout
    {
        area(content)
        {

            cuegroup("VIABN")
            {
                CueGroupLayout = Wide;
                CaptionML = ENU = 'Wallet Dashboard',
                            DEU = 'Wallet Dashboard';


                field(netrev_sepa_sct; rec.netrev_sepa_sct)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the sum of db net revenue for initiating sepa sct payments.';

                    trigger OnDrillDown()
                    begin
                    end;
                }
                field(netrev_sepa_sdd; rec.netrev_sepa_sdd)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the sum of your overdue payments to vendors.';

                    trigger OnDrillDown()
                    begin
                        ActivitiesMgt.DrillDownOverduePurchaseInvoiceAmount;
                    end;
                }
                field(netrev_waas_rtp; rec.netrev_waas_rtp)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the sum of your overdue payments to vendors.';

                    trigger OnDrillDown()
                    begin
                        ActivitiesMgt.DrillDownOverduePurchaseInvoiceAmount;
                    end;
                }
                field(netrev_waas_trx; rec.netrev_waas_trx)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the sum of your overdue payments to vendors.';

                    trigger OnDrillDown()
                    begin
                        ActivitiesMgt.DrillDownOverduePurchaseInvoiceAmount;
                    end;
                }
                field(APIPartner; rec.APIPartner)
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = API_P_Partners;
                    ToolTip = 'Specifies the sum of sales in the current month excluding taxes.';

                    trigger OnDrillDown()
                    begin
                        ActivitiesMgt.DrillDownAPIPartner();
                        ;
                    end;
                }
                field(APIPartner_B2B; rec.APIPartner_B2B)
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = waas_P_List;
                    ToolTip = 'Specifies the sum of sales in the current month excluding taxes.';

                    trigger OnDrillDown()
                    begin
                        ActivitiesMgt.DrillDownAPIPartner_Provider();
                        ;
                    end;
                }
                field(vibans; rec.vibans)
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = waas_P_List;
                    ToolTip = 'Specifies the sum of sales in the current month excluding taxes.';

                    trigger OnDrillDown()
                    begin
                        ActivitiesMgt.DrillDownVIBANs();

                    end;
                }

            }
            cuegroup(Approvals)
            {
                Caption = 'Approvals';
                ObsoleteState = Pending;
                ObsoleteReason = 'Replaced with Approvals Activities part';
                Visible = false;
                ObsoleteTag = '17.0';
                field("Requests to Approve"; rec."Requests to Approve")
                {
                    ApplicationArea = Suite;
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Replaced with Approvals Activities part';
                    Visible = false;
                    DrillDownPageID = "Requests to Approve";
                    ToolTip = 'Specifies the number of approval requests that require your approval.';
                    ObsoleteTag = '17.0';
                }
            }

            cuegroup(Payments)
            {
                Caption = 'Payments';
                field("Non-Applied Payments"; rec."Non-Applied Payments")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Unprocessed Payments';
                    Image = Cash;
                    ToolTip = 'Specifies imported bank transactions for payments that are not yet reconciled in the Payment Reconciliation Journal window.';

                    trigger OnDrillDown()
                    begin
                        CODEUNIT.Run(CODEUNIT::"Pmt. Rec. Journals Launcher");
                    end;
                }

            }
            cuegroup(Camera)
            {
                Caption = 'Scan documents';
                Visible = HasCamera;

                actions
                {
                    action(CreateIncomingDocumentFromCamera)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Create Incoming Doc. from Camera';
                        Image = TileCamera;
                        ToolTip = 'Create an incoming document by taking a photo of the document with your device camera. The photo will be attached to the new document.';

                        trigger OnAction()
                        var
                            IncomingDocument: Record "Incoming Document";
                            InStr: InStream;
                            PictureName: Text;
                        begin
                            if not Camera.GetPicture(InStr, PictureName) then
                                exit;

                            IncomingDocument.CreateIncomingDocument(InStr, PictureName);
                            CurrPage.Update();
                        end;
                    }
                }
            }
            cuegroup("Incoming Documents")
            {
                Caption = 'Incoming Documents';
                field("My Incoming Documents"; rec."My Incoming Documents")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies incoming documents that are assigned to you.';
                }
                field("Awaiting Verfication"; rec."Inc. Doc. Awaiting Verfication")
                {
                    ApplicationArea = Suite;
                    DrillDown = true;
                    ToolTip = 'Specifies incoming documents in OCR processing that require you to log on to the OCR service website to manually verify the OCR values before the documents can be received.';
                    Visible = ShowAwaitingIncomingDoc;

                    trigger OnDrillDown()
                    var
                        OCRServiceSetup: Record "OCR Service Setup";
                    begin
                        if OCRServiceSetup.Get then
                            if OCRServiceSetup.Enabled then
                                HyperLink(OCRServiceSetup."Sign-in URL");
                    end;
                }
            }

            cuegroup("My User Tasks")
            {
                Caption = 'My User Tasks';
                Visible = false;
                ObsoleteState = Pending;
                ObsoleteReason = 'Replaced with User Tasks Activities part';
                ObsoleteTag = '17.0';
                field("UserTaskManagement.GetMyPendingUserTasksCount"; UserTaskManagement.GetMyPendingUserTasksCount)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Pending User Tasks';
                    Image = Checklist;
                    ToolTip = 'Specifies the number of pending tasks that are assigned to you or to a group that you are a member of.';
                    Visible = false;
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Replaced with User Tasks Activities part';
                    ObsoleteTag = '17.0';

                    trigger OnDrillDown()
                    var
                        UserTaskList: Page "User Task List";
                    begin
                        UserTaskList.SetPageToShowMyPendingUserTasks;
                        UserTaskList.Run;
                    end;
                }
            }
            cuegroup("Get started")
            {
                Caption = 'Get started';
                Visible = ReplayGettingStartedVisible;

                actions
                {
                    action(ReplayGettingStarted)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Replay Getting Started';
                        Image = TileVideo;
                        ToolTip = 'Show the Getting Started guide again.';

                        trigger OnAction()
                        var
                            O365GettingStarted: Record "O365 Getting Started";
                        begin
                            if O365GettingStarted.Get(UserId, ClientTypeManagement.GetCurrentClientType()) then begin
                                O365GettingStarted."Tour in Progress" := false;
                                O365GettingStarted."Current Page" := 1;
                                O365GettingStarted.Modify();
                                Commit();
                            end;

                            O365GettingStartedMgt.LaunchWizard(true, false);
                        end;
                    }
                }
            }
        }
    }

    actions
    {
        area(processing)
        {

            action(RefreshData)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Refresh Data';
                Image = Refresh;
                ToolTip = 'Refreshes the data needed to make complex calculations.';

                trigger OnAction()
                begin
                    rec."Last Date/Time Modified" := 0DT;
                    rec.Modify;
                    CalculateCueFieldValues();
                    //CODEUNIT.Run(CODEUNIT::waas_C_ActivitiesMgt);
                    CurrPage.Update(false);
                end;
            }
            action("Set Up Cues")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Set Up Cues';
                Image = Setup;
                ToolTip = 'Set up the cues (status tiles) related to the role.';

                trigger OnAction()
                var
                    CueRecordRef: RecordRef;
                begin
                    CueRecordRef.GetTable(Rec);
                    CuesAndKpis.OpenCustomizePageForCurrentUser(CueRecordRef.Number);
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        RoleCenterNotificationMgt: Codeunit "Role Center Notification Mgt.";
    begin
        RoleCenterNotificationMgt.HideEvaluationNotificationAfterStartingTrial;
    end;

    trigger OnAfterGetRecord()
    begin
        SetActivityGroupVisibility;
    end;

    trigger OnInit()
    begin
    end;

    trigger OnOpenPage()
    var
        IntegrationSynchJobErrors: Record "Integration Synch. Job Errors";
        OCRServiceMgt: Codeunit "OCR Service Mgt.";
        RoleCenterNotificationMgt: Codeunit "Role Center Notification Mgt.";
        ConfPersonalizationMgt: Codeunit "Conf./Personalization Mgt.";
        CDSIntegrationMgt: Codeunit "CDS Integration Mgt.";
        CRMIntegrationManagement: Codeunit "CRM Integration Management";
        NewRecord: Boolean;

    begin
        rec.Reset;
        if not rec.Get then begin
            rec.Init;
            rec.Insert;
            Commit();
            NewRecord := true;
        end;

        rec.SetRange(rec."User ID Filter", UserId);
        rec.SetFilter("Due Next Week Filter", '%1..%2', CalcDate('<1D>', WorkDate()), CalcDate('<1W>', WorkDate()));

        HasCamera := Camera.IsAvailable();


        ShowAwaitingIncomingDoc := OCRServiceMgt.OcrServiceIsEnable;
        ShowIntercompanyActivities := false;
        ShowDocumentsPendingDocExchService := false;
        ShowProductVideosActivities := ClientTypeManagement.GetCurrentClientType() <> CLIENTTYPE::Phone;
        IntegrationSynchJobErrors.SetDataIntegrationUIElementsVisible(ShowDataIntegrationCues);
        RoleCenterNotificationMgt.ShowNotifications;
        ConfPersonalizationMgt.RaiseOnOpenRoleCenterEvent;

        CalculateCueFieldValues;

    end;

    var
        ActivitiesMgt: Codeunit waas_C_ActivitiesMgt;

        CuesAndKpis: Codeunit "Cues And KPIs";
        O365GettingStartedMgt: Codeunit "O365 Getting Started Mgt.";
        ClientTypeManagement: Codeunit "Client Type Management";
        UserTaskManagement: Codeunit "User Task Management";
        Camera: Codeunit Camera;
        [InDataSet]
        HasCamera: Boolean;
        ShowDocumentsPendingDocExchService: Boolean;
        ShowAwaitingIncomingDoc: Boolean;
        ShowIntercompanyActivities: Boolean;
        ShowProductVideosActivities: Boolean;
        TileGettingStartedVisible: Boolean;
        ReplayGettingStartedVisible: Boolean;
        HideSatisfactionSurvey: Boolean;
        WhatIsNewTourVisible: Boolean;
        ShowDataIntegrationCues: Boolean;
        ShowIntegrationErrorsCue: Boolean;
        HideWizardForDevices: Boolean;
        IsAddInReady: Boolean;
        IsPageReady: Boolean;
        TaskIdCalculateCue: Integer;
        PBTTelemetryCategoryLbl: Label 'PBT', Locked = true;
        PBTTelemetryMsgTxt: Label 'PBT errored with code %1 and text %2. The call stack is as follows %3.', Locked = true;




    procedure CalculateCueFieldValues()
    var
        params: Dictionary of [Text, Text];
    begin
        if (TaskIdCalculateCue <> 0) then
            CurrPage.CancelBackgroundTask(TaskIdCalculateCue);
        CurrPage.EnqueueBackgroundTask(TaskIdCalculateCue, Codeunit::waas_C_O365ActiDictionary);
    end;

    trigger OnPageBackgroundTaskError(TaskId: Integer; ErrorCode: Text; ErrorText: Text; ErrorCallStack: Text; var IsHandled: Boolean)
    begin
        Session.LogMessage('00009V0', StrSubstNo(PBTTelemetryMsgTxt, ErrorCode, ErrorText, ErrorCallStack), Verbosity::Warning, DataClassification::CustomerContent, TelemetryScope::ExtensionPublisher, 'Category', PBTTelemetryCategoryLbl);

        if (TaskId <> TaskIdCalculateCue) then
            exit;


        IsHandled := TRUE;
    end;

    trigger OnPageBackgroundTaskCompleted(TaskId: Integer; Results: Dictionary of [Text, Text])
    var
        O365ActivitiesDictionary: Codeunit waas_C_O365ActiDictionary;
    begin
        if (TaskId = TaskIdCalculateCue) THEN BEGIN
            rec.LockTable(true);
            rec.Get();
            O365ActivitiesDictionary.FillActivitiesCue(Results, Rec);
            rec."Last Date/Time Modified" := CurrentDateTime;
            rec.Modify(true);
        END
    end;

    local procedure SetActivityGroupVisibility()
    var
        DocExchServiceSetup: Record "Doc. Exch. Service Setup";
        CompanyInformation: Record "Company Information";
    begin
        if DocExchServiceSetup.Get then
            ShowDocumentsPendingDocExchService := DocExchServiceSetup.Enabled;

        if CompanyInformation.Get then
            ShowIntercompanyActivities :=
              (CompanyInformation."IC Partner Code" <> '') and ((rec."IC Inbox Transactions" <> 0) or (rec."IC Outbox Transactions" <> 0));
    end;



}
