package models;

import java.io.Serializable;

public class Role implements Serializable {
    
    int roleID;
    String roleName;

    public Role (){
        
    }
    
    public Role(int roleID) {
        this.roleID = roleID;
        if(roleID==1){
            this.roleName="system admin";
        }
        else{
            this.roleName="regular user";
        }
    }
    
    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
    
    
}
