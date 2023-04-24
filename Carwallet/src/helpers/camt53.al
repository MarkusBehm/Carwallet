table 50399 camt53GroupHeader
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; techId; Guid) { }
        field(2; MsgId; Text[100]) { }//	GrpHed	SEPA Nachrichten und kann aus

        field(3; CreDtTm; Text[100]) { }//		

        field(4; MsgRcpt; Text[100]) { }//	Message Recipient	
        field(5; Nm; Text[100]) { }//	Name	
        //field(6; PstlAdr; Text[100]) { }//	Postal Address	
        //field(7; AdrTp; Text[100]) { }//	Address Type	
        //field(8; Dept; Text[70]) { }//	Department	Maximal 70 Zeichen
        //field(9; SubDept; Text[70]) { }//	Subdepartment	Maximal 70 Zeichen
        field(10; StrtNm; Text[70]) { }//	Street Name	Maximal 70 Zeichen
        field(11; BldgNb; Text[16]) { }//	Building Number	Maximal 16 Zeichen
        field(12; PstCd; Text[16]) { }//	Post Code	Maximal 16 Zeichen
        field(13; TwnNm; Text[35]) { }//	Town Name	Maximal 35 Zeichen
        //field(14; CtrySubDvsn; Text[35]) { }//	Country Sub Division	Maximal 35 Zeichen
        field(15; Ctry; Text[100]) { }//	Country	SEPA Country Code
        //field(16; AdrLine; Text[79]) { }//	Address Line	Maximal 70 Zeichen
        //field(17; AdrLine_Id; Text[100]) { }//	Identification	
        //hier db mothermother
        field(18; OrgId; Text[100]) { }//	Organisation Identification	
        //field(19; BICOrBEI; Text[100]) { }//	BIC Or BEI	
        //field(20; BICOrBEI_Othr; Text[100]) { }//	Other	
        //field(21; BICOrBEI_Id; Text[35]) { }//	Identification	Maximal 35 Zeichen
        //field(22; BICOrBEI_SchmeNm; Text[100]) { }//	Scheme Name	
        //field(23; BICOrBEI_Cd; Text[100]) { }//	Code	
        //field(24; BICOrBEI_Prtry; Text[35]) { }//	Proprietary	Maximal 35 Zeichen
        //field(25; BICOrBEI_Issr; Text[35]) { }//	Issuer	Maximal 35 Zeichen
        //field(26; PrvtId; Text[100]) { }//	Private Identification	
        //field(27; DtAndPlcOfBirth; Text[100]) { }//	Date And Place Of Birth	
        //field(28; BirthDt; Date) { }//	Birth Date	ISO Date
        //field(29; PrvcOfBirth; Text[35]) { }//	Province Of Birth	Maximal 35 Zeichen
        //field(30; CityOfBirth; Text[35]) { }//	City Of Birth	Maximal 35 Zeichen
        //field(31; CtryOfBirth; Text[100]) { }//	Country Of Birth	
        field(32; OthrId; Text[100]) { }//	Other Identification	
                                        //field(33; Id; Text[35]) { }//	Identification	Maximal 35 Zeichen
                                        // field(34; SchmeNm; Text[100]) { }//	Scheme Name	
                                        // field(35; Cd; Text[100]) { }//	Code	
                                        // field(36; Prtry; Text[35]) { }//	Proprietary	Maximal 35 Zeichen
                                        // field(37; Issr; Text[35]) { }//	Issuer	Maximal 35 Zeichen
                                        // field(38; CtryOfRes; Text[100]) { }//	Country Of Residence	
                                        // field(39; CtctDtls; Text[100]) { }//	Contact Details	
                                        // field(40; NmPrfx; Text[100]) { }//	Name Prefix Code	
                                        // field(41; NmPrfx_Nm; Text[140]) { }//	Name	Maximal 140 Zeichen
                                        // field(42; PhneNb; Text[100]) { }//	Phone Number	
                                        // field(43; MobNb; Text[100]) { }//	Mobile Number	
                                        // field(44; FaxNb; Text[100]) { }//	Fax Number	
                                        // field(45; EmailAdr; Text[249]) { }//	Email Adress	Maximal 2048 Zeichen
                                        //field(45; Othr; Text[35]) { }//	Other	Maximal 35 Zeichen
        field(45; Id; Text[35]) { }//	Other	Maximal 35 Zeichen

        //field(47; MsgPgntn; Text[100]) { }//	Message Pagination	
        field(48; PgNb; Text[100]) { }//	Page Number	
        field(49; LastPgInd; Text[100]) { }//	Last Page Indicator	
        //field(50; AddtlInf; Text[200]) { }//	Additional Information	Maximal 200 Zeichen

    }

    keys
    {
        key(Key1; techId)
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


table 50398 camt53statement
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; techId; Guid)
        {
            DataClassification = ToBeClassified;
        }
        //statement
        field(2; Id; Text[100]) { }//	
        //field(4; LglSeqNb; Text[100]) { }//	
        field(5; CreDtTm; DateTime) { }//	
        field(6; ElctrncSeqNb; Text[100]) { }
        // field(7; FrDtTm; Text[100]) { }//	From Date Time
        // field(8; ToDtTm; Text[100]) { }//	To Date Time
        // field(12; RptgSrc_Cd; Text[100]) { }//	Code
        // field(13; RptgSrc_Prtry; Text[100]) { }//	Proprietary

    }
}
table 50397 camt53Account
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; techId; Guid) { }
        //Account
        //level2    
        //mother field(14; Acct; Text[100]) { }//	Account
        field(15; Id; Text[100]) { }//	Identification
        field(16; IBAN; Text[100]) { }//	

        // field(17; OthrId; Text[100]) { }//	Other Identification
        // field(18; OthrId_Id; Text[100]) { }//	level 5

        //mother  field(19; SchmeNm; Text[100]) { }//	Scheme Name
        //mother field(20; Acct_OthrId_Cd; Text[100]) { }//	Code
        // field(21; Acct_OthrId_Prtry; Text[100]) { }//	Proprietary
        // field(22; Acct_OthrId_Issr; Text[100]) { }//	Issuer
        //mother field(23; Tp; Text[100]) { }//	Type
        //mother field(24; Cd; Text[100]) { }//	Code

        //field(25; Prtry; Text[100]) { }//	Proprietary
        field(26; Ccy; Text[100]) { }//	Currency
                                     /*field(27; Nm; Text[100]) { }//	Name
                                     field(28; Ownr; Text[100]) { }//	Owner
                                     field(29; Nm; Text[100]) { }//	Name
                                     field(30; PstlAdr; Text[100]) { }//	Postal Address
                                     field(31; AdrTp; Text[100]) { }//	Address Type
                                     field(32; Dept; Text[100]) { }//	Department
                                     field(33; SubDept; Text[100]) { }//	Subdepartment
                                     field(34; StrtNm; Text[100]) { }//	Street Name
                                     field(35; BldgNb; Text[100]) { }//	Building Number
                                     field(36; PstCd; Text[100]) { }//	Post Code
                                     field(37; TwnNm; Text[100]) { }//	Town Name
                                     field(38; CtrySubDvsn; Text[100]) { }//	Country Sub Division
                                     field(39; Ctry; Text[100]) { }//	Country
                                     field(40; AdrLine; Text[100]) { }//	Address Line
                                     field(41; Id; Text[100]) { }//	Identification
                                     field(42; OrgId; Text[100]) { }//	Organisation Identification
                                     field(43; BICOrBEI; Text[100]) { }//	

                                     field(44; Othr; Text[100]) { }//	Other
                                     field(45; Id; Text[100]) { }//	Identification
                                     field(46; SchmeNm; Text[100]) { }//	Scheme Name
                                     field(47; Cd; Text[100]) { }//	Code
                                     field(48; Prtry; Text[100]) { }//	Proprietary
                                     field(49; Issr; Text[100]) { }//	Issuer
                                     field(50; PrvtId; Text[100]) { }//	Private Identification
                                     field(51; DtAndPlcOfBirth; Text[100]) { }//	

                                     //field(53; BirthDt; Text[100]) { }//	Birth Date
                                     //field(54; PrvcOfBirth; Text[100]) { }//	Province Of Birth
                                     //field(55; CityOfBirth; Text[100]) { }//	City Of Birth
                                     //field(56; CtryOfBirth; Text[100]) { }//	Country Of Birth
                                     //field(57; OthrId; Text[100]) { }//	Other Identification
                                     //field(58; Id; Text[100]) { }//	Identification
                                     //field(59; SchmeNm; Text[100]) { }//	Scheme Name
                                     //field(60; Cd; Text[100]) { }//	Code
                                     //field(61; Prtry; Text[100]) { }//	Proprietary
                                     //field(62; Issr; Text[100]) { }//	Issuer
                                     //field(63; CtryOfRes; Text[100]) { }//	Country Of Residence
                                     //field(64; CtctDtls; Text[100]) { }//	Contact Details
                                     //field(65; NmPrfx; Text[100]) { }//	Name Prefix Code
                                     //field(66; Nm; Text[100]) { }//	Name
                                     //field(67; PhneNb; Text[100]) { }//	Phone Number
                                     //field(68; MobNb; Text[100]) { }//	Mobile Number
                                     //field(69; FaxNb; Text[100]) { }//	Fax Number
                                    // field(70; EmailAdr; Text[100]) { }//	Email Adress
                                    // field(71; Othr; Text[100]) { }//	Other
                                    */
                                     //  field(72; Svcr; Text[100]) { }//	Servicer
        field(73; FinInstnId; Text[100]) { }//	bic
        /*
        field(74; BIC; Text[100]) { }
        field(75; ClrSysMmbId; Text[100]) { }//	
        field(76; ClrSysId; Text[100]) { }//	
        field(77; Cd; Text[100]) { }//	Code
        field(78; Prtry; Text[100]) { }//	Proprietary
        field(79; MmbId; Text[100]) { }//	Member Identification
        field(80; Nm; Text[100]) { }//	Name
        field(81; PstlAdr; Text[100]) { }//	Postal Address
        field(82; AdrTp; Text[100]) { }//	Address Type
        field(83; Dept; Text[100]) { }//	Department
        field(84; SubDept; Text[100]) { }//	Subdepartment
        field(85; StrtNm; Text[100]) { }//	Street Name
        field(86; BldgNb; Text[100]) { }//	Building Number
        field(87; PstCd; Text[100]) { }//	Post Code
        field(88; TwnNm; Text[100]) { }//	Town Name
        field(89; CtrySubDvsn; Text[100]) { }//	Country Sub Division
        field(90; Ctry; Text[100]) { }//	Country
        field(91; AdrLine; Text[100]) { }//	AddressLine
        field(92; OthrId; Text[100]) { }//	Other Identification
        field(93; Id; Text[100]) { }//	Identification
        field(94; SchmeNm; Text[100]) { }//	Scheme Name
        field(95; Cd; Text[100]) { }//	Code
        field(96; Prtry; Text[100]) { }//	Proprietary
        field(97; Issr; Text[100]) { }//	Issuer
        field(98; BrnchId; Text[100]) { }//	Branch Identification
        field(99; Id; Text[100]) { }//	Identification
        field(100; Nm; Text[100]) { }//	Name
        field(101; PstlAdr; Text[100]) { }//	Postal Address
        field(102; AdrTp; Text[100]) { }//	Address Type
        field(103; Dept; Text[100]) { }//	Department
        field(104; SubDept; Text[100]) { }//	Subdepartment
        field(105; StrtNm; Text[100]) { }//	Street Name
        field(106; BldgNb; Text[100]) { }//	Building Number
        field(107; PstCd; Text[100]) { }//	Post Code
        field(108; TwnNm; Text[100]) { }//	Town Name
        field(109; CtrySubDvsn; Text[100]) { }//	Country Sub Division
        field(110; Ctry; Text[100]) { }//	Country
        field(111; AdrLine; Text[100]) { }//	Address Line
        */
    }

    keys
    {
        key(Key1; techId)
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

table 50395 camt53BAL
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; techId; BigInteger)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; GrpHeadertechid; Guid)
        {
            DataClassification = ToBeClassified;

        }

        field(3; Cd; Text[100]) { }
        field(4; Amt_Ccy; Code[3]) { }

        field(5; Amt; Decimal) { }

        field(6; CdtDbtInD; Text[100]) { }
        field(7; Dt; DateTime) { }

    }

    keys
    {
        key(Key1; techId)
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


table 50396 camt53Ntry
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; techId; BigInteger)
        {
            DataClassification = ToBeClassified;

        }
        field(2; GrpHeadertechid; Guid)
        {
            DataClassification = ToBeClassified;
        }


        //Ntry-->NtryRef
        //Ntry-->Amt(CCY)
        field(3; Amt; Decimal) { DataClassification = ToBeClassified; }
        field(4; Ccy; Code[3]) { DataClassification = ToBeClassified; }

        //Ntry-->CdtDbtInd
        //Ntry-->Sts
        //Ntry-->BookgDt--->Dt
        field(5; BookgDt; Date) { DataClassification = ToBeClassified; }


        //Ntry-->ValDt ---> Dt // abweicung vom std
        field(6; ValDt; Date) { DataClassification = ToBeClassified; }


        //Ntry-->AcctSvcrRef
        field(7; AcctSvcrRef; tEXT[30]) { DataClassification = ToBeClassified; }
        /*
                Ntry-->BkTxCd-->Domn-->Cd
                Ntry-->BkTxCd-->Domn-->Fmly-->CD 
                 Ntry-->BkTxCd-->Domn-->Fmly-->SubFmlyCd

                Ntry-->NtryDtls-->
                Ntry-->NtryDtls-->TxDtls-->Refs-->AcctSvcrRef
                Ntry-->NtryDtls-->TxDtls-->Refs-->PmtInfId
                Ntry-->NtryDtls-->TxDtls-->Refs-->InstrId
                Ntry-->NtryDtls-->TxDtls-->Refs-->EndToEndId
                */
        field(8; EndToEndId; TExt[100]) { DataClassification = ToBeClassified; }
        /*
        Ntry-->NtryDtls-->TxDtls-->Refs-->TxId
        Ntry-->NtryDtls-->TxDtls-->AmtDtls-->TxAmt->Amt
        Ntry-->NtryDtls-->TxDtls-->AmtDtls-->TxAmt->Amt-->Attribut(Ccy)
        Ntry-->NtryDtls-->TxDtls-->BkTxCd-->Domn-->Cd
        Ntry-->NtryDtls-->TxDtls-->BkTxCd-->Domn-->Fmly-->Cd
        Ntry-->NtryDtls-->TxDtls-->BkTxCd-->Domn-->Fmly-->SubFmlyCd
 */
        field(9; Dbtr_Nm; Text[100]) { DataClassification = ToBeClassified; }
        field(10; Dbtr_PstlAdr_Ctry; Text[100]) { DataClassification = ToBeClassified; }
        field(11; Dbtr_PstlAdr_AdrLine; Text[100]) { DataClassification = ToBeClassified; }
        field(12; DbtrAcct_Id_Iban; Text[100]) { DataClassification = ToBeClassified; }
        field(13; Cdtr_Nm; Text[100]) { DataClassification = ToBeClassified; }
        field(14; Cdtr_PstlAdr_Ctry; Text[100]) { DataClassification = ToBeClassified; }
        field(15; Cdtr_PstlAdr_AdrLine; Text[100]) { DataClassification = ToBeClassified; }
        field(16; CdtrAcct_Id_Iban; Text[100]) { DataClassification = ToBeClassified; }
        field(17; UltmCdtr_Nm; Text[100]) { DataClassification = ToBeClassified; }
        field(18; UltmCdtr_PstlAdr_Ctry; Text[100]) { DataClassification = ToBeClassified; }
        field(19; UltmCdtrPstlAdr_AdrLine; Text[100]) { DataClassification = ToBeClassified; }
        field(20; UltmCdtrAcc_IBAN; Text[100]) { DataClassification = ToBeClassified; }


        // Ntry-->NtryDtls-->TxDtls-->RltdPties-->Dbtr-->Nm
        // Ntry-->NtryDtls-->TxDtls-->RltdPties-->Dbtr-->PstlAdr-->Ctry
        // Ntry-->NtryDtls-->TxDtls-->RltdPties-->Dbtr-->PstlAdr-->AdrLine
        // Ntry-->NtryDtls-->TxDtls-->RltdPties-->DbtrAcct-->Id-->IBAN
        // Ntry-->NtryDtls-->TxDtls-->RltdPties-->Cdtr-->Nm

        /*
         Ntry-->NtryDtls-->TxDtls-->RltdPties-->Cdtr-->PstlAdr-->Ctry
         Ntry-->NtryDtls-->TxDtls-->RltdPties-->Cdtr-->PstlAdr-->AdrLine
         Ntry-->NtryDtls-->TxDtls-->RltdPties-->CdtrAcct-->Id-->Iban
         Ntry-->NtryDtls-->TxDtls-->RltdPties-->UltmCdtr-->Nm
         Ntry-->NtryDtls-->TxDtls-->RltdPties-->UltmCdtr-->Id-->PrvtId-->Othr-->Id
         Ntry-->NtryDtls-->TxDtls-->RltdPties-->UltmCdtr-->Id-->PrvtId-->Othr-->SchemNm-->Prtry

         Ntry-->NtryDtls-->TxDtls-->RltdAgts-->DbtrAgt-->FinInstnId--BIC
         Ntry-->NtryDtls-->TxDtls-->RltdAgts-->CdtrAgt-->FinInstnId--BIC

         Ntry-->NtryDtls-->TxDtls-->RmtInf--->Ustrd
         */
        field(21; Ustrd; Text[200]) { DataClassification = ToBeClassified; }

        /*
        Ntry-->NtryDtls-->TxDtls-->RltdDts-->InstBkSttlmDt

*/

















    }

    keys
    {
        key(Key1; techId)
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