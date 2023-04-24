page 50333 apipartnermanagement
{
    PageType = API;
    APIPublisher = 'waas';
    APIGroup = 'apipartnermanagement';
    APIVersion = 'v1.0';
    EntityName = 'apipartner';
    EntitySetName = 'apipartners';
    SourceTable = API_Partner;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            field(id; rec.SystemId) { }
            field(apipatner_Id; rec.Id)
            {
            }
            field(Name; rec.Name)
            {

            }
            field(ppu_sct_sct; rec.ppu_sct_sct) { }
            field(ppu_sepa_sdd; rec.ppu_sepa_sdd) { }
            field(ppu_viban_trx; rec.ppu_viban_trx) { }
            field(sum_sepa_rtp; rec.sum_sepa_rtp) { }
            field(sum_sepa_sct; rec.sum_sepa_sct) { }
            field(sum_sepa_sdd; rec.sum_sepa_sdd) { }
            field(synthix_partnerid; rec.synthix_partnerid) { }

            field(Description; rec.Description) { }
            field(collectionEmailTemplate; rec.collectionEmailTemplate) { }
        }
    }
}