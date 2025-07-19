/**
 * @description
 */
global with sharing class LoggerApex extends Logger {
    global LoggerApex() {
        super();
        this.type = Logger.Type.APEX;
    }
}
