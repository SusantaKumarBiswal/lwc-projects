public class LeadTriggerHandler {
    
    Public Static Void handleActivitiesAfterInsert(List<Lead> leadRecords){
        List<Task> ListTaskRecord = new List<Task>();
        for (Lead leadRec : leadRecords){
            Task taskRecord = new Task();
            taskRecord.Priority = 'High';
            taskRecord.OwnerId = leadRec.OwnerId;
            taskRecord.Description = 'Follow Up with the New Lead';
            taskRecord.Status = 'Not Started';
            taskRecord.Subject =  'Follow-Up';
            taskrecord.WhoId = leadRec.Id;
            ListTaskRecord.add(taskrecord);
        }
        if(!ListTaskRecord.isEmpty()){
            Insert ListTaskRecord;   
        }
    }
}