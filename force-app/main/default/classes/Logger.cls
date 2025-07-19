/**
 * logging class for logging TODO: update this 
 */
public with sharing virtual class Logger {
    
    public String className { get; set; }
    public String methodName { get; set; }
    public String details { get; set; }
    public Datetime endTime { get; set; }
    public Logger.EventType eventType { get; set; }
    public String lineNumber { get; set; }
    public String requestBody { get; set; }
    public String requestHeaders { get; set; }
    public String requestUrl { get; set; }
    public String responseBody { get; set; }
    public String responseHeaders { get; set; }
    public String responseUrl { get; set; }
    public String stackTrace { get; set; }
    public Datetime startTime { get; set; }
    public Logger.Type type { get; set; }

    public enum EventType {
        ERROR,
        INFO,
        WARRING
    }

    public enum Type {
        APEX,
        BATCH,
        HTTP,
        LWC
    }
    
    public Logger() {
        this.details = '';
        this.startTime = System.now();
    }

    public Log__c end() {
        this.endTime = System.now();
        return this.saveLogger();
    }

    public void writeToDetails(String pText, String pObject) {
        this.details += pText + '\n' + pObject + '\n\n';
    }

    public Log__c saveLogger() {
        Log__c log = new Log__c(
            Class_Name__c = this.className,
            Method_Name__c = this.methodName,
            Details__c = this.details,
            End_Time__c = this.endTime,
            Event_Type__c = (this.eventType != null) ? this.eventType.name() : Logger.EventType.INFO.name(),
            Line_Number__c = lineNumber,
            Request_Body__c = this.requestBody,
            Request_Headers__c = this.requestHeaders,
            Request_Url__c = this.requestUrl,
            Response_Body__c = this.responseBody,
            Response_Headers__c = this.responseHeaders,
            Response_Url__c = this.responseUrl,
            Stack_Trace__c = this.stackTrace,
            Start_Time__c = this.startTime,
            Type__c = this.type.name()
        );

        return log;
    }

    /**
     * @description pass the string version of the object into the future!
     * @param {String} pJsonLog the json version of this object
     * @return void
     */
    @future
    public static void saveInTheFuture(String pJsonLog) {
        try {
            Logger log = (Logger)JSON.deserialize(pJsonLog, Logger.class);
            insert log.end();
        } catch(Exception e) {
            System.debug('Logger.saveInTheFuture ' + e.getMessage());
        }
    }
}
