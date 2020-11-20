public class QuoteDeleteConfirm implements Queueable, Database.AllowsCallouts  {
    private Set<Id> parentOpps;

    public QuoteDeleteConfirm(Set<Id> parentOpps){
        this.parentOpps = parentOpps;
    }

    public void execute(QueueableContext context){
        

        // URL.getSalesforceBaseUrl().toExternalForm() + /nazwa rest api
        //request.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId())
        List<Opportunity> oppsToDelete = [SELECT Id, Name FROM Opportunity WHERE Id IN: parentOpps];
        
        RestRequest request = new RestRequest();
        DeleteOppRequestWrapper wrapper = new DeleteOppRequestWrapper(parentOpps);
        
        request.requestBody =  Blob.valueOf(JSON.serialize(wrapper));
        request.requestUri  = 'services/apexrest/Opportunity/';
        request.httpMethod = 'POST';
        
        RestContext.request = request;

        OpportunityREST.deleteOpps();
       
    }
    

}
