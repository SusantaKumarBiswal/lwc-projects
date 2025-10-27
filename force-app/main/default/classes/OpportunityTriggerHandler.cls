public class OpportunityTriggerHandler {
    
    // Trigger.oldMap - Map<Id, sObject> ~= Map<Id, Opportunity>
    // Opportunity Id - Opportunity (Old Version) -  Amount, Stage
    
    public static void handleBeforeUpdate(List<Opportunity> newRecords, Map<Id, Opportunity> oldRecordsMap){
        for(Opportunity newRecord: newRecords){
            // NewRecord - StageName == 'Closed Won'
            // NewRecord - StageName == 'Closed Won'
             Opportunity oldRecord = oldRecordsMap.get(newRecord.Id);   
                    if(oldRecord.StageName ==  'Closed Won' && newRecord.StageName ==  'Closed Won' &&  oldRecord.Amount <> newRecord.Amount){
                        newRecord.Amount.addError('Amount Can not be Changed When Stage is Closed Won ');
                    }
        }
    }
    Public static void handleActivitiesAfterUpdate(List<Opportunity> newRecords){
        List<Task> taskListToInsert = new List<Task>();
        for(Opportunity opp: newRecords){
            if(opp.StageName == 'Closed Won'){
                // Created Related Record - Task Record
                Task taskRecord = new Task();
                taskRecord.Priority = 'High';
                taskRecord.OwnerId = opp.OwnerId;
                taskRecord.Description = 'Please Split the Revenue among the Team';
                taskRecord.Status = 'Not Started';
                taskRecord.Subject =  'Split Revenue';
                taskrecord.WhatId = opp.Id;
                taskListToInsert.add(taskrecord);
            }
        }
        if(!taskListToInsert.isEmpty())
            Insert taskListToInsert; 
        
    }
    
    
    
    Public static void handleActivitiesBeforeUpdate(List<Opportunity> newRecords,Map<Id,Opportunity> OldMapRecords){
        // Figure out if the Stage is Modified or not
        // Find the Record from new List, compare and find the same record in Old list and Check if stage values are diffent
        for (Opportunity oppNew: newRecords){
            if(OldMapRecords.get(oppNew.Id).StageName != oppNew.StageName){
                oppNew.Amount = oppNew.Probability * oppNew.ExpectedRevenue; 
            }
        }
    }
    
}