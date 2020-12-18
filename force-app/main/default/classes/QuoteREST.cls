@RestResource(urlMapping='/Quote/*')
global with sharing class QuoteREST {
    @HttpGet
    global static List<Quote> getAllQuotes() {


        System.debug('PAKAL :Test callout XDDDDDDD');
        List<Quote> allQuotes = [SELECT Id, Name FROM Quote WHERE CreatedDate = LAST_N_DAYS:7];
        
        return allQuotes;
    }
}
