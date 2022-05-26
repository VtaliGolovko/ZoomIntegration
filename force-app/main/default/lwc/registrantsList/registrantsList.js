import { LightningElement, track} from 'lwc';
const columns = [
    { label: 'Registrant', fieldName: 'Registrant' },
    { label: 'Email', fieldName: 'Email', type: 'email' },
    { label: 'Phone', fieldName: 'Phone', type: 'phone' },
    {
        type: "button",
        fixedWidth: 150,
        typeAttributes: {
            label: 'Approve',
            title: 'Approve',
            name: 'Approve',
            value: 'Approve',
            variant: 'success',
            class: 'scaled-down'
        }
    },
    {
        type: "button",
        fixedWidth: 150,
        typeAttributes: {
            label: 'Cancel',
            title: 'Cancel',
            name: 'Cancel',
            value: 'Cancel',
            variant: 'brand',
            class: 'scaled-down'
        }
    },
    {
        type: "button",
        fixedWidth: 150,
        typeAttributes: {
            label: 'Deny',
            title: 'Deny',
            name: 'Deny',
            value: 'Deny',
            variant: 'destructive',
            class: 'scaled-down'
        }
    }
];
export default class RegistrantsList extends LightningElement {
    data = [
        {"Registrant": "Registrant 1", "Email": "Test1@gmail.com", "Phone": 12345678},
        {"Registrant": "Registrant 2", "Email": "Test2@gmail.com", "Phone": 12345678},
        {"Registrant": "Registrant 3", "Email": "Test3@gmail.com", "Phone": 12345678},
        {"Registrant": "Registrant 4", "Email": "Test4@gmail.com", "Phone": 12345678},
    ];
    columns = columns;
    
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

    handleSectionToggle(event) {
        const openSections = event.detail.openSections;

        if (openSections.length === 0) {
            this.activeSectionsMessage = 'All sections are closed';
        } else {
            this.activeSectionsMessage =
                'Open sections: ' + openSections.join(', ');
        }
    }

}