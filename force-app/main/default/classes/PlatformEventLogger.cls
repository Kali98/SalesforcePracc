public class PlatformEventLogger implements WebServiceLogger{
    
    public void logMessage(String requestBody, String responseBody, String status) {
        
        
        List<Web_Server_Log__e> logEvents = new List<Web_Server_Log__e>();
        logEvents.add(new Web_Server_Log__e(Request_Body__c=requestBody, Response_Body__c=responseBody, Status__c=status));
 
 
        // Call method to publish events
        List<Database.SaveResult> results = EventBus.publish(logEvents);
        
        // Inspect publishing result for each event
        for (Database.SaveResult sr : results) {
            if (sr.isSuccess()) {
                System.debug('Successfully published event.');
            } else {
                for(Database.Error err : sr.getErrors()) {
                    System.debug('Error returned: ' +
                                err.getStatusCode() +
                                ' - ' +
                                err.getMessage());
                }
            }       
        }


     }

    
}
