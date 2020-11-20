public with sharing class ContactTriggerHandler implements ITriggerHandler {
    public static Boolean TriggerDisabled = false;

    public Boolean IsDisabled() {
        return TriggerDisabled;
    }

    public void BeforeInsert(List<SObject> newItems){
        ContactCityProbabilityCheck((Contact[])newItems);
    }
    public void BeforeUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {}
    
    public void BeforeDelete(Map<Id, SObject> oldItems) {}

    public void AfterInsert(Map<Id, SObject> newItems) { }
  
    public void AfterUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {  }
  
    public void AfterDelete(Map<Id, SObject> oldItems) {}
  
    public void AfterUndelete(Map<Id, SObject> oldItems) {}

    private void ContactCityProbabilityCheck(Contact[] contactList) {

        for(Contact eachContact : contactList){
            Account accToUpdate = [SELECT BillingCity from Account WHERE Id=:eachContact.AccountId];

            Integer levenDist = eachContact.MailingCity.getLevenshteinDistance(accToUpdate.BillingCity);
            Double length = eachContact.MailingCity.length(); 

            Double divider = Math.max(eachContact.MailingCity.length(), accToUpdate.BillingCity.length());
            Double probability = ((divider - levenDist)/divider)*100;

            
            if(probability >= 0.8 ) {
                accToUpdate.BillingCity = eachContact.MailingCity;
            } else  {
                eachContact.MailingCity.addError('The leven distance is: ' + probability + ' and thus cannot be inserted');
            }
        }
    }

}
