public with sharing class ZoomGeneratorQueueable implements Queueable, Database.AllowsCallouts {
    private List<Zoom_Account_Configuration__c> configList;
    private List<Zoom_Account_Configuration__c> configForUpdateList = new List<Zoom_Account_Configuration__c>();

    public ZoomGeneratorQueueable(List<Zoom_Account_Configuration__c> configList) {
        this.configList = configList;
    }

    public void execute(QueueableContext context) {
        List<Zoom_Account_Configuration__c> zoomAccountList = [SELECT Client_Id__c, Client_secret__c, Code__c, Redirect_URI__c, Access_token__c, Refresh_token__c FROM Zoom_Account_Configuration__c WHERE Id IN: configList];
        for(Zoom_Account_Configuration__c config: zoomAccountList){
            ZoomTokenGenerator generator = new ZoomTokenGenerator(config);
            generator.generateTokens();
            configForUpdateList.add(generator.config);
        }
        update configForUpdateList;
    }
}
