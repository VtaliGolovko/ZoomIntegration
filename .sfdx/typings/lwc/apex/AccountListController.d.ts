declare module "@salesforce/apex/AccountListController.getAccounts" {
  export default function getAccounts(): Promise<any>;
}
declare module "@salesforce/apex/AccountListController.getContacts" {
  export default function getContacts(param: {accountId: any}): Promise<any>;
}
