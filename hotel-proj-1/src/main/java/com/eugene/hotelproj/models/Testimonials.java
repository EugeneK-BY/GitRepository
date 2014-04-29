package com.eugene.hotelproj.models;

import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Testimonials {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Long id;
	
	@NotEmpty
	public Date date;
	
	@NotEmpty
	public HotelUser hotelUser;
	
	@NotEmpty
	public String text;
	
}
