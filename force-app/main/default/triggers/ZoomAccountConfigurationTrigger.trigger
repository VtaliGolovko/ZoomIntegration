trigger ZoomAccountConfigurationTrigger on Zoom_Account_Configuration__c (before insert, before update) {
    if(Trigger.isBefore && Trigger.isUpdate){
        ZoomAccountConfigurationHandler.afterUpdateHandler(Trigger.new, Trigger.oldMap);
    }

    if(Trigger.isBefore && Trigger.isInsert) {
        ZoomAccountConfigurationHandler.afterInsertHandler(Trigger.new);
    }
}