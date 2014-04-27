package com.eugene.hotelproj.models;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.hibernate.validator.constraints.Range;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Room {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Long id;
	
	@Range(min =1, max=10000 )
	public int roomNumber;
	
	@Range(min =0, max=10000 )
	public int floor; 
	
}
