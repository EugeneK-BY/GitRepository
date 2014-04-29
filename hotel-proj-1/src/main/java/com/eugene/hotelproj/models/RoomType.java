package com.eugene.hotelproj.models;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class RoomType {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Long id;
	
	@NotEmpty
	public String name;
	
	public String description;
	
	public boolean airConditioning;
	
	public boolean fringe; 
	
	@Range(min=1, max=1000)
	public int Rooms;
	
	@Range(min=1, max=4)
	public int Beds;
	
	@Range(min=1, max=3)
	public int Baths;
	
	public String image; 

}
