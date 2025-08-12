/**
 * logging class for logging TODO: update this 
 */
global with sharing virtual class Logger {
    
    global String className { get; set; }
    global String methodName { get; set; }
    global String details { get; set; }
    global Datetime endTime { get; set; }
    global Logger.EventType eventType { get; set; }
    global String lineNumber { get; set; }
    global String requestBody { get; set; }
    global String requestHeaders { get; set; }
    global String requestUrl { get; set; }
    global String responseBody { get; set; }
    global String responseHeaders { get; set; }
    global String responseUrl { get; set; }
    global String stackTrace { get; set; }
    global Datetime startTime { get; set; }
    global Logger.Type type { get; set; }

    global enum EventType {
        ERROR,
        INFO,
        WARRING
    }

    global enum Type {
        APEX,
        BATCH,
        HTTP,
        LWC
    }
    
    global Logger() {
        this.details = '';
        this.startTime = System.now();
    }

    global Log__c end() {
        this.endTime = System.now();
        return this.saveLogger();
    }

    global void writeToDetails(String pText, String pObject) {
        this.details += pText + '\n' + pObject + '\n\n';
    }

    global Log__c saveLogger() {
        Log__c log = new Log__c(
            Class_Name__c = Logger.truncateString(this.className, 255),
            Method_Name__c = Logger.truncateString(this.methodName, 255),
            Details__c = Logger.truncateString(this.details, 60000),
            End_Time__c = this.endTime,
            Event_Type__c = (this.eventType != null) ? this.eventType.name() : Logger.EventType.INFO.name(),
            Line_Number__c = lineNumber,
            Request_Body__c = Logger.truncateString(this.requestBody, 30000),
            Request_Headers__c = Logger.truncateString(this.requestHeaders, 5000),
            Request_Url__c = Logger.truncateString(this.requestUrl, 2000),
            Response_Body__c = Logger.truncateString(this.responseBody, 30000),
            Response_Headers__c = Logger.truncateString(this.responseHeaders, 5000),
            Response_Url__c = Logger.truncateString(this.responseUrl, 2000),
            Stack_Trace__c = this.stackTrace,
            Start_Time__c = this.startTime,
            Type__c = (this.type != null) ? this.type.name() : Logger.Type.APEX.name()
        );

        return log;
    }

    @TestVisible
    private static String truncateString(String pString, Integer pMaxLength) {
        if (pString == null) {
            return null;
        }

        if (pString.length() > pMaxLength) {
            return pString.substring(0, pMaxLength);
        }

        return pString;
    }

    /**
     * @description pass the string version of the object into the future!
     * @param {String} pJsonLog the json version of this object
     * @return void
     */
    @future
    global static void saveInTheFuture(String pJsonLog) {
        try {
            Logger log = (Logger)JSON.deserialize(pJsonLog, Logger.class);
            insert log.end();
        } catch(Exception e) {
            System.debug('Logger.saveInTheFuture ' + e.getMessage());
        }
    }
}
