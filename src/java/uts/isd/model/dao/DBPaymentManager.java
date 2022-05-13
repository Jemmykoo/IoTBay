package uts.isd.model.dao;

import uts.isd.model.Payment;
import java.sql.*;

/* 
* DBManager is the primary DAO class to interact with the database. 
* Complete the existing methods of this classes to perform CRUD operations with the db.
 */
public class DBManager {

    private Statement st;

    public DBManager(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

    public Payment findPayment(int paymentID, Date dateOfPayment) throws SQLException {
        String fetch = "select * from IOTBAYUSER.PaymentHistory where PAYMENTID = '" + paymentID + "' and dateOfPayment = '" + dateOfPayment + "'";     
        ResultSet rs = st.executeQuery(fetch);      
        while (rs.next()) {
            int pID = rs.getInt(1);
            Date datePaid = rs.getDate(9);
            if (paymentID == pID && datePaid.equals(dateOfPayment)) {
                String paymentMethod = rs.getString(3);
                String nameOnCard = rs.getString(4);
                String cardNumber = rs.getString(5);
                Date expiryDate = rs.getDate(6);
                int CVV = Integer.parseInt(rs.getString(7));
                double amount = rs.getDouble(8);
            }
        }
        return null;
    }

    public void addPayment(String paymentMethod,String nameOnCard,String cardNumber,Date expiryDate,int CVV) throws SQLException {
        st.executeUpdate("INSERT INTO IOTBAYUSER.PaymentHistory " + "VALUES ('" + paymentMethod + "', '" + nameOnCard + "', '" + cardNumber + "','" + expiryDate + "','" + CVV + "')");
    }

    public void updatePayment(String paymentMethod,String nameOnCard,String cardNumber,Date expiryDate,int CVV) throws SQLException {
        st.executeUpdate("UPDATE IOTBAYUSER.PaymentHistory SET PAYMENTMETHOD = '" + paymentMethod + "',NAMEONCARD = '" + nameOnCard + "', EXPIRYDATE = '" + cardNumber + "', CVV = '" + expiryDate + "','" + CVV + "')");
    }

    public void deletePayment(int paymentID) throws SQLException {
        st.executeUpdate("DELETE FROM IOTBAYUSER.PaymentHistory WHERE PAYMENTID = '" + paymentID + "'");
    }

}
