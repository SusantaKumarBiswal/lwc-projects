trigger AccountIndustry on Account (before insert, before update, after Insert) {
    
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            AccountIndustryHandler.handleBeforeInsert();
        }
    if(Trigger.isUpdate){
           AccountIndustryHandler.handleBeforeUpdate(); 
     }
    }    
     if(Trigger.isAfter){
            if(Trigger.isInsert){
             AccountIndustryHandler.handleAfterinsert();
        }   
    }
    
}