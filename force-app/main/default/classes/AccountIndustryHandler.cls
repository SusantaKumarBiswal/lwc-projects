public class AccountIndustryHandler {
    
    Public static void handleBeforeInsert(){
        List<Account> accountList = (List<Account>)Trigger.New;
            for(Account acc : accountList){
                acc.Industry ='Education';
                if(acc.Description == null){
                    acc.Description= 'Account Description is Null';
                }
                acc.BillingStreet = acc.ShippingStreet;
                acc.BillingState = acc.ShippingState;
                acc.BillingCity = acc.ShippingCity;
                acc.BillingCountry = acc.ShippingCountry;
                acc.BillingPostalCode = acc.ShippingPostalCode;
            }

    }
    
    Public static void handleBeforeUpdate(){
        List<Account> accountList = (List<Account>)Trigger.New;
            for(Account acc : accountList){ 
                acc.BillingStreet = acc.ShippingStreet;
                acc.BillingState = acc.ShippingState;
                acc.BillingCity = acc.ShippingCity;
                acc.BillingCountry = acc.ShippingCountry;
                acc.BillingPostalCode = acc.ShippingPostalCode;
            }
        
    }
    
    Public static void handleAfterinsert(){
        List<Account> accountList = (List<Account>)Trigger.New;
        List<Task> taskList = new list<Task>();
        for(Account acc : accountList){
            Task taskRecord = new Task();
            taskRecord.Subject = 'Created From Apex Trigger';
            taskRecord.Description = 'Created From Apex Trigger';
            taskRecord.Status = 'Not Started';
            taskrecord.Priority = 'High';
            taskRecord.ActivityDate = System.today().addDays(7);
            taskrecord.WhatId = acc.Id;
            taskRecord.OwnerId = acc.OwnerId;
            taskList.add(taskRecord);
        }
        Insert taskList; 
        
    }

}