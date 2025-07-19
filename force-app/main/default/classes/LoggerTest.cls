@isTest
private class LoggerTest {
    
    @isTest
    static void testLogger() {
        Logger log = new Logger();
        log.className = 'Test class name';
        log.writeToDetails('Info', 'More info about log');
        log.eventType = Logger.EventType.INFO;
        log.lineNumber = '2';
        log.methodName = 'Test method name';
        log.requestBody = '{test body}';
        log.requestHeaders = '{token: test}';
        log.requestUrl = 'http://clowntown.com';
        log.responseBody = '{response test body}';
        log.responseHeaders = '{response: test}';
        log.responseUrl = 'http://clowntown/response';
        log.stackTrace = 'test stack';
        log.type = Logger.Type.APEX;

        log.end();

        Log__c logObj = log.saveLogger();
        System.assert(logObj.Class_Name__c == 'Test class name', 'Failure: class name was wrong');
        System.assert(logObj.Details__c == 'Info\nMore info about log\n\n', 'Failure: details were wrong');
        System.assert(logObj.End_Time__c != null, 'Failure: end time was not set');
        System.assert(logObj.Event_Type__c == 'INFO', 'Failure: event type was wrong');
        System.assert(logObj.Line_Number__c == '2', 'Failure: line number was wrong');
        System.assert(logObj.Method_Name__c == 'Test method name', 'Failure: method name was wrong');
        System.assert(logObj.Request_Body__c == '{test body}', 'Failure: request body was wrong');
        System.assert(logObj.Request_Headers__c == '{token: test}', 'request headers were wrong');
        System.assert(logObj.Request_Url__c == 'http://clowntown.com', 'Failure: request url was wrong');
        System.assert(logObj.Response_Body__c == '{response test body}', 'Failure: response body was wrong');
        System.assert(logObj.Response_Headers__c == '{response: test}', 'Failure: response headers were wrong');
        System.assert(logObj.Response_Url__c == 'http://clowntown/response', 'Failure: response url was wrong');
        System.assert(logObj.Stack_Trace__c == 'test stack', 'Failure: stack trace was wrong');
        System.assert(logObj.Start_Time__c != null, 'Failure: start time was not set');
        System.assert(logObj.Type__c == 'APEX', 'Failure: type was wrong');

        insert logObj;
        System.assert(logObj.Id != null, 'Failure: log object was not inserted');
    }

    @isTest
    static void testLoggerApex() {
        LoggerApex log = new LoggerApex();
        System.assert(log.type == Logger.Type.APEX, 'Failure: Apex log type was not set');
    }

    @isTest
    static void testLoggerBatch() {
        LoggerBatch log = new LoggerBatch();
        System.assert(log.type == Logger.Type.BATCH, 'Failure: Batch log type was not set');
    }

    @isTest
    static void testLoggerHttp() {
        LoggerHttp log = new LoggerHttp();
        System.assert(log.type == Logger.Type.HTTP, 'Failure: Http log type was not set');
    }

    @isTest
    static void testLoggLwc() {
        LoggerLwc log = new LoggerLwc();
        System.assert(log.type == Logger.Type.LWC, 'Failure: Lwc log type was not set');
    }

    @isTest
    static void testLoggerFuture() {
        Logger log = new Logger();
        log.className = 'At future';
        log.writeToDetails('Info', 'More info about log');
        log.eventType = Logger.EventType.INFO;
        log.lineNumber = '2';
        log.methodName = 'Test method name';
        log.requestBody = '{test body}';
        log.requestHeaders = '{token: test}';
        log.requestUrl = 'http://clowntown.com';
        log.responseBody = '{response test body}';
        log.responseHeaders = '{response: test}';
        log.responseUrl = 'http://clowntown/response';
        log.stackTrace = 'test stack';
        log.type = Logger.Type.APEX;

        log.end();

        Test.startTest();
        Logger.saveInTheFuture(JSON.serialize(log));
        Test.stopTest();

        Log__c queriedLog = [select Id, Class_Name__c from Log__c limit 1];
        System.assert(queriedLog.Class_Name__c == 'At future', 'Failed to save from the future');
    }
}
