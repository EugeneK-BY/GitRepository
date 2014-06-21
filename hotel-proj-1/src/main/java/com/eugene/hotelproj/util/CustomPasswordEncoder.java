package com.eugene.hotelproj.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


public class CustomPasswordEncoder /*extends MessageDigestPasswordEncoder*/ {

	/*public CustomPasswordEncoder(String algorithm) {
		super(algorithm);
	}

	public CustomPasswordEncoder() {
		super("SHA-256");
	}
	
	public String encodePassword(String rawPass, Object salt) {
        if(salt != null){
        	return encriptToSHA256(rawPass);        	
        }
        return null;
    }
	*/
	public static String encriptToSHA256(String rawPassword){
		
		StringBuffer hexString = new StringBuffer();
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("SHA-256");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		md.update(rawPassword.getBytes());

		byte byteData[] = md.digest();

		// convert the byte to hex format method 1
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < byteData.length; i++) {
			sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
		}

		// convert the byte to hex format method 2
		for (int i = 0; i < byteData.length; i++) {
			String hex = Integer.toHexString(0xff & byteData[i]);
			if (hex.length() == 1)
				hexString.append('0');
			hexString.append(hex);
		}

		return hexString.toString();
	}
	
}
