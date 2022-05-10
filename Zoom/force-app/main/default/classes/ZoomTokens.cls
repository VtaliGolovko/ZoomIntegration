public with sharing class ZoomTokens {
    private static String clientId = '73ok06SDBs_1MRSLdhcRjCQSsOfhNui2A';
    private static String url = 'https://zoom.us/oauth/token?code=' + clientId + '&grant_type=authorization_code&redirect_uri=https://google.com/';
    public static String actualToken {get; private set;}
    public static String refreshToken {get; private set;}
    
    private static HttpResponse getZoomTokens() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('POST');
        request.setHeader('Authorization','Basic SjFOdkdXTDJRNUM1NTdwV1F1NktaUTphcXM4dUNyOE5BdW8wSjdNbXNBTm1QaHB1T2pyRXBpdg==');
        request.setHeader('Host','net.tutsplus.com');
        request.setHeader('Content-Type','application/x-www-form-urlencoded');
        HttpResponse response = http.send(request);
        return respose;
    }

    public static void setZoomTokens(){
        HttpResponse response = getZoomTokens();
        if(response.getStatusCode() != 201){
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            actualToken = String.valueof(results.get('access_token'));
            refreshToken = String.valueof(results.get('refresh_token'));
        }
    }

}
