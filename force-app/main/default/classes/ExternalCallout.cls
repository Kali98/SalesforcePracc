public with sharing class ExternalCallout {
    public static List<String> makeCall(){
             
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:SimonRestCredential/services/apexrest/Quote/');
        req.setMethod('GET');

        Http http = new Http();
        HttpResponse res = http.send(req);
        // while (res.getStatusCode() == 302){
        //     req.setEndpoint(res.getHeader('Location')); 
        //     res = new Http().send(req);
            
        // }
    


        List<String> debugInfo = new List<String>();
        debugInfo.add(req.getBody() + 'What is going on');
        debugInfo.add(res.getBody());
        debugInfo.add('This is going on' + string.valueof(res.getStatusCode()));

        return debugInfo;

    
    }
}