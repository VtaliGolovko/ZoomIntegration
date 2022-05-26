public class BatchGegerateTokens implements Database.batchable<sObject>, Database.AllowsCallouts, Database.stateful{
    List<Zoom_Account_Configuration__c> ZoomAccountConfigurationList;
    List<Zoom_Account_Configuration__c> ZoomAccountWithTokensList = new  List<Zoom_Account_Configuration__c>();
    
    public BatchGegerateTokens(List<Zoom_Account_Configuration__c> ZoomAccountConfigurationList) {
        this.ZoomAccountConfigurationList = ZoomAccountConfigurationList;
    }

    public Database.QueryLocator start(Database.BatchableContext BC){ 
        return Database.getQueryLocator([SELECT Client_Id__c, Client_secret__c, Code__c, Redirect_URI__c, Access_token__c, Refresh_token__c FROM Zoom_Account_Configuration__c WHERE Id IN: ZoomAccountConfigurationList]);
    }  

    public void execute(Database.BatchableContext BC, List<Zoom_Account_Configuration__c> selectedZoomAccountConfigurationList){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        for(Zoom_Account_Configuration__c ZoomAccountConfiguration : selectedZoomAccountConfigurationList) {
            request.setEndpoint('https://zoom.us/oauth/token');
            request.setMethod('POST');
            Blob headerValue = Blob.valueOf(ZoomAccountConfiguration.Client_Id__c + ':' + ZoomAccountConfiguration.Client_secret__c);
            String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
            request.setHeader('Authorization', authorizationHeader);
            request.setHeader('Content-Type', 'application/x-www-form-urlencoded');
            
            String payload = 'code='+ZoomAccountConfiguration.Code__c+
            '&grant_type=authorization_code'+
            '&redirect_uri='+ZoomAccountConfiguration.Redirect_URI__c;

            request.setBody(payload);

            HTTPResponse response = http.send(request);
            Map<String, Object> responseMap = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            String accessToken = (String) responseMap.get('access_token');
            String refreshToken = (String) responseMap.get('refresh_token');

            ZoomAccountConfiguration.Access_token__c = accessToken;
            ZoomAccountConfiguration.Refresh_token__c = refreshToken;

            ZoomAccountWithTokensList.add(ZoomAccountConfiguration);
        }
    } 

    public void finish(Database.BatchableContext BC) {  
        update ZoomAccountWithTokensList;   
    } 
}