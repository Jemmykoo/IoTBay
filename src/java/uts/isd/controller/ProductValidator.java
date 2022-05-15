package uts.isd.controller;

import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpSession;

public class ProductValidator implements Serializable {

    private String productStringPattern = "[A-Za-z]+";
    private String productFloatPattern = "^\\d+(\\.\\d+)?";
    private String productIntPattern = "^\\d+?";

    public ProductValidator() {
    }

    public boolean validate(String pattern, String input) {
        Pattern regEx = Pattern.compile(pattern);
        Matcher match = regEx.matcher(input);

        return match.matches();
    }
    public boolean checkEmpty(String word) {

        return word.isEmpty();

    }
    public boolean validateString(String word) {
        return validate(productStringPattern, word);
    }
    public boolean validateFloat(String numbers) {

        return validate(productFloatPattern, numbers);
    }

    public boolean validateInt(String numbers) {
        return validate(productIntPattern, numbers);
    }
    public static void clear(HttpSession session) {
        session.setAttribute("productNameErr", "Enter Product Name");
        session.setAttribute("unitPriceErr", "Enter Unit Price");
        session.setAttribute("productTypeErr", "Enter Product Type");
        session.setAttribute("quantityErr", "Enter Product Quantity");
        session.setAttribute("productDescriptionErr", "Enter Product Description");
    }
}
