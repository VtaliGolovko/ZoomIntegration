public with sharing class ZoomTokens {
    private String clientId = 'S87JI129RJ_1MRSLdhcRjCQSsOfhNui2A';
    private String urlGetTokens = 'https://zoom.us/oauth/token?code=' + clientId + '&grant_type=authorization_code&redirect_uri=https://google.com/';
    public String refreshToken {get; private set;}
    public String actualToken {get; private set;}
    public HttpResponse responseHttp {get; private set;}
    public String urlRefreshTokens {get; private set;}
    

    public void getTokens(){
        sendHttp(urlGetTokens);
        setZoomTokens();
        system.debug('1 actualToken ' + actualToken);
        system.debug('2 refreshToken ' + refreshToken);
    }

    public void refreshTokens(){
        sendHttp(urlRefreshTokens);
        system.debug(urlRefreshTokens);
        setZoomTokens();
        system.debug('actualToken ' + actualToken);
        system.debug('refreshToken ' + refreshToken);
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
        if(responseHttp.getStatusCode() != 201){
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(responseHttp.getBody());
            this.actualToken = String.valueof(results.get('access_token'));
            this.refreshToken = String.valueof(results.get('refresh_token'));
            updateRefreshUrl();
        }
    }

    private void updateRefreshUrl(){
        this.urlRefreshTokens = 'https://zoom.us/oauth/token?grant_type=refresh_token&refresh_token=' + refreshToken;
    }

}
