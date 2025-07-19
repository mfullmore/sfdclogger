/**
 * @description
 */
public with sharing class LoggerBatch extends Logger {
    public LoggerBatch() {
        super();
        this.type = Logger.Type.BATCH;
    }
}
