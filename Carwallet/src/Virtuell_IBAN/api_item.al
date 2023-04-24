page 50310 api_item
{
    PageType = API;
    APIPublisher = 'waas';
    APIGroup = 'wallet';
    APIVersion = 'v1.0';
    EntityName = 'item';
    EntitySetName = 'items';
    SourceTable = WaaS_T_vItem;
    DelayedInsert = true;
    ODataKeyFields = SystemId;


    layout
    {

        area(Content)
        {
            field(id; rec.SystemId) { }
            field(groupName; rec.GroupName) { }
            field(externalName; Rec.externalName) { }
            field(name; Rec.name) { }
            field(description; Rec.description) { }
        }


    }
    trigger OnAfterGetRecord()
    begin
        rec.CalcFields(GroupName);
    end;



}




