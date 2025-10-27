trigger LeadTrigger on Lead (before insert, after Insert) {
    if(Trigger.isInsert && Trigger.isAfter){
        LeadTriggerHandler.handleActivitiesAfterInsert(Trigger.NEW);
    }
}