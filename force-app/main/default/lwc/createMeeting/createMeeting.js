import { LightningElement, track } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';


export default class CreateZoomMeeting extends NavigationMixin(LightningElement) {
    @track isRecurring = false;
    @track isDaily = true;
    @track isWeekly = false;
    @track isMonthly = false;

    isRecurringMeeting(event) {
        this.isRecurring = event.target.checked;
       
    }


    RecurringMeeting(event) {

        if (event.detail.value == "1") {
            this.isDaily = true;
            this.isWeekly = false;
            this.isMonthly = false;
        }
        else if (event.detail.value == "2") {
            this.isDaily = false;
            this.isWeekly = true;
            this.isMonthly = false;
        }
        else if (event.detail.value == "3") {
            this.isDaily = false;
            this.isWeekly = false;
            this.isMonthly = true;
        }

    }


}