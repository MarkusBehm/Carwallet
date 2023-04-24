table 50302 WaaS_T_Company
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; techId; BigInteger)
        {
            DataClassification = ToBeClassified;

        }

        field(3; communityName; Text[100])
        {
            CaptionML = ENU = 'Company name', DEU = 'Firmenname';
            DataClassification = ToBeClassified;
        }
        field(7; mailAdress; Text[100])
        {
            CaptionML = ENU = 'E-Mail-Adress', DEU = 'E-Mail-Adresse';
            DataClassification = ToBeClassified;
        }

        field(9; agb; Boolean)
        {
            CaptionML = ENU = 'I have read and accepted the terms and conditions and privacy policy of synthix ldt. by Deutsche Bank. I confirm that the information I have provided is correct.', DEU = 'Ich habe die AGB und Datenschutzbestimmungen der synthix Ltd. by Deutsche Bank gelesen und akzeptiert. Ich bestätige die Richtigkeit meiner Angaben.';
            DataClassification = ToBeClassified;
        }

        field(10; tipp; Boolean)
        {
            CaptionML = ENU = 'I would like to receive regularly updated tips and financing news.', DEU = 'Ich möchte regelmäßig aktuelle Tipps und Finanzierungsnews erhalten.';
            DataClassification = ToBeClassified;
        }
        field(27; industrycode; Code[100])
        {
            DataClassification = ToBeClassified;
        }

        field(11; company_number; Text[100]) { DataClassification = ToBeClassified; }


        field(13; current_registerstatus; Text[100]) { DataClassification = ToBeClassified; }

        field(14; juristic_code; Text[100]) { DataClassification = ToBeClassified; }


        field(17; IBAN; Text[100]) { DataClassification = ToBeClassified; }
        field(18; BIc; Text[100]) { DataClassification = ToBeClassified; }


        field(22; affiliations_naceCode; Text[100]) { DataClassification = ToBeClassified; }
        field(23; affiliations_isMainIndustry; Text[100]) { DataClassification = ToBeClassified; }
        field(24; affiliations_percentage; Text[100]) { DataClassification = ToBeClassified; }
        field(25; represFunc_name; Text[100]) { DataClassification = ToBeClassified; }
        field(26; represFunc_represFunction; Text[100]) { DataClassification = ToBeClassified; }


        field(28; internationalAreaCode; CODE[5])
        {
            CaptionML = ENU = 'countrycode', DEU = 'Ländercode';
            DataClassification = ToBeClassified;
        }
        field(29; internareaCodeationalAreaCode; Text[100])
        {
            CaptionML = ENU = 'Areacode', DEU = 'Vorwahl';
            DataClassification = ToBeClassified;
        }
        field(30; telephoneNumber; Text[100])
        {
            CaptionML = ENU = 'Telefonnummer', DEU = 'Telefonnummer';
            DataClassification = ToBeClassified;
        }

        field(31; m_internationalAreaCode; CODE[5])
        {
            CaptionML = ENU = 'International AreaCode', DEU = 'Internationale Vorwahl';
            DataClassification = ToBeClassified;
        }

        field(99; m_internationalVorwahl; CODE[10])
        {
            CaptionML = ENU = 'countrycode', DEU = 'Ländercode';
        }
        field(32; m_interCodeationalAreaCode; Text[100])
        {
            CaptionML = ENU = 'Areacode', DEU = 'Vorwahl';
            DataClassification = ToBeClassified;
        }
        field(33; m_telephoneNumber; Text[100])
        {
            CaptionML = ENU = 'Telefonnummer', DEU = 'Telefonnummer';
            DataClassification = ToBeClassified;
        }
        field(888; AdressID; Guid)
        {

            CaptionML = ENU = 'Adress ID', DEU = 'Adressen ID';
            TableRelation = WaaS_T_Adresses.techID;

        }
        field(34; reg_street; Text[150])
        {
            CaptionML = ENU = 'Street', DEU = 'Strasse';
            FieldClass = FlowField;
            CalcFormula = lookup(WaaS_T_Adresses.street where(techID = field(AdressID)));

        }
        field(35; reg_houseNumber; Text[100])
        {
            CaptionML = ENU = 'Housenumber', DEU = 'Hausnummer';
            FieldClass = FlowField;
            CalcFormula = lookup(WaaS_T_Adresses.houseNumber where(techID = field(AdressID)));
        }
        field(36; reg_zipCode; Text[100])
        {
            CaptionML = ENU = 'ZipCode', DEU = 'PLZ';
            FieldClass = FlowField;
            CalcFormula = lookup(WaaS_T_Adresses.zip where(techID = field(AdressID)));
        }
        field(37; reg_city; Text[100])
        {
            CaptionML = ENU = 'City', DEU = 'Ort';
            FieldClass = FlowField;
            CalcFormula = lookup(WaaS_T_Adresses.city where(techID = field(AdressID)));
        }
        field(38; reg_country; Text[50])
        {
            CaptionML = ENU = 'Country', DEU = 'Country';
            FieldClass = FlowField;
            CalcFormula = lookup(WaaS_T_Adresses.country where(techID = field(AdressID)));
        }
        field(39; FoundingDate; date)
        {
            CaptionML = ENU = 'Founding Date', DEU = 'Gründungsdatum';
            DataClassification = ToBeClassified;
        }
        field(40; api_partner; CODE[100])
        {
            TableRelation = API_Partner.Id;
            DataClassification = ToBeClassified;

        }






    }

    keys
    {
        key(PK; techId)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

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