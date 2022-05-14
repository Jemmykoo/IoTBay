<<<<<<< HEAD
<<<<<<< HEAD
package uts.isd.controller;

import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpSession;

public class ProductValidator implements Serializable {

    private String productNamePattern = "([A-Z][a-z]+[\\s])+[A-Z][a-z]*";
    private String unitPricePattern = "[0-9]";

    public ProductValidator() {
    }

    public boolean validate(String pattern, String input) {
        Pattern regEx = Pattern.compile(pattern);
        Matcher match = regEx.matcher(input);

        return match.matches();

    }

    public boolean checkEmpty(String name) {

        return name.isEmpty();

    }

    public boolean validateName(String name) {

        return validate(productNamePattern, name);

    }

    public static void clear(HttpSession session) {
    }
=======
=======
>>>>>>> 396f345f7557a6f8075a23e1324db1270ae04951
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.controller;

import javax.servlet.http.HttpSession;


/**
 *
 * @author Alice
 */
public class ProductValidator {

    public void clear(HttpSession session){
        session.setAttribute("productIdErr", "Enter Product ID");
        session.setAttribute("productNameErr", "Enter Product Name");
        session.setAttribute("productUnitPriceErr", "Enter Product Unit Prie");
        session.setAttribute("productTypeErr", "Enter Product Type");
        session.setAttribute("productQuantityErr", "Enter Product Quantity");
        session.setAttribute("productDescriptionErr", "Enter Product Description");
        session.setAttribute("existErr","");          
    }
    
<<<<<<< HEAD
>>>>>>> 396f345f7557a6f8075a23e1324db1270ae04951
=======
>>>>>>> 396f345f7557a6f8075a23e1324db1270ae04951
}
