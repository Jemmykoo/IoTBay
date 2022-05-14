package uts.isd.model.dao;

import uts.isd.model.User;
import java.sql.*;
import java.util.ArrayList;
import uts.isd.model.Log;

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
        User user = new User();
        try {
            ResultSet rs = st.executeQuery("SELECT * FROM USERS WHERE email = '" + email + "' AND password = '" + password + "'");

            while (rs.next()) {
                user.setFirstName(rs.getString("firstname"));
                user.setLastName(rs.getString("lastname"));
                user.setPhone(rs.getString("phone"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setId(rs.getInt("id"));
            }
        } catch (SQLException ex) {
            return null;
        }
        return user;
    }

    public ArrayList<Log> findLog(int userid) throws SQLException {
        ArrayList<Log> logList = new ArrayList<>();

        try {
            ResultSet rs = st.executeQuery("SELECT * FROM log WHERE userid = " + userid);

            while (rs.next()) {
                Log log = new Log();
                log.setId(rs.getInt("id"));
                log.setUserid(rs.getInt("userid"));
                log.setDate(rs.getString("date"));
                log.setDescription(rs.getString("description"));
                logList.add(log);
            }
        } catch (SQLException ex) {
            return null;
        }
        return logList;
    }

    public void addLog(int id, String description) throws SQLException {
        st.executeUpdate("INSERT INTO log (userid, description) VALUES(" + id + ",'" + description + "')");

    }

//Add a user-data into the database   
    public void addUser(String email, String fname, String lname, String password, String phone, int isStaff) throws SQLException {                   //code for add-operation       
        st.executeUpdate("INSERT INTO USERS (email, firstname,lastname, password, phone, isstaff) VALUES('" + email + "','" + fname + "','" + lname + "','" + password + "','" + phone + "'," + isStaff + ")");
    }

//update a user details in the database   
    public void updateUser(String email, String fname, String lname, String password, String phone, int isstaff) throws SQLException {
        st.executeUpdate("UPDATE USERS SET firstname = '" + fname + "', lastname = '" + lname + "', password = '" + password + "', phone = '" + phone + "', isstaff = " + isstaff + " WHERE email ='" + email + "'");
    }

//delete a user from the database   
    public void deleteUser(String email) throws SQLException {
        st.executeUpdate("DELETE FROM  USERS WHERE email ='" + email + "'");
    }

}
