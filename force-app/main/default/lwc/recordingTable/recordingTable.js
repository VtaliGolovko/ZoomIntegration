import { LightningElement, track } from 'lwc';

export default class RecordingTable extends LightningElement {

    @track value;
    @track dateValue;

    get options() {
        return [
            { label: 'Account1', value: 'Account1' },
            { label: 'Account2', value: 'Account2' },
            { label: 'Account3', value: 'Account3' },
        ];
    }

    accountChange(event) {
        this.value = event.detail.value;
    }

    dateChange(event) {
        this.dateValue = event.detail.value;
    }

}