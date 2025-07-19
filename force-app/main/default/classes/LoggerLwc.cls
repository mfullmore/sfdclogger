/**
 * @description
 */
global with sharing class LoggerLwc extends Logger {
    global LoggerLwc() {
        super();
        this.type = Logger.Type.LWC;
    }
}
