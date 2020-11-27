public with sharing class WebServerLogPlatformEventTriggerHelper {
    public static void createWebServiceLogRecord(List<Web_Server_Log__e> listOfLogs) {
        
        List<WebserviceLog__c> logs = new List<WebserviceLog__c>();

            for(Web_Server_Log__e event : listOfLogs){
                WebserviceLog__c newLog = new WebserviceLog__C(
                    Request_Body__c = event.Request_Body__c, 
                    Response_Body__c = event.Response_Body__c, 
                    Status_Code__c = event.Status__c);
                    logs.add(newLog);
            }
            
        insert logs;

    }
}
