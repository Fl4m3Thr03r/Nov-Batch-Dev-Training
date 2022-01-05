public class UserTriggerHandler {
    
    @future
    Public static void assignPermset(Set<Id> userId)
    {
        Permissionset permset = [select Id,Name from Permissionset where Name = 'Marketing_User_Permisions' LIMIT 1];
        
        List<PermissionSetAssignment> newPerm = new list<PermissionSetAssignment>();
        for(Id ouser: userId)
        {
        	PermissionSetAssignment oPermassign = new PermissionSetAssignment();
        	oPermassign.PermissionSetId = permset.id;
        	oPermassign.AssigneeId = ouser;
        	newPerm.add(oPermassign);
    
        }
        if(newPerm != null)
        {
            insert newPerm;
        }
	}
}
