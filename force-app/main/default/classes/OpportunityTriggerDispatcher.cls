public class OpportunityTriggerDispatcher {
    public static void dispatch(System.TriggerOperation operationType){
        switch on operationType{
            WHEN BEFORE_INSERT{
                //OpportunityTriggerHandler.handleBeforeInsert(Trigger.New);
            }
            WHEN BEFORE_UPDATE{
                OpportunityTriggerHandler.handleBeforeUpdate(Trigger.New, (Map<Id, Opportunity>)Trigger.OldMap);
                OpportunityTriggerHandler.handleActivitiesBeforeUpdate(Trigger.new,(Map<Id, Opportunity>)Trigger.OldMap);
                // Trigger.NEW: List<sobject> -> List<Opportunity> - new versionn of the data
                // Trigger.Old: List<sobject> -> List<Opportunity> - Old versionn of the data
                // Trigger.Map: Map<Id, <sObject> -> Map(Id,<Opportunity>) - new values in key value format
             // Trigger.Map: Map<Id, <sObject> -> Map(Id,<Opportunity>) - Old values in key value format
            }
            WHEN AFTER_UPDATE{
                OpportunityTriggerHandler.handleActivitiesAfterUpdate(Trigger.NEW);
            }
        }
    }
}