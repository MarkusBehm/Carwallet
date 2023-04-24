codeunit 50307 waas_C_O365ActiDictionary
{
    var
        ActivitiesMgt: Codeunit waas_C_ActivitiesMgt;
        a: Codeunit "Activities Mgt.";

    trigger OnRun()
    var
        results: Dictionary of [Text, Text];
        ActivitiesCue: Record waas_T_ActivitiesCue;
    begin
        results.Add(ActivitiesCue.FieldName(netrev_sepa_sct), Format(ActivitiesMgt.CalcSct()));
        results.Add(ActivitiesCue.FieldName(netrev_sepa_sdd), Format(ActivitiesMgt.CalcSdd()));
        results.Add(ActivitiesCue.FieldName(netrev_waas_rtp), Format(ActivitiesMgt.CalcRTP()));
        results.Add(ActivitiesCue.FieldName(netrev_waas_trx), Format(ActivitiesMgt.CalcTRX()));





        Page.SetBackgroundTaskResult(results);
    end;

    procedure FillActivitiesCue(DataList: Dictionary of [Text, Text]; var ActivitiesCue: record waas_T_ActivitiesCue)
    begin
        if DataList.ContainsKey(ActivitiesCue.FieldName(netrev_sepa_sct)) then
            Evaluate(ActivitiesCue.netrev_sepa_sct, DataList.Get(ActivitiesCue.FieldName(netrev_sepa_sct)));

        if DataList.ContainsKey(ActivitiesCue.FieldName(netrev_sepa_sdd)) then
            Evaluate(ActivitiesCue.netrev_sepa_sdd, DataList.Get(ActivitiesCue.FieldName(netrev_sepa_sdd)));

        if DataList.ContainsKey(ActivitiesCue.FieldName(netrev_waas_rtp)) then
            Evaluate(ActivitiesCue.netrev_waas_rtp, DataList.Get(ActivitiesCue.FieldName(netrev_waas_rtp)));

        if DataList.ContainsKey(ActivitiesCue.FieldName(netrev_waas_trx)) then
            Evaluate(ActivitiesCue.netrev_waas_trx, DataList.Get(ActivitiesCue.FieldName(netrev_waas_trx)));

        if DataList.ContainsKey(ActivitiesCue.FieldName("Top 10 Customer Sales YTD")) then
            Evaluate(ActivitiesCue."Top 10 Customer Sales YTD", DataList.Get(ActivitiesCue.FieldName("Top 10 Customer Sales YTD")));



    end;
}