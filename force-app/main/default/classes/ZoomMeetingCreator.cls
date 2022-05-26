public with sharing class ZoomMeetingCreator {
    private String accessToken;
    private String authorizationHeader;
    private ZoomTokenGenerator generator;
    private ZoomMeetingWrapper meetingWrapper;

    public ZoomMeetingCreator(Zoom_Account_Configuration__c config, Meeting__c meeting){
        this.generator = new ZoomTokenGenerator(config);
        this.meetingWrapper = new ZoomMeetingWrapper(meeting);
    }
    
    public void createMeeting(){
        getAccessToken();
        setAccessToken();
        setAuthorizationHeader();
        sendHttpForMeeting();
    }

    private void sendHttpForMeeting(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.zoom.us/v2/users/me/meetings');
        request.setMethod('POST');
        request.setHeader('Authorization', authorizationHeader);
        request.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        request.setBody(JSON.serialize(meetingWrapper));
    }

    private void getAccessToken(){
        generator.refreshTokens();
    }

    private void setAccessToken(){
        this.accessToken = generator.config.Access_token__c;
    }

    private void setAuthorizationHeader(){
        this.authorizationHeader = generator.authorizationHeader;
    }

}
