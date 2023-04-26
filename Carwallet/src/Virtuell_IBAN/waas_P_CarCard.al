page 50315 waas_P_Card
{
    PageType = Card;
    CaptionML = ENU = 'Car Wallet Card',
                DEU = 'Auto Wallet Karte';
    ApplicationArea = All;
    UsageCategory = Tasks;
    SourceTable = virtual_bank_account;

    layout
    {

        area(Content)
        {

            group(GroupName)
            {
                Editable = (vIBANBlockedAccout);
                CaptionML = ENU = 'Car Wallet',
                            DEU = 'Auto Wallet';
                field(virtual_iban; rec.virtual_iban)
                {
                    Editable = false;
                    ApplicationArea = All;
                }



                field(deleted; rec.deleted) { ApplicationArea = ALl; }
                field(blocked; rec.blocked) { ApplicationArea = ALl; }



            }
            group(Transacitons)
            {
                CaptionML = ENU = 'Transactions',
                            DEU = 'Umsätze';
                part(waas_P_Transactions; waas_P_Transactions)
                {
                    ApplicationArea = All;
                    SubPageLink = vIBAN = field(virtual_iban);
                }

            }
            group(Tenant)
            {
                CaptionML = ENU = 'Tennent',
                            DEU = 'Mieter';
                field(customer_id; rec.customer_id)
                {
                    ShowMandatory = true;
                    ApplicationArea = All;
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        perRec: Record WaaS_T_Person;
                        pagePerson: Page WaaS_P_Persons;
                    begin
                        perRec.FilterGroup(02);
                        perRec.SetFilter(api_partner, rec.apipartnerId);
                        perRec.SetFilter(techId, '%1', rec.customer_id);
                        perRec.FilterGroup(00);


                        Clear(pagePerson);
                        pagePerson.SetTableView(perRec);
                        pagePerson.SetRecord(perRec);
                        pagePerson.LookupMode(true);
                        if pagePerson.RunModal = Action::LookupOK then begin
                            pagePerson.GetRecord(perRec);
                            rec.customer_id := perRec.techId;
                            rec.Fullname := perREc.firstName + ' ' + perRec.lastName;
                            rec.email := perRec.emailAddress;
                            rec.Modify();
                            CurrPage.Update(true);
                        end;

                    end;

                }

                field(companyId; rec.companyId)
                {
                    ApplicationArea = ALl;
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        comRec: Record WaaS_T_Company;
                        pageCom: Page WaaS_P_Companies;
                    begin
                        comRec.FilterGroup(02);
                        comRec.SetFilter(comRec.api_partner, rec.apipartnerId);
                        comRec.SetFilter(techId, '%1', rec.customer_id);
                        comRec.FilterGroup(00);



                        Clear(pageCom);
                        pageCom.SetTableView(comRec);
                        pageCom.SetRecord(comRec);
                        pageCom.LookupMode(true);
                        if pageCom.RunModal = Action::LookupOK then begin
                            pageCom.GetRecord(comRec);
                            rec.companyId := comRec.techId;
                            rec.Modify();
                            rec.CalcFields(CompanyName);
                            CurrPage.Update(true);
                        end;

                    end;

                    trigger OnValidate()
                    begin
                        rec.CalcFields(CompanyName);
                    end;

                }

            }
            group(objet)
            {
                CaptionML = ENU = 'Vehicle',
                            DEU = 'Fahrzeug';

                field(No; Rec.vItem)
                {
                    ApplicationArea = All;
                }

                field(Name; Rec.vItemName)
                {
                    ApplicationArea = All;
                }

                field(VIN; Rec.VIN)
                {
                    ApplicationArea = All;
                }
                field("license plate"; Rec."license plate")
                {
                    ApplicationArea = All;
                }

                field(HSN; Rec.HSN)
                {
                    ApplicationArea = All;
                }


            }



            group(Partner)
            {
                CaptionML = ENU = 'BaaS-Partner',
                                DEU = 'BaaS-Partner';

                field(apipartnerId; rec.apipartnerId)
                {
                    ApplicationArea = All;

                }
                field("Api Partner"; rec."Api Partner")
                {
                    Editable = false;
                    ApplicationArea = All;
                }




                group(Routing)
                {
                    Editable = false;
                    field(routing_number; rec.routing_number)
                    {

                        ApplicationArea = All;
                    }
                    field(gateway; rec.gateway) { ApplicationArea = All; }
                    field(gateway_account_id; rec.gateway_account_id) { ApplicationArea = All; }


                }
            }


        }
        area(FactBoxes)
        {
            part(car; "Car Picture")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = techID = FIELD(techID);
            }

            part(fb; waas_P_FactBox)
            {
                ApplicationArea = All;
                SubPageLink = techID = field(techID);// FIELD("No.");
            }
        }


    }

    actions
    {
        area(Processing)
        {





            group("Create Car")
            {
                CaptionML = ENU = 'Create Car',
                            DEU = 'Auto erstellen';
                Image = SetupList;



                action(createDEVIBAN)
                {

                    ApplicationArea = Basic, Suite;
                    CaptionML = ENU = 'Germany', DEU = 'Deutschland';
                    Image = SetupList;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;
                    Scope = Repeater;
                    ToolTip = 'Sie können hier ein in Deutsches Fahrzeug anlegen (DE-IBAN).';

                    trigger OnAction()
                    var
                        accNo: code[10];
                        r: Codeunit waas_C_Mgt;
                    begin
                        if rec.virtual_iban = '' then begin
                            rec.virtual_iban := r.create_viban('DE', '999', accNo);
                            rec.customerAccountNumer := accNo;
                            rec.CountryCode := 'DE';
                        end else
                            Error('Wallet IBAN already created');

                    end;
                }

                action(createUKVIBAN)
                {
                    ApplicationArea = Basic, Suite;
                    CaptionML = ENU = 'United Kingdom', DEU = 'England';
                    Image = SetupList;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;
                    Scope = Repeater;
                    ToolTip = 'Sie können hier ein in Englisches Fahrzeug anlegen (UK-IBAN).';


                    trigger OnAction()
                    var
                        r: Codeunit waas_C_Mgt;
                        accNo: code[10];
                    begin
                        if rec.virtual_iban = '' then begin
                            rec.virtual_iban := r.create_viban('UK', '999', accNo);
                            rec.customerAccountNumer := accNo;
                            rec.CountryCode := 'UK';
                        end else
                            Error('virtual IBAN already created');
                    end;
                }
                action(createFRVIBAN)
                {
                    ApplicationArea = Basic, Suite;
                    CaptionML = ENU = 'France', DEU = 'Frankreich';
                    Image = SetupList;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;
                    Scope = Repeater;
                    ToolTip = 'Sie können hier ein in Französiches Fahrzeug anlegen (FR-IBAN).';


                    trigger OnAction()
                    var
                        r: Codeunit waas_C_Mgt;
                        accNo: code[10];
                    begin
                        if rec.virtual_iban = '' then begin
                            rec.virtual_iban := r.create_viban('FR', '999', accNo);
                            rec.customerAccountNumer := accNo;
                            rec.CountryCode := 'FR';
                        end else
                            Error('virtual IBAN already created');
                    end;
                }
                action(createITVIBAN)
                {
                    ApplicationArea = Basic, Suite;
                    CaptionML = ENU = 'Italy', DEU = 'Italien';
                    Image = SetupList;
                    Promoted = true;
                    PromotedCategory = new;
                    PromotedIsBig = true;
                    Scope = Repeater;
                    ToolTip = 'Sie können hier ein in Italienisches Fahrzeug anlegen (IT-IBAN).';


                    trigger OnAction()
                    var
                        r: Codeunit waas_C_Mgt;
                        accNo: code[10];
                    begin
                        if rec.virtual_iban = '' then begin
                            rec.virtual_iban := r.create_viban('IT', '999', accNo);
                            rec.customerAccountNumer := accNo;
                            rec.CountryCode := 'IT';
                        end else
                            Error('virtual IBAN already created');
                    end;
                }
                action(createNLVIBAN)
                {
                    ApplicationArea = Basic, Suite;
                    CaptionML = ENU = 'Netherland', DEU = 'Niederlande';
                    Image = SetupList;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;
                    Scope = Repeater;
                    ToolTip = 'Sie können hier ein in Niederländisches Fahrzeug anlegen (NL-IBAN).';


                    trigger OnAction()
                    var
                        r: Codeunit waas_C_Mgt;
                        accNo: code[10];
                    begin
                        if rec.virtual_iban = '' then begin
                            rec.virtual_iban := r.create_viban('NL', '999', accNo);
                            rec.customerAccountNumer := accNo;
                            rec.CountryCode := 'NL';
                        end else
                            Error('virtual IBAN already created');
                    end;
                }
                action(createPTVIBAN)
                {
                    ApplicationArea = Basic, Suite;
                    CaptionML = ENU = 'Portugal', DEU = 'Portugal';
                    Image = SetupList;
                    Promoted = true;
                    PromotedCategory = new;
                    PromotedIsBig = true;
                    Scope = Repeater;
                    ToolTip = 'Sie können hier ein in Portugisisches Fahrzeug anlegen (PT-IBAN).';


                    trigger OnAction()
                    var
                        r: Codeunit waas_C_Mgt;
                        accNo: code[10];
                    begin
                        if rec.virtual_iban = '' then begin
                            rec.virtual_iban := r.create_viban('PT', '999', accNo);
                            rec.customerAccountNumer := accNo;
                            rec.CountryCode := 'PT';
                        end else
                            Error('virtual IBAN already created');

                    end;

                }


                action(connAcc)
                {
                    ApplicationArea = Basic, Suite;
                    CaptionML = ENU = 'Connected IBAN', DEU = 'Verbundenes Konto';
                    Image = Payment;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Scope = Repeater;
                    ToolTip = 'dicate that it has been approved by the incoming document approver.';

                    trigger OnAction()
                    var
                        connAcc: Record waas_T_ConnectAccount;
                    begin
                        connAcc.FilterGroup(02);
                        connAcc.SetRange(waas_id, rec.techID);
                        connAcc.FilterGroup(01);
                        if connAcc.FindFirst() then
                            Page.Run(PAGE::waas_P_ConnectAccount, connAcc)
                        else begin
                            connAcc.Init();
                            connAcc.waas_id := rec.techID;
                            connAcc.Insert();
                            connAcc.FilterGroup(02);
                            connAcc.SetRange(waas_id, rec.techID);
                            connAcc.FilterGroup(01);
                            if connAcc.FindFirst() then
                                Page.Run(PAGE::waas_P_ConnectAccount, connAcc)
                        end;

                    end;
                }
                action(Standort)
                {
                    ApplicationArea = Basic, Suite;
                    CaptionML = ENU = 'Actual Position', DEU = 'aktueller Standort';
                    Image = Map;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Scope = Repeater;
                    ToolTip = '';

                    trigger OnAction()
                    var
                    begin
                        if rec.long = '' then
                            Hyperlink('http://www.google.com/maps/place/53.551086,9.993682/@53.551086,9.993682,17z');

                        // Hyperlink('http://maps.google.com/?q='+rec.long+','+rec.lathttp://maps.google.com/?q=53.551086,9.993682);


                    end;
                }








            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        if rec.deleted = false then
            vIBANBlockedAccout := true;

        rec.CalcFields(Balance, gateway, gateway_account_id, routing_number,
        exAccountholderName, exaktiv, exBankname, exBankname, exBIC, exIBAN, exIBAN, CompanyName);

    end;

    var
        vIBANBlockedAccout: Boolean;
        OnLineMapMustBeFilledMsg: Label 'To get a map with route directions, you must configure service in the Online Map Setup page.';


}

/*
Settings for Google
Map Service: 
http://www.google.com/maps?f=q&hl=en&q={6}+{3}+{2}+{1} 
Directions Service:
http://www.google.com/maps?f=d&hl=en&...{1}+{2}+{6}&daddr={1}+{2}+{6} 
Directions from Location:
http://www.google.com/maps?f=d&hl=en&...{10} {11}&daddr={6}+{3}+{2}+{1}
*/






page 50332 "Car Picture"
{
    Caption = 'Car Picture';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    PageType = CardPart;
    SourceTable = virtual_bank_account;

    layout
    {
        area(content)
        {
            field(Image; rec.Image)
            {
                ApplicationArea = All;
                ShowCaption = false;
                ToolTip = 'Specifies the picture of the customer, for example, a logo.';

            }
        }

    }



    actions
    {
        area(processing)
        {
            action(ImportPicture)
            {
                ApplicationArea = All;
                Caption = 'Import';
                Image = Import;
                ToolTip = 'Import a picture file.';

                trigger OnAction()
                var
                begin
                    UploadLogo(rec);
                end;
            }
            action(DeletePicture)
            {
                ApplicationArea = All;
                Caption = 'Delete';
                Enabled = DeleteExportEnabled;
                Image = Delete;
                ToolTip = 'Delete the record.';

                trigger OnAction()
                begin

                    if not Confirm(DeleteImageQst) then
                        exit;

                    Clear(rec.Image);
                    rec.Modify(true);
                end;
            }
        }

    }
    var
        OverrideImageQst: Label 'The existing picture will be replaced. Do you want to continue?';
        DeleteImageQst: Label 'Are you sure you want to delete the picture?';
        SelectPictureTxt: Label 'Select a picture to upload';
        DeleteExportEnabled: Boolean;
        MustSpecifyNameErr: Label 'You must specify a customer name before you can import a picture.';


    procedure UploadLogo(recC: Record virtual_bank_account)
    var
        Outstr: OutStream;
        Instr: InStream;
        tempfilename: Text;
        DialogTitle: Label 'Pleas select a File';
    begin
        UploadIntoStream(DialogTitle, '', 'All files (*.*)|*.*', tempfilename, Instr);
        if not (tempfilename = '') then begin
            recC.Image.CreateOutStream(Outstr);

            CopyStream(Outstr, Instr);
            recC.Modify();

        end;

    end;



}

