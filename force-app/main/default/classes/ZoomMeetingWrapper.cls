public with sharing class ZoomMeetingWrapper {
	public String topic;
	public String agenda;
	public String start_time;
	public String timezone;
	public Boolean join_before_host;
	public ZoomMeetingRecurrenceWrapper recurrence;
	public ZoomMeetingSettingsWrapper settings;

    public ZoomMeetingWrapper(Meeting__c meeting){
        this.topic = meeting.Name;
        this.agenda = meeting.Description__c;
        this.start_time = String.valueof(meeting.Start_Date__c) + String.valueof(meeting.Start_Time__c);
        this.timezone = meeting.Time_Zone__c;
        this.join_before_host = meeting.Allow_participants_to_join_anytime__c;
        ZoomMeetingSettingsWrapper settings = new ZoomMeetingSettingsWrapper(meeting);
        this.settings = settings;
        if(meeting.Recurrence__c != null){
            ZoomMeetingRecurrenceWrapper recurrence = new ZoomMeetingRecurrenceWrapper(meeting);
            this.recurrence = recurrence;
        }
    }

    private with sharing class ZoomMeetingSettingsWrapper {
        public Boolean host_video;
        public Integer registration_type;
        public Boolean participant_video;
        public Integer approval_type;

        public ZoomMeetingSettingsWrapper(Meeting__c meeting){
            if(meeting.Host_video__c!=null){
                this.host_video = Boolean.valueof(meeting.Host_video__c);
            }
            if(meeting.Registration_type__c!=null){
                this.registration_type = Integer.valueof(meeting.Registration_type__c);
            }
            if(meeting.Participant_video__c!=null){
                this.participant_video = Boolean.valueof(meeting.Participant_video__c);
            }
            if(meeting.Approval_type__c!=null){
                this.approval_type = Integer.valueof(meeting.Approval_type__c);
            }
        }
    }

    private with sharing class ZoomMeetingRecurrenceWrapper {
        public String end_date_time;
        public Integer end_times;
        public Integer monthly_day;
        public Integer monthly_week;
        public Integer monthly_week_day;
        public Integer repeat_interval;
        public Integer type;
        public String weekly_days;

        public ZoomMeetingRecurrenceWrapper(Meeting__c meeting){
            if(meeting.End_times__c!=null){
                this.end_times = Integer.valueof(meeting.End_times__c);
            }
            if(meeting.End_date_time__c!=null){
                this.end_date_time = String.valueof(meeting.End_date_time__c);
            }
            if(meeting.Monthly_day__c!=null){
                this.monthly_day = Integer.valueof(meeting.Monthly_day__c);
            }
            if(meeting.Monthly_week__c!=null){
                this.monthly_week_day = Integer.valueof(meeting.Monthly_week__c);
            }
            if(meeting.Repeat_every__c!=null){
                this.repeat_interval = Integer.valueof(meeting.Repeat_every__c);
            }
            if(meeting.Type__c!=null){
                this.type = Integer.valueof(meeting.Type__c);
            }
            if(meeting.Monthly_week_day__c!=null){
                this.weekly_days = meeting.Monthly_week_day__c;
            }
        }
    }
}
