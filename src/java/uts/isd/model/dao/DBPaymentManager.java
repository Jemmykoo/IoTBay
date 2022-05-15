package uts.isd.model.dao;

import uts.isd.model.PaymentHistory;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import uts.isd.model.Payment;
import uts.isd.model.dao.DBConnector;

/* 
* DBPaymentManager is the primary DAO class to interact with the database. 
* Complete the existing methods of this classes to perform CRUD operations with the db.
 */
public class DBPaymentManager {

    private Statement st;
    private Connection PaymentConnection;
    private DBConnector DBCon;
    
    public DBPaymentManager(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

    public ArrayList<Payment> fetchPayment() throws SQLException {
        String fetch = "SELECT * FROM PAYMENT";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<Payment> payment = new ArrayList();

        while (rs.next()) {
            int paymentID = Integer.parseInt(rs.getString(1));
            String paymentMethod = rs.getString(2);
            String nameOnCard = rs.getString(3);
            String cardNumber = rs.getString(4);
            String expiryDate = rs.getString(5);
            String CVV = rs.getString(6);
            int orderID = Integer.parseInt(rs.getString(7));
            payment.add(new Payment(paymentMethod, nameOnCard, cardNumber, expiryDate, CVV));
        }
        return payment;
    }
    
    public PaymentHistory findPayment(String paymentID, String orderDate) throws SQLException {
        String fetch = "select * from ISDUSER.Payment where PAYMENTID = '" + paymentID + "' and orderDate = '" + orderDate + "'";
        ResultSet rs = st.executeQuery(fetch);
        while (rs.next()) {
            int pID = rs.getInt(1);
            String datePaid = rs.getString(7);
            if (paymentID.equals(pID) && datePaid.equals(orderDate)) {
                String paymentMethod = rs.getString(2);
                String nameOnCard = rs.getString(3);
                String cardNumber = rs.getString(4);
                String expiryDate = rs.getString(5);
                String CVV = rs.getString(6);
                double orderPrice = rs.getDouble(8);
                
            }
        }
        return null;
    }

    public void addPayment(String paymentMethod, String nameOnCard, String cardNumber, String expiryDate, String CVV) throws SQLException {
        st.executeUpdate("INSERT INTO ISDUSER.PAYMENT(PAYMENTMETHOD, NAMEONCARD, CARDNUMBER, EXPIRYDATE, CVV)" + "VALUES ('" + paymentMethod + "', '" + nameOnCard + "', '" + cardNumber + "','" + expiryDate + "','" + CVV + "')");
    }

    public void updatePayment(String paymentMethod, String nameOnCard, String cardNumber, String expiryDate, String CVV) throws SQLException {
        st.executeUpdate("UPDATE ISDUSER.Payment SET PAYMENTMETHOD = '" + paymentMethod + "',NAMEONCARD = '" + nameOnCard + "', EXPIRYDATE = '" + cardNumber + "', CVV = '" + expiryDate + "','" + CVV + "')");
    }

    public void deletePayment(int paymentID) throws SQLException {
        st.executeUpdate("DELETE FROM ISDUSER.Payment WHERE PAYMENTID = " + paymentID + "");
    }

    public List<PaymentHistory> listPaymentHistory() throws SQLException {
        List<PaymentHistory> listPaymentH = new ArrayList<>();
        String sql = "SELECT * FROM Payment";
        DBCon.openConnection();
        
        Statement statement = PaymentConnection.createStatement();
        ResultSet result = statement.executeQuery(sql);

        while (result.next()) {
            String paymentMethod = result.getString("paymentMethod");
            String nameOnCard = result.getString("nameOnCard");
            String cardNumber = result.getString("cardNumber");
            String expiryDate = result.getString("expiryDate");
            int CVV = result.getInt("CVV");
            double orderPrice = result.getDouble("orderPrice");
            String orderDate = result.getString("orderDate");

            PaymentHistory paymentH = new PaymentHistory(paymentMethod,nameOnCard,cardNumber,expiryDate,CVV,orderPrice,orderDate);
            listPaymentH.add(paymentH);
        }

        result.close();
        statement.close();
        DBCon.closeConnection();

        return listPaymentH;
    }
    public int getID(String email, String password) throws SQLException {
       int ID;
       String fetch = "select ID FROM ISDUSER.USERS where EMAIL = '" + email + "' and PASSWORD ='" + password + "'" ;
       ResultSet rs = st.executeQuery(fetch);
       if (rs.next()) {
           ID = rs.getInt(1);
            return ID;
       } else {  
            return 0;
       }
    } 
    public int getOrderID() throws SQLException {
       int orderID;
       String fetch = "select max(ORDERID) FROM ISDUSER.ORDERS" ;
       ResultSet rs = st.executeQuery(fetch);
       if (rs.next()) {
            orderID = rs.getInt(1);
            return orderID;
       } else {
           return 0;
       }
    }
    public int getPaymentID() throws SQLException {
       int paymentID;
       String fetch = "select MAX(PAYMENTID) FROM ISDUSER.PAYMENT" ;
       ResultSet rs = st.executeQuery(fetch);
       if (rs.next()) {
            paymentID = rs.getInt(1);
            return paymentID;
       } else {
           return 0;
       }
    }
    
    public ArrayList<String> fetchPayment(Integer ID) throws SQLException {
        String fetch = "SELECT * FROM PAYMENT JOIN ORDERS ON ORDERS.ORDERID = PDETAILS.ORDERID JOIN USERS ON USERS.ID = ORDERS.ID WHERE ORDERS.ID=USERID";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<String> temp = new ArrayList();
        while(rs.next()) {
            temp.add(Integer.toString(rs.getInt(1)));
            temp.add(rs.getString(2));
            temp.add(rs.getString(3));
            temp.add(rs.getString(4));
            temp.add(rs.getString(5));
            temp.add(rs.getString(6));
            temp.add(Integer.toString(rs.getInt(7)));
            temp.add((rs.getString(8)));
            temp.add(Double.toString(rs.getDouble(9)));
        }
        return temp;
    }
}
