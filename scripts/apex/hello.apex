
List<String> debugInfo = ExternalCallout.makeCall();
WebServiceLogger logger = WebService_DI.getWebServiceLogger(true);
// Basically passing (request body, response body, status code)
logger.logMessage(debugInfo.get(0), debugInfo.get(1), debugInfo.get(2)); 



