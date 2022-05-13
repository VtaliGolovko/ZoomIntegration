import { LightningElement, track, api } from 'lwc';

export default class Zoom extends LightningElement {
    isModalOpen = false;
    checkboxValue = "";
    hostValue = "1";
    participantValue = "3";
    topic = "";
    description = "";
    addDiscriptionValue = false;
    hideValue = false;
    hideLabel = "Show add";
    durationMin = "";
    durationHour = "";
    GMTValue = "";
    Date;
    Time;

    openModal() {
        this.isModalOpen = true;
    }
    closeModal() {
        this.isModalOpen = false;
    }
    submitDetails() {
        this.isModalOpen = false;
    }

    handleTopic(event) {
        this.topic = event.detail.value;
    }

    handleDiscription(event) {
        this.addDiscriptionValue = true;
    }

    handleHide(event) {
        if(this.hideValue==false){
            this.hideLabel = "Hide";
            this.hideValue = true;
        }else{
            this.hideLabel = "Show add";
            this.hideValue = false;
        }
    }


    handleDescription(event) {
        this.description = event.detail.value;
    }

    handleDate(event) {
        this.Date = event.detail.value;
    }

    handleTime(event) {
        this.Time = event.detail.value;
    }

    handleDurationHour(event) {
        this.durationHour = event.detail.value;
    }

    handleDurationMin(event) {
        this.durationMin = event.detail.value;
    }

    handleGMT(event) {
        this.GMTValue = event.detail.value;
    }

    handleHost(event) {
        this.hostValue = event.detail.value;
    }

    handleParticipant(event) {
        this.participantValue = event.detail.value;
    }

    handleCheckbox(e) {
        this.checkboxValue = e.detail.value;
    }

    get options() {
        return [
            { label: '1', value: '1' },
            { label: '2', value: '2' },
        ];
    }
    

    get GMToptions() {
        return [
            { label: 'GMT+0', value: '0' },
            { label: 'GMT+1', value: '1' },
            { label: 'GMT+2', value: '2' },
            { label: 'GMT+3', value: '3' },
            { label: 'GMT+4', value: '4' },
            { label: 'GMT+5', value: '5' },
            { label: 'GMT+6', value: '6' },
            { label: 'GMT+7', value: '7' },
            { label: 'GMT+8', value: '8' },
            { label: 'GMT+9', value: '9' },
            { label: 'GMT+10', value: '10' },
            { label: 'GMT+11', value: '11' },
            { label: 'GMT+12', value: '12' },
            { label: 'GMT+13', value: '13' },
            { label: 'GMT+14', value: '14' },
            { label: 'GMT+15', value: '15' },
            { label: 'GMT+16', value: '16' },
            { label: 'GMT+17', value: '17' },
            { label: 'GMT+18', value: '18' },
            { label: 'GMT+19', value: '19' },
            { label: 'GMT+20', value: '20' },
            { label: 'GMT+21', value: '21' },
            { label: 'GMT+22', value: '22' },
            { label: 'GMT+23', value: '23' },
        ];
    }

    get DurationHourOptions() {
        return [
            { label: '1', value: '1' },
            { label: '2', value: '2' },
            { label: '3', value: '3' },
            { label: '4', value: '4' },
            { label: '5', value: '5' },
            { label: '6', value: '6' },
            { label: '7', value: '7' },
            { label: '8', value: '8' },
            
        ];
    }

    get DurationMinOptions() {
        return [
            { label: '0', value: '1' },
            { label: '15', value: '2' },
            { label: '30', value: '3' },
            { label: '45', value: '4' },
            
        ];
    }

    get Host_options() {
        return [
            { label: 'On', value: '1' },
            { label: 'Off', value: '2' },
        ];
    }

    get Participant_options() {
        return [
            { label: 'On', value: '3' },
            { label: 'Off', value: '4' },
        ];
    }

    get Checkbox_options() {
        return [
            { label: 'Allow participants to join anytime', value: 'option1' },
            { label: 'Mute participants upon entry', value: 'option2' },
            { label: 'Automatically record meeting on the local computer', value: 'option3' },
            { label: 'Approve or block entry to users from specific regions/countries', value: 'option4' },
        ];
    }

}