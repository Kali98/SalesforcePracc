trigger OpportunityTrigger on Opportunity (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    // Call the trigger dispatcher and pass it an instance of the AccountTriggerHandler and Trigger.opperationType
    TriggerDispatcher.Run(new OpportunityTriggerHandler(), Trigger.operationType);
} 