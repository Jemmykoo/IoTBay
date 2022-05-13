package uts.isd.controller;

import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpSession;

public class PaymentValidator implements Serializable {
    
    private String paymentIDPattern = "[0-9]{5,10}";
    private String cardNumberPattern = "[0-9]{13,16}";
    private String expiryDatePattern = "(0[1-9]|1[012])/[0-9]{4}";
    private String CVVPattern = "[0-9][3,4]";
    private String orderDatePattern = "(0[1-9]|1[0-9]|2[0-9]|3[01]).(0[1-9]|1[012]).[0-9]{4}";

    public PaymentValidator() {
    }

    public boolean validate(String pattern, String input) {
        Pattern regEx = Pattern.compile(pattern);
        Matcher match = regEx.matcher(input);

        return match.matches();

    }

    public boolean checkEmpty(String cardNumber, String expiryDate, String CVV) {
        return cardNumber.isEmpty() || expiryDate.isEmpty() || CVV.isEmpty();
    }

    public boolean validateCardNumber(String cardNumber) {
        return validate(cardNumberPattern, cardNumber);
    }

    public boolean validateExpiryDate(String expiryDate) {
        return validate(expiryDatePattern, expiryDate);
    }

    public boolean validateCVV(String CVV) {
        return validate(CVVPattern, CVV);
    }
    
    public boolean validatePaymentID(String paymentID) {
        return validate(paymentIDPattern, paymentID);
    }
    
    public boolean validateOrderDate(String orderDate) {
        return validate(orderDatePattern, orderDate);
    }
    
    public void clear(HttpSession session) {
        session.setAttribute("paymentIDErr", "Enter PaymentID");
        session.setAttribute("cardNumberErr", "Enter CardNumber");
        session.setAttribute("expiryDateErr", "Enter Expiry Date of Card");
        session.setAttribute("CVVErr", "Enter CVV of Card");
        session.setAttribute("nameOnCardErr", "Enter Name on Card");
    }
    
}
