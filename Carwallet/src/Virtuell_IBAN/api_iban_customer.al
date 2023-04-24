
page 50308 api_iban_customer
{

    PageType = API;
    APIPublisher = 'waas';
    APIGroup = 'wallet';
    APIVersion = 'v1.0';
    EntityName = 'person';
    EntitySetName = 'person';
    SourceTable = WaaS_T_Person;
    DelayedInsert = true;
    ODataKeyFields = SystemId;
    layout
    {

        area(Content)
        {
            field(id; rec.SystemId) { }
            field(apipartner_Id; rec.api_partner) { }
            field(customer_id; rec.techId) { }
            field(firstName; rec.firstName) { }

            field(lastName; rec.lastName) { }
            field(emailAddress; rec.emailAddress) { }
            field(dateOfBirth; rec.dateOfBirth) { }
            field(placeOfBirth; rec.placeOfBirth) { }
            field(nationality; rec.nationality) { }
            field(phoneinternationalAreaCode; rec.phoneinternationalAreaCode) { }
            field(phoneareaCode; rec.phoneareaCode) { }

            field(telephoneNumber; rec.telephoneNumber) { }
            field(tin; rec.tin) { }
            field(isGermanTaxPayer; rec.isGermanTaxPayer) { }
            field(isBornInTheUS; rec.isBornInTheUS) { }
            field(isSecondNationalityUS; rec.isSecondNationalityUS) { }
            field(isNonGermanTaxPayer; rec.isNonGermanTaxPayer) { }
            field(nonGermanTaxId1; rec.nonGermanTaxId1) { }
            field(nonGermanTaxId2; rec.nonGermanTaxId2) { }
            field(nonGermanTaxId3; rec.nonGermanTaxId3) { }
            field(nonGermanTaxPayerCountry1; rec.nonGermanTaxPayerCountry1) { }
            field(nonGermanTaxPayerCountry2; rec.nonGermanTaxPayerCountry2) { }
            field(nonGermanTaxPayerCountry3; rec.nonGermanTaxPayerCountry3) { }
            part(billingaddress; waas_billingadress)
            {
                EntitySetName = 'billingaddress';
                EntityName = 'billingaddress';
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

page 50331 waas_billingadress
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
                field(person_id; rec.originId) { ApplicationArea = All; }

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
        MyHeader: Record WaaS_T_Person;
        MyLine: Record WaaS_T_Adresses;
    begin
        if IsDeepInsert then begin
            MyHeader.get(rec.originId);
            rec.originId := MyHeader.techId;
            // MyLine.SetRange(originId, rec.techID);
            //if MyLine.Findlast() then
            //    rec.techID := MyLine.techID + 1
            //else
            //    rec.techID := 1;
        end;

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        MyHeader: Record WaaS_T_Person;
    begin
        if rec.techID > '' then
            IsDeepInsert := true;
        if not IsDeepInsert then begin
            MyHeader.get(rec.originId);
            rec.originId := MyHeader.techId;

        end;
    end;

}