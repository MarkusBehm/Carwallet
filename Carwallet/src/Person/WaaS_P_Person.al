page 50305 WaaS_P_Person
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Tasks;
    SourceTable = WaaS_T_Person;
    CaptionML = ENU = 'Persondata', DEU = 'Personendaten';


    layout
    {
        area(Content)
        {

            group(Personaldata)
            {
                group(pbd)
                {
                    ShowCaption = false;
                    field(emailAddress; rec.emailAddress) { ApplicationArea = All; }

                    field(academicTitle; rec.academicTitle) { ApplicationArea = All; }
                    field(firstName; rec.firstName) { ApplicationArea = All; }
                    field(lastName; rec.lastName) { ApplicationArea = All; }
                    field(dateOfBirth; rec.dateOfBirth) { ApplicationArea = All; }
                    field(placeOfBirth; rec.placeOfBirth) { ApplicationArea = All; }
                    field(maritalStatus; rec.maritalStatus) { ApplicationArea = All; }
                    field(sex; rec.sex) { ApplicationArea = All; }
                    field(phoneinternationalAreaCode; rec.phoneinternationalAreaCode)
                    {
                        ApplicationArea = All;
                    }
                    field(telephoneNumber; rec.telephoneNumber) { ApplicationArea = All; }
                }
                group(Nation)
                {
                    CaptionML = ENU = 'Nationality', DEU = 'Nationalität';
                    field(nationality; rec.nationality) { ApplicationArea = All; }
                    field(isBornInTheUS; rec.isBornInTheUS)
                    {

                        ApplicationArea = All;
                    }
                    field(isSecondNationalityUS; rec.isSecondNationalityUS) { ApplicationArea = All; }



                }



            }
            group(regulatoryAdress)
            {
                CaptionML = ENU = 'Regulatory Address', DEU = 'Wohnanschrift';

                //field(maidenName;rec.maidenName){ApplicationArea = All;}
                field(reg_street_L; reg_street_L)
                {
                    CaptionML = ENU = 'Street',
                                DEU = 'Strasse';
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        UpdateAdress();
                        CurrPage.Update(true);
                    end;
                }
                field(reg_houseNumber_L; reg_houseNumber_L)
                {
                    CaptionML = ENU = 'Housenumber',
                                DEU = 'Hausnummer';
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        UpdateAdress();

                    end;
                }
                field(reg_zipCode_L; reg_zipCode_L)
                {
                    CaptionML = ENU = 'ZIP Code',
                                DEU = 'Postleitzahl';
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        UpdateAdress();

                    end;
                }
                field(reg_city_L; reg_city_L)
                {
                    CaptionML = ENU = 'City',
                                DEU = 'Ort';
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        UpdateAdress();

                    end;
                }
                field(reg_country_L; reg_country_L)
                {
                    CaptionML = ENU = 'Country',
                                DEU = 'Land';
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        UpdateAdress();

                    end;
                }
                field(diviatingAdress; diviatingAdress)
                {
                    CaptionML = ENU = 'Different postal address',
                                DEU = 'Abweichende Postanschrift';
                    ApplicationArea = All;

                }
                group(diviAdd)
                {
                    CaptionML = ENU = 'Different postal address',
                                DEU = 'Abweichende Postanschrift';
                    Visible = diviatingAdress;

                    field(comm_street; rec.comm_street)
                    {
                        CaptionML = ENU = 'Street',
                                DEU = 'Strasse';
                        ApplicationArea = All;
                    }
                    field(comm_houseNumber; rec.comm_houseNumber)
                    {
                        CaptionML = ENU = 'Housenumber',
                                DEU = 'Hausnummer';
                        ApplicationArea = All;
                    }
                    field(comm_zipCode; rec.comm_zipCode)
                    {
                        CaptionML = ENU = 'ZIP Code',
                                DEU = 'Postleitzahl';
                        ApplicationArea = All;
                    }
                    field(comm_city; rec.comm_city)
                    {
                        CaptionML = ENU = 'City',
                                DEU = 'Ort';
                        ApplicationArea = All;
                    }

                    field(comm_country; rec.comm_country)
                    {
                        CaptionML = ENU = 'Country',
                                DEU = 'Land';
                        ApplicationArea = All;
                    }
                }
            }

            group(Legitimation)
            {
                CaptionML = ENU = 'Legitimation',
                            DEU = 'Legitimation';

                field(documentType; rec.documentType)
                {
                    ApplicationArea = All;
                }
                field(documentNumber; rec.documentNumber)
                {
                    ApplicationArea = All;
                }
                field(documentIssuingAuthority; rec.documentIssuingAuthority)
                {
                    ApplicationArea = All;
                }
                field(documentIssueDate; rec.documentIssueDate)
                {
                    ApplicationArea = All;
                }
                field(documentExpirationDate; rec.documentExpirationDate)
                {
                    ApplicationArea = All;
                }
                field(PassPortImage; rec.PassPortImage)
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    Width = 900;
                }

            }
            group(Pics)
            {
                ShowCaption = false;
                field(SignImage; rec.SignImage)
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    Width = 900;

                }


            }
            group(Tax)
            {
                CaptionML = ENU = 'Tax related toppics', DEU = 'Steuerrelevante Daten';
                field(tin; rec.tin) { ApplicationArea = All; }
                field(isGermanTaxPayer; rec.isGermanTaxPayer) { ApplicationArea = All; }
                field(isNonGermanTaxPayer; rec.isNonGermanTaxPayer) { ApplicationArea = All; }
                group(nonTxGER)
                {
                    Visible = rec.isNonGermanTaxPayer;
                    field(nonGermanTaxPayerCountry1; rec.nonGermanTaxPayerCountry1)
                    {

                        ApplicationArea = All;
                    }
                    field(nonGermanTaxId1; rec.nonGermanTaxId1)
                    {
                        ApplicationArea = All;
                    }
                    field(nonGermanTaxPayerCountry2; rec.nonGermanTaxPayerCountry2)
                    {
                        ApplicationArea = All;
                    }

                    field(nonGermanTaxId2; rec.nonGermanTaxId2)
                    {
                        ApplicationArea = All;
                    }
                    field(nonGermanTaxPayerCountry3; rec.nonGermanTaxPayerCountry3)
                    {
                        ApplicationArea = All;
                    }
                    field(nonGermanTaxId3; rec.nonGermanTaxId3)
                    {
                        ApplicationArea = All;
                    }
                }

            }


            group(kdf)
            {
                CaptionML = ENU = 'Employment and income',
                            DEU = 'Beschäftigung und Einkommen';



                field(employmentStatus; rec.employmentStatus) { ApplicationArea = All; }

                field(netIncome; rec.netIncome) { ApplicationArea = All; }

                group(empl)
                {
                    ShowCaption = false;
                    Visible = rec.employmentStatus = rec.employmentStatus::EMPLOYED;

                    field(EmployeeName; rec.EmployeeName) { ApplicationArea = ALL; }
                    field(employedSince; rec.employedSince) { ApplicationArea = All; }
                    field(Probationaryperiod; rec.probationaryperiod) { ApplicationArea = All; }
                    field(Employment_relationship; rec.Employment_relationship) { ApplicationArea = All; }

                    field(industryCodeEmployer; rec.industryCodeEmployer) { ApplicationArea = All; }

                    field(employmentLevel; rec.employmentLevel) { ApplicationArea = All; }

                }

                //selfemploymentInfo
                group(self)
                {
                    Visible = rec.employmentStatus = rec.employmentStatus::SELF_EMPLOYED;
                    ShowCaption = false;
                    field(industryCodeSelfEmployer; rec.industryCodeSelfEmployer)
                    {
                        ApplicationArea = All;
                    }
                    field(legalForm; rec.legalForm) { ApplicationArea = All; }
                    //tax

                    field(selfEmployedTaxID; rec.selfEmployedTaxID) { ApplicationArea = All; }
                    field(employedSince1; rec.employedSince) { ApplicationArea = All; }

                    //dbAccSolv.netIncome := 2700;
                }
                group(RetirementAmmount1)
                {
                    CaptionML = ENU = 'Retirement',
                                DEU = 'Rente';

                    field(Retirementdate; rec.Retirementdate) { ApplicationArea = ALL; }

                    field(RetirementAmmount; rec.RetirementAmmount) { ApplicationArea = ALL; }


                    field(RetirementAmmountPrivat; rec.RetirementAmmountPrivat) { ApplicationArea = ALL; }

                    field(RetirementOtherIncome; rec.RetirementOtherIncome) { ApplicationArea = ALL; }
                }





            }



            group(Capa)
            {
                CaptionML = ENU = 'Assets / Income / Expenses / Liabilities', DEU = 'Vermögen / Einnhamen / Ausgaben / Verbindlichkeiten';

                group(Vermögen)
                {
                    CaptionML = ENU = 'Assets',
                                DEU = 'Vermögen';

                    grid(Bankguthaben)
                    {

                        field(Savings; rec.Savings) { ApplicationArea = All; }
                        field(mothlySavings; rec.mothlySavings) { ApplicationArea = All; }
                    }
                    grid(Shares)
                    {

                        field(Depot; rec.Depot) { ApplicationArea = All; }
                        field(mothlsEx; rec.mothlsEx) { ApplicationArea = All; }
                    }

                    grid(bausparvertr)
                    {

                        field(baus; rec.baus) { ApplicationArea = All; }
                        field(mothlbau; rec.mothlbau) { ApplicationArea = All; }
                    }
                    grid(Lebsnversicht)
                    {

                        field(leben; rec.leben) { ApplicationArea = All; }
                        field(motnhlyLeen; rec.motnhlyLeen) { ApplicationArea = All; }
                    }
                    grid(otherSavings)
                    {

                        field(otherSave; rec.otherSave) { ApplicationArea = All; }
                        field(mothlSave; rec.mothlSave) { ApplicationArea = All; }
                    }

                }
                group(group1)
                {
                    ShowCaption = false;

                    group(einkünfte)
                    {
                        CaptionML = ENU = 'Income',
                                DEU = 'Einkünfte';
                        field("Spouses alimony"; rec."Spouses alimony") { ApplicationArea = All; }
                        field("Ancillary income"; rec."Ancillary income") { ApplicationArea = All; }
                        field(variableIncome; rec.variableIncome) { ApplicationArea = All; }
                    }
                    group(expnese)
                    {
                        CaptionML = ENU = 'Expenses',
                                DEU = 'Ausgaben';

                        field(rentalExpenses; rec.rentalExpenses) { ApplicationArea = All; }
                        field(loanExpenses; rec.loanExpenses) { ApplicationArea = All; }
                        field(additionalLoanExpenses; rec.additionalLoanExpenses) { }
                        field(insuranceExpenses; rec.insuranceExpenses) { ApplicationArea = All; }
                        field(dependentChildren; rec.dependentChildren) { ApplicationArea = All; }
                        field(alimonyPayment; rec.alimonyPayment) { ApplicationArea = All; }

                    }

                    group(liability)
                    {
                        CaptionML = ENU = 'Liabilities',
                                DEU = 'Verbindlichkeiten';


                        field(LoanLiability; rec.LoanLiability) { ApplicationArea = All; }
                        field(mothLoanLiability; rec.mothLoanLiability) { ApplicationArea = All; }


                    }

                }



            }


            group(DSGVO)
            {
                CaptionML = ENU = 'Consent / GDRP / Additional Data', DEU = 'Einwilligung / DSGVO / Personendaten / sonst.';

                // field(sex; rec.sex){}
                field(schufaAccordance; rec.schufaAccordance) { ApplicationArea = All; }
                field(Creditreform; rec.Creditreform) { ApplicationArea = All; }
                field(PSDII; rec.PSDII) { ApplicationArea = All; }
                //ende



            }


        }
    }

    actions
    {
        area(Processing)
        {

            action(TakePicture)
            {
                ApplicationArea = All;
                Caption = 'Take Id Card/Passport Picture';
                Image = Camera;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Activate the camera on the device.';
                Visible = CameraAvailable;

                trigger OnAction()
                begin
                    TakeNewPicture;
                end;
            }
            /*
             action(ImportPicture)
            {
                ApplicationArea = All;
                Caption = 'Import';
                Image = Import;
                ToolTip = 'Import a picture file.';

                trigger OnAction()
                var
                    FileManagement: Codeunit "File Management";
                    FileName: Text;
                    ClientFileName: Text;
                begin
                    TestField(techId);
                    if rec.firstName = '' then
                        Error(MustSpecifyNameErr);

                    if rec.PassPortImage.HasValue then
                        if not Confirm(OverrideImageQst) then
                            exit;

                    FileName := FileManagement.UploadFile(SelectPictureTxt, ClientFileName);
                    if FileName = '' then
                        exit;

                    Clear(rec.PassPortImage);
                    rec.PassPortImage.ImportFile(FileName, ClientFileName);
                    if not rec.Modify(true) then
                        rec.Insert(true);

                    if FileManagement.DeleteServerFile(FileName) then;
                end;
            }*/

            action(DeletePicture)
            {
                ApplicationArea = All;
                Caption = 'Delete';
                Enabled = DeleteExportEnabled;
                Image = Delete;
                ToolTip = 'Delete the record.';

                trigger OnAction()
                begin
                    rec.TestField(techId);

                    if not Confirm(DeleteImageQst) then
                        exit;

                    Clear(rec.PassPortImage);
                    rec.Modify(true);
                end;
            }
        }
    }

    var
        myInt: Integer;
        diviatingAdress: Boolean;

        reg_street_L: Text;
        reg_houseNumber_L: Text;
        reg_zipCode_L: Text;
        reg_city_L: Text;
        reg_country_L: Text;

        netIncome_L: Decimal;
        employer_L: Text;
        emp_street_L: Text;
        emp_houseNumber_L: Text;
        emp_zipCode_L: Text;
        emp_city_L: Text;
        emp_country_L: Text;



        Camera: Codeunit Camera;
        [InDataSet]
        CameraAvailable: Boolean;
        OverrideImageQst: Label 'The existing picture will be replaced. Do you want to continue?';
        DeleteImageQst: Label 'Are you sure you want to delete the picture?';
        SelectPictureTxt: Label 'Select a picture to upload';
        DeleteExportEnabled: Boolean;
        MustSpecifyNameErr: Label 'You must specify a customer name before you can import a picture.';
        MimeTypeTok: Label 'image/jpeg', Locked = true;

    trigger OnAfterGetRecord()
    var
        adREc: Record WaaS_T_Adresses;
    begin


        rec.CalcFields(rec.reg_street, rec.reg_houseNumber, rec.reg_zipCode, rec.reg_city, rec.reg_country);
        reg_street_L := rec.reg_street;
        reg_houseNumber_L := rec.reg_houseNumber;
        reg_city_L := rec.reg_city;
        reg_zipCode_L := rec.reg_zipCode;
        reg_country_L := rec.reg_country;

    end;

    trigger OnAfterGetCurrRecord()
    begin
        SetEditableOnPictureActions;
    end;

    trigger OnOpenPage()
    begin
        CameraAvailable := Camera.IsAvailable();
    end;

    internal procedure UpdateAdress()
    var
        address: Record WaaS_T_Adresses;
    begin

        address.originId := rec.techId;
        if reg_street_L <> '' then
            address.street := reg_street_L;
        if reg_houseNumber_L <> '' then
            address.houseNumber := reg_houseNumber_L;
        if reg_city_L <> '' then
            address.city := reg_city_L;
        if reg_zipCode_L <> '' then
            address.zip := reg_zipCode_L;
        if reg_country_L <> '' then
            address.country := reg_country_L;
        if address.get(rec.AdressID) then begin
            address.Modify()
        end else begin
            address.Insert();
            rec.AdressID := address.techID;

            rec.Modify();
        end;


    end;







    procedure TakeNewPicture()
    var
        PictureInstream: InStream;
        PictureDescription: Text;
        Outstr: OutStream;
    begin
        Rec.Find();
        Rec.TestField(rec.techId);
        Rec.TestField(firstName);

        if Rec.PassPortImage.HasValue() then
            if not Confirm(OverrideImageQst) then
                exit;

        if Camera.GetPicture(PictureInstream, PictureDescription) then begin
            Clear(Rec.PassPortImage);
            rec.PassPortImage.CreateOutStream(Outstr);
            CopyStream(Outstr, PictureInstream);
            //Rec.PassPortImage.ImportStream(PictureInstream, PictureDescription, MimeTypeTok);
            Rec.Modify(true)
        end;

    end;
















    local procedure SetEditableOnPictureActions()
    begin
        DeleteExportEnabled := rec.PassPortImage.HasValue;
    end;

    procedure IsCameraAvailable(): Boolean
    begin
        exit(Camera.IsAvailable());
    end;





}






