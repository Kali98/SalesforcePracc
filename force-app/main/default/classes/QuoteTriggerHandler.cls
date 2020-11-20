public with sharing class QuoteTriggerHandler implements ITriggerHandler {
    public static Boolean TriggerDisabled = false;

    public Boolean IsDisabled() {
        return TriggerDisabled;
    }

    public void BeforeInsert(List<SObject> newItems){}

    public void BeforeUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {}
    
    public void BeforeDelete(Map<Id, SObject> oldItems) {}

    public void AfterInsert(Map<Id, SObject> newItems) { }
  
    public void AfterUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {  }
  
    public void AfterDelete(Map<Id, SObject> oldItems) {
        Map<Id, Quote> oldQuoteMap = (Map<Id, Quote>) oldItems;
        
        deleteParentOpportunity(oldQuoteMap);

    }
  
    public void AfterUndelete(Map<Id, SObject> oldItems) {}

   
    public void deleteParentOpportunity(Map<Id, Quote> deletedQuotes){
        
        
        Set<Id> oppIds = new Set<Id>();
        for(Quote eachQuote : deletedQuotes.values()){
            oppIds.add(eachQuote.OpportunityId);

        }

        QuoteDeleteConfirm deleteRelatedOpp = new QuoteDeleteConfirm(oppIds);
        ID jobID = System.enqueueJob(deleteRelatedOpp);

        System.debug([SELECT Id, Status, NumberOfErrors FROM AsyncApexJob WHERE Id = :jobID]);


    }


}
