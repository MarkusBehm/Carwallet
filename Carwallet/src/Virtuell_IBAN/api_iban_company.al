
page 50307 WaaSapi_iban_company
{

    PageType = API;
    APIPublisher = 'waas';
    APIGroup = 'wallet';
    APIVersion = 'v1.0';
    EntityName = 'company';
    EntitySetName = 'companies';
    SourceTable = WaaS_T_Company;
    DelayedInsert = true;
    ODataKeyFields = SystemId;
    layout
    {

        area(Content)
        {
            field(id; rec.SystemId) { }
            field(company_id; rec.techId) { }
            field(name; rec.communityName) { }

            field(company_number; rec.company_number) { }
            field(founding_date; rec.FoundingDate) { }
            field(industrycode; rec.industrycode) { }
            field(juristic_code; rec.juristic_code) { }
            field(mailAdress; rec.mailAdress) { }
            field(phoneinternationalAreaCode; rec.internationalAreaCode) { }
            field(phoneareaCode; rec.internareaCodeationalAreaCode) { }

            field(telephoneNumber; rec.telephoneNumber) { }

            part(companybillingaddress; waas_companybillingadress)
            {
                EntitySetName = 'companybillingaddress';
                EntityName = 'companybillingaddress';
                SubPageLink = originId = field(techId);

            }

        }



    }
    trigger OnNewRecord(BelowxRec: Boolean)
    var
        recOwn: Record WaaS_T_Person;
    begin
        if recOwn.FindLast() then
            rec.techId := recOwn.techId + 1
        else
            rec.techId := 1;
    end;
}


page 50327 waas_companybillingadress
{

    PageType = ListPart;
    SourceTable = WaaS_T_Adresses;
    DelayedInsert = true;
    AutoSplitKey = true;
    PopulateAllFields = true;
    ODataKeyFields = SystemId;
    layout
    {

        area(Content)
        {
            repeater(lines)
            {
                field(person_id; rec.originId) { }

                field(addressType; rec.addressType) { ApplicationArea = All; }
                field(street; rec.street) { ApplicationArea = All; }
                field(houseNumber; rec.houseNumber) { ApplicationArea = All; }
                field(zip; rec.zip) { ApplicationArea = All; }
                field(city; rec.city)
                {
                    ApplicationArea = All;
                }
                field(country; rec.country) { ApplicationArea = All; }



            }

        }

    }
    var
        IsDeepInsert: Boolean;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        MyHeader: Record WaaS_T_Company;
        MyLine: Record WaaS_T_Adresses;
    begin
        if IsDeepInsert then begin
            MyHeader.get(rec.originId);
            rec.comapny_originId := MyHeader.techId;
            // MyLine.SetRange(originId, rec.techID);
            //if MyLine.Findlast() then
            //    rec.techID := MyLine.techID + 1
            //else
            //    rec.techID := 1;
        end;

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        MyHeader: Record WaaS_T_Company;
    begin
        if rec.techID > '' then
            IsDeepInsert := true;
        if not IsDeepInsert then begin
            MyHeader.get(rec.originId);
            rec.comapny_originId := MyHeader.techId;

        end;
    end;

}