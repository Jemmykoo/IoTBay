
package uts.isd.model.dao;

import java.sql.Connection;

/** 
* Super class of DAO classes that stores the database information 
*  
*/

public abstract class DB {   

//protected String URL = "jdbc:derby://localhost:1527/";//replace this string with your jdbc:derby local host url   
//protected String db = "IoTBay";//name of the database   
//protected String dbuser = "jemima";//db root user   
//protected String dbpass = "jemima"; //db root password   
//protected String driver = "org.apache.derby.jdbc.ClientDriver"; //jdbc client driver - built in with NetBeans   
//protected Connection conn; //connection null-instance to be initialized in sub-classes


protected String URL = "jdbc:mysql://localhost:3306/";//replace this string with your jdbc:derby local host url   
protected String db = "IoTBay";//name of the database   
<<<<<<< HEAD
protected String dbuser = "root";//db root user   
protected String dbpass = ""; //db root password   
protected String driver = "com.mysql.jdbc.Driver"; //jdbc client driver - built in with NetBeans   
=======
protected String dbuser = "isduser";//db root user   
protected String dbpass = "admin"; //db root password   
protected String driver = "org.apache.derby.jdbc.ClientDriver"; //jdbc client driver - built in with NetBeans   
>>>>>>> f8a1b56ecf9e107938f246381b87d243ef9984e8
protected Connection conn; //connection null-instance to be initialized in sub-classes

}
