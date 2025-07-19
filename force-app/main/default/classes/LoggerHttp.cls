/**
 * @description
 */
global with sharing class LoggerHttp extends Logger {
    global LoggerHttp() {
        super();
        this.type = Logger.Type.HTTP;
    }
}
