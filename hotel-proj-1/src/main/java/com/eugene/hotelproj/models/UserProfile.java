package com.eugene.hotelproj.models;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class UserProfile {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Long userProfileId;
	
	@NotEmpty
	public String firstName;
	@NotEmpty
	public String lastName;
	public String fatherName;
	
	public String phoneNumber;
	@NotEmpty @Email
	public String mail;
	public String skype;
	
}
