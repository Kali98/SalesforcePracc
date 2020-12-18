@RestResource(urlMapping='/Quote/*')
global with sharing class QuoteREST {
    @HttpGet
    global static List<Quote> getAllQuotes() {

        System.debug('Test callout ');
        List<Quote> allQuotes = [SELECT Id, Name FROM Quote WHERE CreatedDate = LAST_N_DAYS:8];
        
        return allQuotes;
    }
}
