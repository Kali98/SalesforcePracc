public with sharing class WebService_DI {
    public static WebServiceLogger getWebServiceLogger(Boolean customSettings){
        if(customSettings){
            return (WebServiceLogger)Type.forName(Logging_Settings__c.getInstance().Web_Service_Logger__c).newInstance();
        } else {
            Logging_Settings_Metadata__mdt[] metaData = [SELECT  Web_Service_Logger__c FROM Logging_Settings_Metadata__mdt];
            return (WebServiceLogger)Type.forName(metaData[0].Web_Service_Logger__c).newInstance();
        }
    }
}
