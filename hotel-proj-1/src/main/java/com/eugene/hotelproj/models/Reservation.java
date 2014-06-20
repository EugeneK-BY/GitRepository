package com.eugene.hotelproj.models;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.transaction.UserTransaction;
import javax.validation.constraints.Future;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Reservation {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Long id;
	
	@Future
	public Date dateIn;
	
	@Future
	public Date dateOut;
	
	@ManyToOne
	public Room room;
	
	@ManyToOne
	public HotelUser hotelUser; 
	
}
