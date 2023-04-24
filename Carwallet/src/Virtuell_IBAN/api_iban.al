page 50309 api_viban

{
    PageType = API;
    APIPublisher = 'waas';
    APIGroup = 'wallet';
    APIVersion = 'v1.0';
    EntityName = 'account';
    EntitySetName = 'accounts';
    SourceTable = virtual_bank_account;
    DelayedInsert = true;
    ODataKeyFields = SystemId;


    layout
    {

        area(Content)
        {
            field(id; rec.SystemId) { ApplicationArea = All; }
            field(country_code; rec.CountryCode) { }
            field(apipartner_Id; rec.apipartnerId) { }
            field(customer_id; rec.customer_id) { }
            field(company_id; rec.companyId) { }
            field(virtual_iban; rec.virtual_iban)
            {
                Editable = false;


            }
            field(blocked; rec.blocked) { Editable = false; }
            field(customer_account_number; rec.customerAccountNumer) { Editable = false; }
            field(preferd_compensation; rec.preferd_compensation) { }
            field(opt_in; rec.optin) { }
            field(elevatorType; Rec.vItem) { }
            field(elevatorTypeName; Rec.vItemName) { }
            field(partner_provider; rec.partnerProvider) { }
            part(waas_transactions; waas_transactions)
            {
                EntitySetName = 'waas_transactions';
                EntityName = 'waas_transactions';
                SubPageLink = techvIban = field(SystemId);

            }

        }


    }
    var
        PostetEmailCount: Text;
        WaitTaskId: Integer;


    trigger OnOpenPage()
    var
    begin

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin


        rec.techID := CreateGuid();
    end;

    trigger OnAfterGetRecord()
    var
        addAzure: Record "AAD Application";
    begin
        rec.CalcFields(vItemName);
        if CurrentClientType in [ClientType::ODataV4, ClientType::OData] then begin
        end;

    end;
    /*

    trigger OnNextRecord(Steps: Integer): Integer
    var
        Taskparameters: Dictionary of [Text, TExt];
    begin
        Taskparameters.Add('waas_techId', rec.techID);
        CurrPage.EnqueueBackgroundTask(WaitTaskId, 50200, Taskparameters, 1000, PageBackgroundTaskErrorLevel::Warning);

    end;

    trigger OnPageBackgroundTaskCompleted(TaskId: Integer; Results: Dictionary of [Text, Text])
    var
        PBNotification: Notification;
    begin
        if (TaskId = WaitTaskId) then begin

            Evaluate(PostetEmailCount, Results.get('PCount'));
        end;

    end;

    trigger OnPageBackgroundTaskError(TaskId: Integer; ErrorCode: Text; ErrorText: Text; ErrorCallStack: Text; var IsHandled: Boolean)
    var
        PBErrorNOtification: Notification;
    begin
        If (ErrorText = 'Child Session task was  terminated because of timeout.') then begin
            IsHandled := true;
            PBErrorNOtification.Message('It took to long to send mail');
            PBErrorNOtification.Send();
        end;

    end;
    */

}

page 50328 waas_transactions
{

    PageType = ListPart;
    SourceTable = waas_T_Transactions;
    InsertAllowed = false;
    ModifyAllowed = false;
    // DelayedInsert = true;
    AutoSplitKey = true;
    PopulateAllFields = true;
    ODataKeyFields = SystemId;
    layout
    {

        area(Content)
        {
            repeater(lines)
            {
                field(id; Format(rec.SystemId, 0, 4).ToLower()) { ApplicationArea = All; }
                field(techvIban; rec.techvIban) { ApplicationArea = All; }
                field(bookg_dt; rec.BookDt) { ApplicationArea = All; }
                field(val_dt; rec.ValDt) { ApplicationArea = All; }

                field(ammount; rec.Amt) { ApplicationArea = All; }
                field(currency; rec.Ccy) { ApplicationArea = All; }
                field(debetor_nm; rec.Dbtr_Nm) { ApplicationArea = All; }
                field(purpose_of_use; rec.Ustrd) { ApplicationArea = All; }



            }

        }

    }
    var
        IsDeepInsert: Boolean;




    /*
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        MyHeader: Record virtual_bank_account;
        MyLine: Record waas_T_Transactions;
    begin
        if IsDeepInsert then begin
            MyHeader.GetBySystemId(rec.vIBAN);
            rec.vIBAN := MyHeader.virtual_iban;
            MyLine.SetRange(vIBAN, rec.vIBAN);
            if MyLine.FindLast() then
                rec.techID := rec.techID +1
            else
                rec.techID := 1;
        end;

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        MyHeader: Record "My Header";
    begin
        IsDeepInsert := IsNullGuid(rec."Header Id");
        if not IsDeepInsert then begin
            MyHeader.GetBySystemId(rec."Header Id");
            rec."Header No." := MyHeader."No.";

        end;
    end;
    */

}




