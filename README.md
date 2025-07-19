# SFDC Logger

The idea of logging is not new and custom logging in salesforce is not new. There are lots of custom logging solutions so here is mine. If you want full logging and observibility you should look at https://pharos.ai/ but if you need a quick and dirty custom logger use sfdc logger.

## Example

```
LoggerHttp log = new LoggerHttp();
Http h = new Http();

HttpRequest req = new HttpRequest();
String reqBody = '{"data": "value"}';
req.setBody(reqBody);

String endpoint = 'https://some-cool-url-web-service/awesome/resource';
req.setEndpoint(endpoint);
req.setMethod('POST');


log.requestBody = reqBody;
log.requestUrl = endpoint;

HttpResponse res = h.send(req);
log.responseBody = res.getBody();
insert log.end();
```

## Managed Package

## Read All About It

- [Salesforce Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)
