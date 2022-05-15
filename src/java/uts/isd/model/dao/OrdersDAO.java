/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.model.dao;

import uts.isd.model.*;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author Jemima
 */
public class OrdersDAO {

    private Statement st;
    private PreparedStatement readSt;
    private PreparedStatement updateSt;
    private PreparedStatement deleteSt;
    private String readQuery = "SELECT * FROM ORDERS WHERE ORDERID=?";

    public OrdersDAO(Connection conn) throws SQLException {
        st = conn.createStatement();
        conn.setAutoCommit(true);
        st = conn.createStatement();
        readSt = conn.prepareStatement(readQuery);
    }

//Find user by email and password in the database
    public Order findOrderbyID(int orderid, String orderdate) throws SQLException {

        ResultSet rs = st.executeQuery("SELECT * FROM ORDERS WHERE ORDERID = " + orderid + " AND ORDERDATE = '" + orderdate + "'");
        while (rs.next()) {
            int orderID = Integer.parseInt(rs.getString(1));
            String orderDate = rs.getString(3);
            if (orderID == orderid && orderDate.equals(orderdate)) {
                int ID = Integer.parseInt(rs.getString(2));
                double orderPrice = Double.parseDouble(rs.getString(4));
                return new Order(orderID, ID, orderDate, orderPrice);
            }
        }
        return null;
    }

}
