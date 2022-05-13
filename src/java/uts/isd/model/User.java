/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.model;

/**
 *
 * @author super
 */
public class User {
    protected int id;
    private String firstName;
    private String lastName;
    private String email;
    private String phone;
    private String password;
    private boolean isStaff = false;

    public User() {}

    public User(String firstName,String lastName, String email, String phoneNo, String password) {
        super();
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phoneNo;
        this.password = password;

    }
    
    public User(String firstName,String lastName, String email, String phoneNo, String password, boolean isStaff) {
        super();
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phoneNo;
        this.password = password;
        this.isStaff = isStaff;
    }
    
    public User(int id,String firstName,String lastName, String email, String phoneNo, String password, boolean isStaff) {
        super();
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phoneNo;
        this.password = password;
        this.isStaff = isStaff;
    }
    
    public void addUser(String firstName,String lastName, String email, String phone, String password, boolean isStaff) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.isStaff = isStaff;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }


    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public boolean getIsStaff() {
        return isStaff;
    }
    
    public void setIsStaff(boolean isStaff) {
        this.isStaff = isStaff;
    }
}
