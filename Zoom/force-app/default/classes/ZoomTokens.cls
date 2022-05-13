public with sharing class ZoomTokens {
    private String clientId = 'H8VbNvwQMJ_1MRSLdhcRjCQSsOfhNui2A';
    private String urlGetTokens = 'https://zoom.us/oauth/token?code=' + clientId + '&grant_type=authorization_code&redirect_uri=https://google.com/';
    public String refreshToken {get; private set;}
    public String actualToken {get; private set;}
    public HttpResponse responseHttp {get; private set;}
    public String urlRefreshTokens {get; private set;}
    public ZoomClientTokens__c ZoomClientTokens {get; private set;}
    

    public ZoomClientTokens__c getTokens(ZoomClientTokens__c zt){
        sendHttp(urlGetTokens);
        setZoomTokens();
        setZoomClientTokens(zt);
        return ZoomClientTokens;
    }

    public ZoomClientTokens__c refreshTokens(ZoomClientTokens__c zt){
        updateRefreshUrl(zt);
        sendHttp(urlRefreshTokens);
        setZoomTokens();
        setZoomClientTokens(zt);
        return ZoomClientTokens;
    }
    
    private void sendHttp(String url) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('POST');
        request.setHeader('Authorization','Basic SjFOdkdXTDJRNUM1NTdwV1F1NktaUTphcXM4dUNyOE5BdW8wSjdNbXNBTm1QaHB1T2pyRXBpdg==');
        request.setHeader('Host','net.tutsplus.com');
        request.setHeader('Content-Type','application/x-www-form-urlencoded');
        HttpResponse response = http.send(request);
        system.debug(response.getBody());
        this.responseHttp = response;
    }

    private void setZoomTokens(){
        Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(responseHttp.getBody());
        this.actualToken = String.valueof(results.get('access_token'));
        this.refreshToken = String.valueof(results.get('refresh_token'));
    }

    private void updateRefreshUrl(ZoomClientTokens__c zt){
        this.refreshToken = zt.RefreshToken1__c;
        this.urlRefreshTokens = 'https://zoom.us/oauth/token?grant_type=refresh_token&refresh_token=' + refreshToken;
    }

    private void setZoomClientTokens(ZoomClientTokens__c zt){
        zt.RefreshToken1__c = this.refreshToken;
        zt.ActualToken1__c = this.actualToken;
        this.ZoomClientTokens = zt;
    }

}
