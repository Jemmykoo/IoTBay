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

}
