table 50316 API_T_PartnerUser
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;techId; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            
        }
         field(2;PartnerId; Integer)
        {
            DataClassification = ToBeClassified;
            
        }
        field(3;UserID; Integer)
        {
            DataClassification = ToBeClassified;
            
        }
        field(4;EmailNotification; Boolean)
        {
            DataClassification = ToBeClassified;
            
        }
        field(5;seeCompanieCars; Boolean)
        {
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