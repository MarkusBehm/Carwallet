enum 50301 enum_community
{

    value(0; OTHER)
    {
        CaptionML = ENU = 'Other', DEU = 'Andere';

    }
    value(1; MARRIAGE)
    {
        CaptionML = ENU = 'Marriage', DEU = 'Verheiratet';

    }
    value(2; COHABITATION)
    {
        CaptionML = ENU = 'Cohabitation', DEU = 'Zusammenleben';

    }
    value(3; RESIDENTIAL_COMMUNITY)
    {
        CaptionML = ENU = 'Residantial Community', DEU = 'Wohngemeinschaft';

    }
    value(4; HEIRS_COMMUNITY)
    {
        CaptionML = ENU = 'HEIRS_COMMUNITY', DEU = 'ERBENGEMEINSCHAFT';

    }
    value(5; CIVIL_UNION)
    {
        CaptionML = ENU = 'CIVIL_UNION', DEU = 'CIVIL_UNION';

    }


}


//train datea
//godledate rec integration work 
//activations tager with grpd aknlodegement
//grdpr reg 

enum 50302 enum_sex
{
    value(0; MALE)
    {
        CaptionML = ENU = 'Male', DEU = 'mänlich';

    }
    value(1; FEMALE)
    {
        CaptionML = ENU = 'Female', DEU = 'weiblich';
    }
    value(2; Div)
    {
        CaptionML = ENU = 'Divers', DEU = 'divers';
    }


}

enum 50303 enum_academicTitle
{
    value(0; " ")
    {
        CaptionML = ENU = '', DEU = '';
    }
    value(1; DR)
    {
        CaptionML = ENU = 'Dr.', DEU = 'Dr.';
    }
    value(2; PROF)
    {
        CaptionML = ENU = 'Prof.', DEU = 'Prof.';
    }
    value(3; PROF_DR)
    {
        CaptionML = ENU = 'Prof.Dr.', DEU = 'Prof.Dr.';
    }

}
enum 50304 enum_proprietaryStatus
{
    // [RENTING_OR_SUBTENANT, OWN_PROPERTY, WITH_PARENTS] 
    value(0; RENTING_OR_SUBTENANT)
    {
        CaptionML = ENU = 'Renting', DEU = 'Mieter';
    }
    value(1; OWN_PROPERTY)
    {
        CaptionML = ENU = 'Own property', DEU = 'Eigene Immobilie';
    }
    value(2; WITH_PARENTS)
    {
        CaptionML = ENU = 'with Parents', DEU = 'im Elternhaus';
    }
}

enum 50305 enum_employmentStatus
{
    // [SELF_EMPLOYED, EMPLOYED]

    value(0; EMPLOYED)
    {
        CaptionML = ENU = 'Employed', DEU = 'Angestellt';
    }
    value(1; SELF_EMPLOYED)
    {
        CaptionML = ENU = 'Self Employed', DEU = 'Selbständig';
    }
}
enum 50306 eunm_employmentLevel
{

    value(0; SENIOR_EMPLOYEE) { CaptionML = ENU = 'Senior Employee', DEU = 'Leitender Angestellter'; }

    value(1; QUALIFIED_EMPLOYEE) { CaptionML = ENU = 'Qaulified Employee', DEU = 'Qualifizierter Arbeitnehmer'; }
    value(2; SALARIED_EMPLOYEE) { CaptionML = ENU = 'Salaried Employee', DEU = 'Angestellter'; }
    value(3; SENIOR_CIVIL_SERVANT) { CaptionML = ENU = 'Senior Civil Servant', DEU = 'Leitender Angestellter im öffentlicher-Dienst'; }
    value(4; MIDDLE_CIVIL_SERVANT) { CaptionML = ENU = 'Middle Civil Servant', DEU = 'Angestellter im öffentlichen Dienst'; }
    value(5; JUNIOR_CIVIL_SERVANT) { CaptionML = ENU = 'Junior Civil Servant', DEU = 'Leitender Angestellter im öffentlichen Dienst'; }
    value(6; MASTER) { CaptionML = ENU = 'Master', DEU = 'Meister'; }
    value(7; SKILLED_WORKER) { CaptionML = ENU = 'Skilled Worker', DEU = 'Facharbeiter'; }
    value(8; WORKER) { CaptionML = ENU = 'Worker', DEU = 'Arbeiter'; }
    value(9; RETIRED) { CaptionML = ENU = 'Retiered', DEU = 'Rentner'; }
    value(10; STUDENT) { CaptionML = ENU = 'Student', DEU = 'Student'; }
    value(11; SCHOLAR) { CaptionML = ENU = 'Scholar', DEU = 'SChüler'; }
    value(12; MILITARY_COMMUNITY_SERVICE) { CaptionML = ENU = 'MILITARY_COMMUNITY_SERVICE', DEU = 'MILITARY_COMMUNITY_SERVICE'; }
    value(13; APPRENTICE) { CaptionML = ENU = 'APPRENTICE', DEU = 'APPRENTICE'; }
    value(14; HOMEWORKER) { CaptionML = ENU = 'HOMEWORKER', DEU = 'HOMEWORKER'; }
    value(15; UPPER_CIVIL_SERVANT) { CaptionML = ENU = 'UPPER_CIVIL_SERVANT', DEU = 'UPPER_CIVIL_SERVANT'; }
    value(16; UNEMPLOYED) { CaptionML = ENU = 'UNEMPLOYED', DEU = 'UNEMPLOYED'; }
    value(17; CHAIRMAN) { CaptionML = ENU = 'CHAIRMAN', DEU = 'CHAIRMAN'; }
}
enum 50307 enum_maritalStatus
{

