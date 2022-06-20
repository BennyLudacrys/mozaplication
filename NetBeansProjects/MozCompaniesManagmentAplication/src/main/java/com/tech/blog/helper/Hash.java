package com.tech.blog.helper;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


public class Hash {
    private static String MD5(String input){
        try{
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messagedigest = md.digest(input.getBytes());
            BigInteger number = new BigInteger(1, messagedigest);
            String hashText = number.toString(16);
            return hashText; 
        }catch(NoSuchAlgorithmException e){
            throw new RuntimeException();
        }
    }
    
    private static String SHA1(String input){
        try{
            MessageDigest md = MessageDigest.getInstance("SHA1");
            byte[] messagedigest = md.digest(input.getBytes());
            BigInteger number = new BigInteger(1, messagedigest);
            String hashText = number.toString(16);
            return hashText;     
        }catch(NoSuchAlgorithmException e){
            throw new RuntimeException();
        }
    }
    
    public static String encrypt(String input){
        return Hash.SHA1(Hash.SHA1(Hash.MD5(Hash.SHA1(Hash.MD5(input)))));
       
    }
             
   
    
}
