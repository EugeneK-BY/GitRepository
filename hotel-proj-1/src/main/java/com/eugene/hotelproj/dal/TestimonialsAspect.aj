package com.eugene.hotelproj.dal;

import java.util.Date;
import java.util.List;

import javax.persistence.TypedQuery;

import com.eugene.hotelproj.models.HotelUser;
import com.eugene.hotelproj.models.Testimonials;

public aspect TestimonialsAspect {

	public static List<Testimonials> Testimonials.getListOfTestimonials(){
		List<Testimonials> list =  null;
		
		TypedQuery<Testimonials> q = Testimonials.entityManager().createQuery("SELECT t FROM Testimonials", Testimonials.class); 
		if(!q.getResultList().isEmpty()){
			list = q.getResultList();
		}
		
		
		return list;
	}
	
	
	public static void Testimonials.addTestimonials(HotelUser user, String text){
		
		Testimonials testimonials = new Testimonials();
		testimonials.testimonialsText = text;
		testimonials.date = new Date();
		testimonials.hotelUser = user;
		testimonials.persist();
				
	}
	
}
