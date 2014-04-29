package com.eugene.hotelproj.dal;

import java.util.List;

import javax.persistence.TypedQuery;

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
	
}
