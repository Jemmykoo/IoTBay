package uts.isd.model.dao;

import uts.isd.model.User;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/* 
* DBManager is the primary DAO class to interact with the database. 
* Complete the existing methods of this classes to perform CRUD operations with the db.
 */
public class DBManager {

    private Statement st;

    public DBManager(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

//Find user by email and password in the database   
    public User findUser(String email, String password) throws SQLException {
        try {
            ResultSet rs = st.executeQuery("SELECT * FROM USERS WHERE email = '" + email + "' AND password = '" + password + "'");

            while (rs.next()) {
                int ID = Integer.parseInt(rs.getString(1));
                String firstName = rs.getString(3);
                String lastName = rs.getString(4);
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

//Add a user-data into the database   
    public void addUser(String email, String fname, String lname, String password, String phone, boolean isStaff) throws SQLException {                   //code for add-operation       
        st.executeUpdate("INSERT INTO USERS (email, firstname,lastname, password, phone, isstaff) VALUES('" + email + "','" + fname + "','" + lname + "','" + password + "','" + phone + "'," + isStaff + ")");
    }

}
