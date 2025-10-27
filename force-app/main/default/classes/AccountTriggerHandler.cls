public class AccountTriggerHandler {
    // before insert
    public static void handleBeforeInsert(List<Account> accountList){
        AccountTriggerHelper.updateAccountShippingAdress(accountList);
        AccountTriggerHelper.checkDuplicateAccount(accountList);
        
    }
    
    // before update
    public static void handleBeforeupdate(List<Account> accountList){
        AccountTriggerHelper.updateAccountShippingAdress(accountList);
        AccountTriggerHelper.checkDuplicateAccount(accountList);
    }
    
    // After insert
    public static void handleAfterInsert(List<Account> accountListRecord){
        
                
/*
When the Account is Created,
Create a Task Record under that Account and assign the Task to the
Account Owner.
Use the below information
* Subject - Created from Apex Trigger
* Description - Created from Apex Trigger
* Due Date - Today's Date + 7
* Status - Not Started
* Priority - High
* OwnerId - Account OwnerId
* WhatId - Account.Id
*/
        /* Sub-Problems */
        // 1. Check if the code is running after insert
        // Do not make any DML within for loop ( LIMIT - 150 ~ 151 )
        // Do not make any SOQL within for loop ( LIMIT - 100 ~ 101 )
        // 
        
        List<Task> insertingTaskRecords = new List<Task>();
        
        for(Account acc : accountListRecord){
            Task t = new Task();
            t.Subject = 'Created form Apex Trigger';
            t.Description = 'Created form Apex Trigger';
            t.Status = 'Not Started';
            t.Priority = 'High';
            t.ActivityDate = System.today().addDays(7);
            t.WhatId = acc.Id;
            t.OwnerId = acc.OwnerId;
            insertingTaskRecords.add(t);            
        }
        insert insertingTaskRecords;
        
    }
    
    // After Update
    public static void handleAfterupdate(List<Account> accountList){
        
    }

}