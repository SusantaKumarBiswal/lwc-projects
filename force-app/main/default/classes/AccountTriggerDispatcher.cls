public class AccountTriggerDispatcher {
    
    //Trigger.OperationType
    // AFTER_INSERT,BEFORE_INSERT, AFTER_UPDATE, BEFORE_UPDATE, AFTER_DELETE, BEFORE_DELETE
    // 
    // System.Triggeroperation ~= Trigger.OperationType
    // AFTER_INSERT,BEFORE_INSERT, AFTER_UPDATE, BEFORE_UPDATE, AFTER_DELETE, BEFORE_DELETE
    
    public static void dispatch(System.TriggerOperation operationtype){
        
        switch on operationtype{
            WHEN BEFORE_INSERT{
                AccountTriggerHandler.handleBeforeInsert(Trigger.New);
            }
            WHEN AFTER_INSERT{
                AccountTriggerHandler.handleAfterupdate(Trigger.New);
            }
            WHEN AFTER_UPDATE{
                
            }
            WHEN BEFORE_UPDATE{
                AccountTriggerHandler.handleBeforeupdate(Trigger.New);
            }
            WHEN AFTER_DELETE{
                
            }
            WHEN BEFORE_DELETE{
                
            }
            WHEN AFTER_UNDELETE{
                
            }
            WHEN ELSE{
                
            }
            
        }
        
    }
    
}