table 50317 API_Partner
{
    DataClassification = ToBeClassified;

    fields
    {

        field(1; Id; Code[50])
        {
            DataClassification = ToBeClassified;

        }

        field(2; Name; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(3; synthix_partnerid; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(4; Description; Text[249])
        {
            DataClassification = ToBeClassified;

        }

        field(5; vIBAN_gateway; Text[20])
        {
            DataClassification = ToBeClassified;

        }
        field(6; vIBAN_routing_number; CODE[3])
        {
            DataClassification = ToBeClassified;

        }
        field(7; vIBAN_gateway_account_id; Code[32])
        {
            DataClassification = ToBeClassified;

        }

        field(8; ppu_sepa_sdd; Decimal)
        {

        }
        field(9; ppu_viban_trx; Decimal)
        {

        }
        field(10; ppu_sct_sct; Decimal)
        {

        }
        field(12; ppu_viban_rtp; Decimal)
        {

        }

        field(13; collectionEmailTemplate; blob)
        {
            DataClassification = ToBeClassified;
        }
        field(14; welcomeEmailTemplate; blob)
        {
            DataClassification = ToBeClassified;
        }
        field(15; paymentDoneEmailTemplate; blob)
        {
            DataClassification = ToBeClassified;
        }
        field(16; accountBlockEmailTemplate; blob)
        {
            DataClassification = ToBeClassified;
        }
        field(17; accountdeBlockedEmailTemplate; blob)
        {
            DataClassification = ToBeClassified;
        }

        field(18; accountDeletedEmailTemplate; blob)
        {
            DataClassification = ToBeClassified;
        }

        field(19;addAzureClientID;Guid){
            TableRelation = "AAD Application"."Client Id";
        }
        field(21;"Add Azure Name";Text[100]){
            FieldClass = FlowField;
            CalcFormula = lookup("AAD Application".Description where("Client Id" = field(addAzureClientID)));

        }



        field(20; testEmail; Text[100])
        {

        }

        field(990; sum_sepa_sdd; Integer)
        {
        }
        field(991; sum_sepa_sct; Integer)
        {
        }
        field(992; sum_sepa_rtp; Integer)
        {
        }
        field(999; sum_viban_trx; Integer)
        {
        }



    }

    keys
    {
        key(Key1; id)
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

    procedure GetcollectionEmailTemplate() t: Text
    var
        MyInStream: InStream;
    begin
        rec.calcfields(Rec.collectionEmailTemplate);
        if Rec.collectionEmailTemplate.hasvalue then begin
            Rec.collectionEmailTemplate.CREATEinSTREAM(MyInStream);
            //while not StreamIn.EOS do begin  //if you need somewhat in a loop
            MyInStream.READ(t);
            //end;
        end;
    end;

    procedure GetwelcomeEmailTemplate() t: Text
    var
        MyInStream: InStream;
    begin
        rec.calcfields(Rec.welcomeEmailTemplate);
        if Rec.welcomeEmailTemplate.hasvalue then begin
            Rec.welcomeEmailTemplate.CREATEinSTREAM(MyInStream);
            //while not StreamIn.EOS do begin  //if you need somewhat in a loop
            MyInStream.READ(t);
            //end;
        end;
    end;

    procedure GetaccountBlockEmailTemplate() t: Text
    var
        MyInStream: InStream;
    begin
        rec.calcfields(Rec.accountBlockEmailTemplate);
        if Rec.accountBlockEmailTemplate.hasvalue then begin
            Rec.accountBlockEmailTemplate.CREATEinSTREAM(MyInStream);
            //while not StreamIn.EOS do begin  //if you need somewhat in a loop
            MyInStream.READ(t);
            //end;
        end;
    end;

    procedure GetaccountdeBlockedEmailTemplate() t: Text
    var
        MyInStream: InStream;
    begin
        rec.calcfields(Rec.accountdeBlockedEmailTemplate);
        if Rec.accountdeBlockedEmailTemplate.hasvalue then begin
            Rec.accountdeBlockedEmailTemplate.CREATEinSTREAM(MyInStream);
            //while not StreamIn.EOS do begin  //if you need somewhat in a loop
            MyInStream.READ(t);
            //end;
        end;
    end;

    procedure GetaccountDeletedEmailTemplate() t: Text
    var
        MyInStream: InStream;
    begin
        rec.calcfields(Rec.accountDeletedEmailTemplate);
        if Rec.accountDeletedEmailTemplate.hasvalue then begin
            Rec.accountDeletedEmailTemplate.CREATEinSTREAM(MyInStream);
            //while not StreamIn.EOS do begin  //if you need somewhat in a loop
            MyInStream.READ(t);
            //end;
        end;
    end;

}