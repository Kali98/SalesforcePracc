public class SystemDebugLogger implements WebServiceLogger {
    

    public void logMessage(String requestBody, String responseBody, String status) {
            
        System.debug('Request Body: ' + requestBody);
        System.debug('Response Body: ' + responseBody);
        System.debug('Status Code: ' + status);

     }
    
    
}
