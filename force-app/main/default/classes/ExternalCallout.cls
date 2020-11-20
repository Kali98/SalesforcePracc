public with sharing class ExternalCallout {
    public static void makeCall(){
        

        
       
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:SimonRestCredential/services/apexrest/Opportunity/');
        req.setMethod('GET');

        Http http = new Http();
        HttpResponse res = http.send(req);
        // while (res.getStatusCode() == 302){
        //     req.setEndpoint(res.getHeader('Location')); 
        //     res = new Http().send(req);
            
        // }
    
        System.debug(res.getBody());
   
        System.debug(res.getStatusCode());
    
    }
}
