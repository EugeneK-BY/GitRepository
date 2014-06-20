package com.eugene.hotelproj.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

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
	
	@NotNull
	public Date date;
	
	@NotNull
	@ManyToOne
	public HotelUser hotelUser;
	
	@NotEmpty
	@Column(name="testimonialsText", columnDefinition="TEXT")
	public String testimonialsText;
	
	public boolean isVisible;
}