    value(0; UNKNOWN)
    {
        CaptionML = ENU = 'Unknown', DEU = 'Nicht bekannt';
    }
    value(1; SINGLE)
    {
        CaptionML = ENU = 'Single', DEU = 'Single';
    }

    value(2; MARRIED_SEPARATE_TAX_ASSESSMENT)
    {
        CaptionML = ENU = 'Married seperat tax assessment', DEU = 'Verheiratet getr. Steuerveran.';
    }
    value(3; DIVORCED)
    {
        CaptionML = ENU = 'Divorced', DEU = 'geschieden';
    }
    value(4; WIDOWED)
    {
        CaptionML = ENU = 'Widowed', DEU = 'verwitwet';
    }
    value(5; SINGLE_LIVING_IN_COHABITATION)
    {
        CaptionML = ENU = 'SINGLE_LIVING_IN_COHABITATION', DEU = 'Lebensgemeischaft';
    }
    value(6; MARRIED_SEPARATED)
    {
        CaptionML = ENU = 'MARRIED_SEPARATED', DEU = 'Verheiratet getrenntlebend';
    }
    value(7; MARRIED_JOINT_TAX_ASSESSMENT)
    {
        CaptionML = ENU = 'MARRIED_JOINT_TAX_ASSESSMENT', DEU = 'Verheirate steuerlich gemein. veranlagt';
    }
    value(8; CIVIL_UNION_JOINT_TAX_ASSESSMENT)
    {
        CaptionML = ENU = 'CIVIL_UNION_JOINT_TAX_ASSESSMENT', DEU = 'eingtr. Lebensgemeinschaft Steuerlich gemein. veranlagt';

    }
    value(9; CIVIL_UNION_SEPARATE_TAX_ASSESSMENT)
    {
        CaptionML = ENU = 'CIVIL_UNION_SEPARATE_TAX_ASSESSMENT', DEU = 'eingtr. Lebensgemeinschaft Steuerlich getrennt veranlagt';

    }
    value(10; CIVIL_UNION_SEPARATED)
    {
        CaptionML = ENU = 'CIVIL_UNION_SEPARATED', DEU = 'Lebensgemeinschaft getrennt';

    }
}

enum 50308 enum_legalform
{
    value(0; FREELANCER)
    {
        CaptionML = ENU = 'FREELANCER', DEU = 'Freeleance';

    }
    value(1; CRAFTSMAN)
    {
        CaptionML = ENU = 'CRAFTSMAN', DEU = 'Handwerker';

    }
    value(2; TRADESMAN_WITHOUT_COMMERCIAL_REGISTER_ENTRY)
    {
        CaptionML = ENU = 'TRADESMAN_WITHOUT_COMMERCIAL_REGISTER_ENTRY', DEU = 'eingetr. Kaufmann';

    }
    value(3; OTHER_LEGAL_ORGANIZATION_FORM)
    {
        CaptionML = ENU = 'OTHER_LEGAL_ORGANIZATION_FORM', DEU = 'andere jur. Person';

    }


}

enum 50309 enum_accountProductId
{
    value(0; DB_AKTIVKONTO)
    {
        CaptionML = ENU = 'Activ Account', DEU = 'Aktiv Konto';
    }

    value(1; DB_BESTKONTO)
    {
        CaptionML = ENU = 'Bestkonto', DEU = 'Bestkonto';
    }
    value(3; DB_JUNGESKONTO)
    {
        CaptionML = ENU = 'Junges Konto', DEU = 'Junges Konto';
    }
    value(4; NB_TOPGIROKONTO)
    {
        CaptionML = ENU = 'Top Giro Konto', DEU = 'TopGiro Konto';
    }
    value(5; NB_GIROKONTOPLUS)
    {
        CaptionML = ENU = 'Girokonto Plus', DEU = 'Girokonto Plus';


    }

}
enum 50310 enum_savingsAccountProduct
{
    value(0; NB_TAGESGELDKONTO)
    {
        CaptionML = ENU = 'Tagesgeld Konto', DEU = 'Tagesgeld Konto';
    }

}
enum 50311 enum_PFM
{
    value(0; PFM_ONLY)
    {
        Caption = 'PFM_ONLY';
    }
    value(1; PFM_DATA)
    {
        Caption = 'PFM_DATA';
    }

}


