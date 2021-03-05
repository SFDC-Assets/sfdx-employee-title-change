public class rcSetup_EmployeeTitleChange {
  
    static public void setup() {
        
        System.debug('rcSetup_EmployeeTitleChange > setup');
        
        String employeeName = 'Monica Edwards';
        String managerName = 'Bilbo Manager';
        List<String> names = new List<String>{employeeName, managerName};
            
        List<User> users = [SELECT Id, Name, FirstName, LastName, Title, Email FROM User WHERE Name in :names];
        System.debug('users: ' + users);
        
        Id recordTypeID = getPersonAccountRecordType();            
        User employee;
        Account employeeAccount;
        User manager;
        Account managerAccount;
        
        for (User user : users) {            
            if (user.Name == employeeName) {
                employee = user;
                employeeAccount = createAccount(recordTypeID, user);
            }           
            if (user.Name == managerName) {
                manager = user;
                managerAccount = createAccount(recordTypeID, user);
            }            
        }
        
        if (manager != null) {
        	employee.ManagerId = manager.Id;
        	update employee;
      		employeeAccount.Manager__c = managerAccount.Id;
        	update employeeAccount;
        }
        
        System.debug('rcSetup_EmployeeTitleChange > setup - employeeAccount: ' + employeeAccount);
        System.debug('rcSetup_EmployeeTitleChange > setup - managerAccount: ' + managerAccount);
        
        System.debug('rcSetup_EmployeeTitleChange > setup - complete');
        
    } // end setup

    static public Id getPersonAccountRecordType() {
        String recordTypeName = 'Person Account';
        Id recordTypeID = Schema.SObjectType.Account.getRecordTypeInfosByName().get(recordTypeName).getRecordTypeId();
        return recordTypeID;
    }
    
	static public Account createAccount(Id recordTypeID, User user) {
       
        Account account = new Account();
        account.RecordTypeId = recordTypeID;
        account.FirstName = user.FirstName;
        account.LastName = user.LastName;
        account.PersonTitle = user.Title;
        account.PersonEmail = user.Email;
        insert account;
        //System.debug('account created: ' + account);
        
        return account;
    }

    
}