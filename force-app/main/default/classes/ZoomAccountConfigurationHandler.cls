public class ZoomAccountConfigurationHandler {
    
    public static void afterUpdateHandler(List<Zoom_Account_Configuration__c> ZoomAccountConfigurationNewList, Map<Id, Zoom_Account_Configuration__c> ZoomAccountConfigurationOldMap) {
        
        List<Zoom_Account_Configuration__c> ZoomAccountConfigurationList = new List<Zoom_Account_Configuration__c>();
        
        for(Zoom_Account_Configuration__c ZoomAccountConfiguration : ZoomAccountConfigurationNewList) {
            if(ZoomAccountConfiguration.Code__c != ZoomAccountConfigurationOldMap.get(ZoomAccountConfiguration.Id).Code__c){
                ZoomAccountConfigurationList.add(ZoomAccountConfiguration);
            }
        }
        
        ZoomGeneratorQueueable updateJob = new ZoomGeneratorQueueable(ZoomAccountConfigurationList);
        ID jobID = System.enqueueJob(updateJob);
    }

    public static void afterInsertHandler(List<Zoom_Account_Configuration__c> ZoomAccountConfigurationNewList) {
        ZoomGeneratorQueueable updateJob = new ZoomGeneratorQueueable(ZoomAccountConfigurationNewList);
        ID jobID = System.enqueueJob(updateJob);
    }
}