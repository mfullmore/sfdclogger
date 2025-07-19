/**
 * @description
 */
public with sharing class LoggerApex extends Logger {
    public LoggerApex() {
        super();
        this.type = Logger.Type.APEX;
    }
}
