import { LightningElement, api, wire, track } from "lwc";

import getAccounts from "@salesforce/apex/AccountListController.getAccounts";

const ACCOUNT_COLUMNS = [
    { fieldName: "Name", label: "Name" }
];

export default class AccountListTest extends LightningElement {
    @api apiName;
    @api listViewApiName;
    @track showTabTwo = false;

    columnsList = ACCOUNT_COLUMNS;
    
    @wire(getAccounts)
    wiredAccounts;

    handleRowSelection(event) {
        const itemSelected = new CustomEvent("itemselected", {
            detail: {
                recordId: event.detail.selectedRows[0].Id,
                accountName: event.detail.selectedRows[0].Name
            }
        });
        this.dispatchEvent(itemSelected);
    }
}