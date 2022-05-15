package uts.isd.model.dao;

import uts.isd.model.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import uts.isd.controller.TestCreateUserManagementDB;
import uts.isd.model.*;

/* 
* DBManager is the primary DAO class to interact with the database. 
* Complete the existing methods of this classes to perform CRUD operations with the db.
 */
public class UserManagementDAO {

    private Statement st;
    private Statement deleteSt;
    private String deleteQuery = "DELETE FROM USERS WHERE ID = ?";

    public UserManagementDAO(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

//Find user by email and password in the database   
    public User findUser(String email, String password) throws SQLException {
        try {
            ResultSet rs = st.executeQuery("SELECT * FROM USERS WHERE email = '" + email + "' AND password = '" + password + "'");

            while (rs.next()) {
                int ID = Integer.parseInt(rs.getString(1));
                String firstName = rs.getString(4);
                String lastName = rs.getString(3);
                String phoneNo = rs.getString(6);
                boolean isStaff = Boolean.parseBoolean(rs.getString(7));
                System.out.println(ID + " " + firstName + " " + lastName + " " + phoneNo + " " + isStaff);
                User user = new User(ID, firstName, lastName, email, phoneNo, password, isStaff);
                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserManagementDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<User> fetchUsers() throws SQLException {
        String fetch = "SELECT * FROM USERS";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<User> users = new ArrayList();

        while (rs.next()) {
            int ID = Integer.parseInt(rs.getString(1));
            String email = rs.getString(2);
            String firstName = rs.getString(4);
            String lastName = rs.getString(3);
            String password = rs.getString(5);
            String phoneNo = rs.getString(6);
            boolean isStaff = Boolean.parseBoolean(rs.getString(7));
            users.add(new User(ID, email, firstName, lastName, password, phoneNo, isStaff));
        }
        return users;
    }

    public void addLog(int id, String description) throws SQLException {
        st.executeUpdate("INSERT INTO log (userid, description) VALUES(" + id + ",'" + description + "')");

    }

//Add a user-data into the database   
    public void addUser(String email, String fname, String lname, String password, String phone, boolean isStaff) throws SQLException {                   //code for add-operation       
        st.executeUpdate("INSERT INTO USERS (email, firstname,lastname, password, phone, isstaff) VALUES('" + email + "','" + fname + "','" + lname + "','" + password + "','" + phone + "'," + isStaff + ")");
    }

//update a user details in the database   
    public void updateUser(String email, String fname, String lname, String password, String phone, int isstaff) throws SQLException {
        st.executeUpdate("UPDATE USERS SET firstname = '" + fname + "', lastname = '" + lname + "', password = '" + password + "', phone = '" + phone + "', isstaff = " + isstaff + " WHERE email ='" + email + "'");
    }

//delete a user from the database   
    public void deleteUserByEmail(String email) throws SQLException {
        st.executeUpdate("DELETE FROM  USERS WHERE email = '" + email + "'");
    }

    public void deleteUserByID(int id) throws SQLException {
        try {
            st.executeUpdate("DELETE FROM USERS WHERE id = " + id);
        } catch (Exception x) {
            System.out.println("ayo not working yo");
        }
    }
}
