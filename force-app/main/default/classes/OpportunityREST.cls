@RestResource(urlMapping='/Opportunity/*')
global with sharing class OpportunityREST {
    
    @HttpGet
    global static Opportunity getOppName() {
        Id oppId = RestContext.request.params.get('opportunityId');
        Opportunity desiredAcc = [SELECT Id, Name FROM Opportunity WHERE Id = :oppId];
        
        return desiredAcc;
    }

    @HttpDelete
    global static void deleteOpp() {
        Id oppId = RestContext.request.params.get('opportunityId');
        Opportunity desiredAcc = [SELECT Id, Name FROM Opportunity WHERE Id = :oppId];
        
        delete desiredAcc;
    }
    

    @HttpPost
    global static void deleteOpps() {
        
        DeleteOppRequestWrapper wrapper = (DeleteOppRequestWrapper) JSON.deserialize(RestContext.request.requestBody.toString(), DeleteOppRequestWrapper.class);
        Set<Id> wrapperList = wrapper.restIds;
        List<Opportunity> desiredOpps = [SELECT Id, Name FROM Opportunity WHERE Id IN :wrapperList];  
        delete desiredOpps;
    }

   


    
}
