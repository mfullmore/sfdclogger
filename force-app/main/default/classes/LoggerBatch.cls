/**
 * @description
 */
global with sharing class LoggerBatch extends Logger {
    global LoggerBatch() {
        super();
        this.type = Logger.Type.BATCH;
    }
}
