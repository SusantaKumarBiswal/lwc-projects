public class AccountTriggerHelper {
  //Here we will write re-usable Methods:
  //Just like in my req I have to use same code in handleBeforeInsert and handleBeforeupdate
  
    public static void updateAccountShippingAdress(List<Account> accountList){
        
        
       for(Account acc : accountList){
            acc.Industry = 'Education';
            if(acc.Description == null){
                acc.Description = 'Account Industry was blank';
            }
                
                /*
Develop an Apex Trigger so that every time when any account
is created or updated then
Set the Value of the Billing Address to Shipping Address.
ShippingStreet
ShippingCity
ShippingState
ShippingPostalCode
ShippingCountry
*/   
                
                if(acc.ShippingStreet == null ||
                   acc.ShippingCity == null ||
                   acc.ShippingState ==null ||
                   acc.ShippingPostalCode == null ||
                   acc.ShippingCountry == null){ 
                       
                       acc.ShippingStreet = acc.BillingStreet;
                       acc.ShippingCity = acc.BillingCity;
                       acc.ShippingState = acc.BillingState;
                       acc.ShippingPostalCode = acc.BillingPostalCode;
                       acc.ShippingCountry = acc.BillingCountry;
                       
                   }
                
            }
    }
    
    
    public Static Void checkDuplicateAccount(List<Account> newRecords){
        /*
         * The business got to know that there are multiple accounts with the same name
          and rating. Now, as a developer, you need to make sure that no new duplicates
          are being created with the same name and rating.
         * 
         * 
         */
        
            List<String> accountNameList = new List<String>();
            List<String> accountRatingList = new List<String>();
            
            for( Account acc :  newRecords){
                accountNameList.add(acc.Name);
                accountRatingList.add(acc.Rating);
            }
            List<Account> existingAccountList = [SELECT Id, Name
                                     FROM Account 
                                     WHERE Name IN: accountNameList AND Rating IN: accountRatingList
                                     AND Id NOT IN :newRecords
                                     LIMIT 50000
                                     ];
            
        
        
           for(Account acc : newRecords){ // Id is not generated in case of before Insert
            System.debug(acc.Name);
            System.debug(acc.Rating);
            
            if(existingAccountList != null && existingAccountList.size()>0){
                acc.addError('Duplicate account already exists with same name and rating!');
                acc.Name.addError('Duplicate account already exists with same name and rating!');
                acc.Rating.addError('Duplicate account already exists with same name and rating!');
                
            }
            
        }
    }
}