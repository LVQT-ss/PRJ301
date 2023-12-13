/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.dto;

/**
 *
 * @author Final stage
 */
public class Account {
    String userId;
    String fullName;
    String password;
    String roleID;
    boolean status; 

    public Account(String userId, String fullName, String password, String roleID, boolean status) {
        this.userId = userId;
        this.fullName = fullName;
        this.password = password;
        this.roleID = roleID;
        this.status = status;
    }

    public Account() {
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

   
 
}
