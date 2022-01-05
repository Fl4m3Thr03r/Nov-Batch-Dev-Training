public class UpdateContact implements Database.Batchable<sObject>{
    
    public Database.QueryLocator start(Database.BatchableContext bc)
    {
        string query = 'select Id,Title,Account.Id,Account.Name,Account.Description From Contact';
        return Database.getQueryLocator(query);
    }
	public void execute(Database.BatchableContext bc, List<Contact> contacts)
    {
        for(Contact con: contacts)
        {
            if(con.Account.Id != null)
            {
                con.Description = con.Title + ' of ' + con.Account.Name + ' : '+con.Account.Description;
            }
            update contacts;
        }
    }
    public void finish(Database.BatchableContext bc)
    {
        
    }
    
}
