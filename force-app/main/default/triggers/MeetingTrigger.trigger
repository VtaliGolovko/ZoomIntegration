trigger MeetingTrigger on Meeting__c (after insert) {
    
    for(Meeting__c z: trigger.new){
        ZoomMeetingWrapper zzz = new ZoomMeetingWrapper(z);
        system.debug(JSON.serialize(zzz));
    }
}