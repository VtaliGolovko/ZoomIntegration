public with sharing class ZoomTokenGenerator {
    public Zoom_Account_Configuration__c config {get; private set;}
    public String authorizationHeader {get; private set;}
    private String payload;
    private HTTPResponse response;

    public ZoomTokenGenerator(Zoom_Account_Configuration__c config){
        this.config = config;
    }
    
    public void generateTokens(){
        setPayloadForGenerateTokens();
        getAndSetTokens();
    }

    public void refreshTokens(){
        setPayloadForRefreshTokens();
        getAndSetTokens();    
    }

    private void getAndSetTokens(){
        setAuthorizationHeader();
        sendHttp();
        setTokens();
    }

    private void sendHttp(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://zoom.us/oauth/token');
        request.setMethod('POST');
        request.setHeader('Authorization', authorizationHeader);
        request.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        request.setBody(payload);
        this.response = http.send(request); 
    }

    private void setTokens(){
        Map<String, Object> responseMap = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        String accessToken = (String) responseMap.get('access_token');
        String refreshToken = (String) responseMap.get('refresh_token');
        this.config.Access_token__c = accessToken;
        this.config.Refresh_token__c = refreshToken;
    }

    private void setAuthorizationHeader(){
        Blob headerValue = Blob.valueOf(config.Client_Id__c + ':' + config.Client_secret__c);
        this.authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
    }

    private void setPayloadForGenerateTokens(){
        this.payload = 'code=' + config.Code__c + '&grant_type=authorization_code' + 
        '&redirect_uri=' + config.Redirect_URI__c;
    }

    private void setPayloadForRefreshTokens(){
        this.payload = 'grant_type=refresh_token'+ '&refresh_token=' + config.Refresh_token__c;
    }

}
