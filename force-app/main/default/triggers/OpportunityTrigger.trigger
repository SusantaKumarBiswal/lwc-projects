trigger OpportunityTrigger on Opportunity (before insert, after Update, before Update) {
    OpportunityTriggerDispatcher.dispatch(Trigger.OperationType);
}