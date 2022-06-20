package com.tech.blog.helper;

import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class Validations {
        private static final Pattern fNameExpression=
                Pattern.compile("^[a-z]{2,10}$", Pattern.CASE_INSENSITIVE);
        
        public static boolean fName(String fname){
                Matcher matcher = fNameExpression.matcher(fname);
                return matcher.find();
        }
    }
    
