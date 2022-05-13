package uts.isd.model.dao;

import uts.isd.model.User;
import java.sql.*;
import java.util.*;
import sun.security.util.Password;
import java.sql.Connection;
import java.sql.PreparedStatement;


/* 
* DBManager is the primary DAO class to interact with the database. 
* Complete the existing methods of this classes to perform CRUD operations with the db.
*/

public class DBUserManagementManager {

private Statement st;
private PreparedStatement readSt;
private PreparedStatement updateSt;
private PreparedStatement deleteSt;
private PreparedStatement insertSt;
private PreparedStatement allUserSt;
private static final String INSERT_USERS_SQL = "INSERT INTO users" + "  (name, email, country) VALUES " + " (?, ?, ?);";
private String readQuery =  "SELECT * FROM USERS WHERE EMAIL=? AND PASSWORD=?";
private String updateQuery = "UPDATE USERS SET \"NAME\"=? ,PASSWORD=? ,PHONE=? WHERE ID=?";
private String deleteQuery = "DELETE FROM USERS WHERE ID= ?";
private static final String SELECT_ALL_USERS = "select * from users";
   

public DBUserManagementManager() {}

public DBUserManagementManager(Connection conn) throws SQLException {       
        conn.setAutoCommit(true);
        st = conn.createStatement();
        readSt =  conn.prepareStatement(readQuery);
        updateSt = conn.prepareStatement(updateQuery);
        deleteSt = conn.prepareStatement(deleteQuery); 
        insertSt = conn.prepareStatement(INSERT_USERS_SQL);
        allUserSt = conn.prepareStatement(SELECT_ALL_USERS);
}

//Find user by email and password in the database   
public User findUser(String email, String password) throws SQLException {       
   //setup the select sql query string       
   //execute this query using the statement field       
   //add the results to a ResultSet       
   //search the ResultSet for a user using the parameters               
   return null;   
}

//Add a user-data into the database   
public void addUser(String email, String firstName,String lastName, String password, String phoneNo, boolean isStaff) throws SQLException {                   //code for add-operation       
        String columns = "INSERT INTO USERS(EMAIL,\"FIRSTNAME\",\"LASTNAME\",PASSWORD,PHONE,ISSTAFF)";
        String values = "VALUES('" + email + "','" + firstName + "','" + lastName + "','" + password + "','" + phoneNo + "','" + isStaff + "')";
        st.executeUpdate(columns + values);
}
//update a user details in the database   
public void updateUser( String email, String name, String password, String gender, String favcol) throws SQLException {       
   //code for update-operation   
   
}       

//delete a user from the database   
public void deleteUser(String email) throws SQLException{       
   //code for delete-operation   

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
 
    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

}