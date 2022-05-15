package uts.isd.model.dao;

import uts.isd.model.User;
import java.sql.*;
import java.util.ArrayList;
import uts.isd.model.*;

/* 
* DBManager is the primary DAO class to interact with the database. 
* Complete the existing methods of this classes to perform CRUD operations with the db.
 */
public class DBManagerDavid {

    private Statement st;
    private Statement deleteSt;
    private String deleteQuery = "DELETE FROM USERS WHERE ID = ?";


    public DBManagerDavid(Connection conn) throws SQLException {
        st = conn.createStatement();
        deleteSt = conn.createStatement();
        
    }

//Find user by email and password in the database   
    public User findUser(String email, String password) throws SQLException {
        User user = new User();
        try {
            ResultSet rs = st.executeQuery("SELECT * FROM USERS WHERE email = '" + email + "' AND password = '" + password + "'");

            while (rs.next()) {
                user.setFirstName(rs.getString("firstname"));
                user.setLastName(rs.getString("lastname"));
                user.setPhone(rs.getString("phone"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                //.setId(rs.getInt("id"));
            }
        } catch (SQLException ex) {
            return null;
        }
        return user;
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
    public void deleteUser(String email) throws SQLException {
        st.executeUpdate("DELETE FROM  USERS WHERE email = '" + email + "'");
    }
    
    public void deleteUserByID(String id) throws SQLException {
        try{
            //int num = Integer.parseInt( id );
            deleteSt.executeUpdate("DELETE FROM USERS WHERE id = '" + id + "'");

        }
        catch(Exception x){
            System.out.println("ayo not working yo");
        }
    }

}