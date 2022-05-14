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
    
}