enum 50312 enum_Card
{
    value(1; DB_MASTERCARD_STANDARD)
    {
        CaptionML = ENU = 'DB_MASTERCARD_STANDARD', DEU = 'DB_MASTERCARD_STANDARD';

    }

    value(2; DB_MASTERCARD_GOLD)
    {
        CaptionML = ENU = 'DB_MASTERCARD_GOLD', DEU = 'DB_MASTERCARD_GOLD';
    }
    value(3; DB_MASTERCARD_TRAVEL)
    {
        CaptionML = ENU = 'DB_MASTERCARD_TRAVEL', DEU = 'DB_MASTERCARD_TRAVEL';
    }

    value(4; NB_MASTERCARD_KREDITKARTE)
    {
        CaptionML = ENU = 'DB_MASTERCARD_TRAVEL Konto', DEU = 'DB_MASTERCARD_TRAVEL';

    }

    value(5; DB_GIROCARD)
    {
        CaptionML = ENU = 'DB_GIROCARD', DEU = 'DB_GIROCARD';

    }

    value(6; NB_SERVICECARD)
    {
        CaptionML = ENU = 'NB_SERVICECARD', DEU = 'NB_SERVICECARD';

    }

    value(7; NB_MAESTROCARD)
    {
        CaptionML = ENU = 'NB_SERVICECARD', DEU = 'NB_SERVICECARD';

    }

    value(8; DB_DEUTSCHE_BANK_CARD_PLUS)
    {
        CaptionML = ENU = 'DB_DEUTSCHE_BANK_CARD_PLUS', DEU = 'DB_DEUTSCHE_BANK_CARD_PLUS';

    }

    value(9; NB_MASTERCARD_DIREKT_WITHOUT_SOLVENCY)
    {
        CaptionML = ENU = 'NB_MASTERCARD_DIREKT_WITHOUT_SOLVENCY', DEU = 'NB_MASTERCARD_DIREKT_WITHOUT_SOLVENCY';

    }

    value(10; NB_MASTERCARD_DIREKT_WITH_SOLVENCY)
    {
        CaptionML = ENU = 'NB_MASTERCARD_DIREKT_WITH_SOLVENCY', DEU = 'NB_MASTERCARD_DIREKT_WITH_SOLVENCY';

    }
}


enum 50313 participantType
{

    value(0; RootCompany)
    {
        CaptionML = ENU = 'Applicant', DEU = 'Antragsteller';
    }
    value(1; Senior_executive_of_the_company)
    {
        CaptionML = ENU = 'Senior executive of the company', DEU = 'leitende Führungskraft des Unternehmen';
    }
    value(2; company_third_party)
    {
        CaptionML = ENU = 'Participating company with control rights', DEU = 'Beteiligtes Unternehmen mit Beherschungsrecht';
    }
    value(3; other_third_party)
    {
        CaptionML = ENU = 'other third party', DEU = 'andere dritte';
    }
    value(4; beneficial_owner_UBO)
    {
        CaptionML = ENU = 'beneficial owner (UBO)', DEU = 'wirtschaftlich Berechtigte (UBO)';
    }
    value(5; Persons_acting_on_behalf_of_customer)
    {
        CaptionML = ENU = 'Persons acting on behalf of customer', DEU = 'im Auftrag von Kunde handelnde Personen';
    }
    value(6; Guarantor)
    {
        CaptionML = ENU = 'Guarantor ', DEU = 'Bürge';
    }


    value(7; DB_Group_subsidiary)
    {
        CaptionML = ENU = 'DB Group subsidiary', DEU = 'DB-Konzerntochter';
    }











}
enum 50314 identification_documents
{

    value(0; idcard)
    {
        CaptionML = ENU = 'ID card', DEU = 'Personalausweis';
    }
    value(1; passport)
    {
        CaptionML = ENU = 'Passport', DEU = 'Reisepass';
    }


}



enum 50315 Employment_relationship
{

    value(0; Unlimited)
    {
        CaptionML = ENU = 'Unlimited', DEU = 'Unbefristet';
    }
    value(1; limited)
    {
        CaptionML = ENU = 'limited', DEU = 'befristet';
    }


}
enum 50316 preferd_compensation
{
    Extensible = true;

    value(0; sdd)
    {
    }
    value(1; rtp_email)
    {
    }
    value(2; sct_mail) { }
}
enum 50318 usage_calculation
{
    value(0; sum_of_usages) { }
    value(1; last_usage) { }
    value(2; max_usage) { }
}
//Possible values are
//sum_of_usages
//the net quantity is the sum of the quantity of all usages for the current term.
//last_usage
//from among the usage records for the item price with usage_date within the relevant billing period, the quantity of the usage record with the most recent usage_date is taken as the net quantity consumed.
//max_usage
//from among the usage records for the item price with usage_date within the relevant billing period, the quantity of the usage record with the maximum value is taken as the net quantity consumed.

enum 50319 vItemType
{
    value(0; plan) { }
    value(1; addon) { }
    value(2; harge) { }

}




