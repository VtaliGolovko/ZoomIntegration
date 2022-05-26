public with sharing class ZoomMeetingCreatorQueueable implements Queueable, Database.AllowsCallouts {
    public List<Meeting__c> meetings;

    public ZoomMeetingCreatorQueueable(List<Meeting__c> meetings) {
        this.meetings = meetings;
    }

    public void execute(QueueableContext context) {

    }
}
