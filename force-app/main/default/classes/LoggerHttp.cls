/**
 * @description
 */
public with sharing class LoggerHttp extends Logger {
    public LoggerHttp() {
        super();
        this.type = Logger.Type.HTTP;
    }
}
