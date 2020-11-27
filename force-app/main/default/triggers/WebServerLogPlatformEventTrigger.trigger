trigger WebServerLogPlatformEventTrigger on Web_Server_Log__e (after insert) {
    
    WebServerLogPlatformEventTriggerHelper.createWebServiceLogRecord(trigger.new);

}