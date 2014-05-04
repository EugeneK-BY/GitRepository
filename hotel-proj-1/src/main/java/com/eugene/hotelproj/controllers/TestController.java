package com.eugene.hotelproj.controllers;
import com.eugene.hotelproj.models.HotelUser;
import com.eugene.hotelproj.models.RoomType;
import com.eugene.hotelproj.models.Testimonials;
import com.eugene.hotelproj.models.UserRole;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/test")
@Controller
@RooWebScaffold(path = "hotelusers", formBackingObject = HotelUser.class)
public class TestController {
	
    @RequestMapping("/defaultdata")
    public String kindOfRooms() {
    	if(UserRole.countUserRoles()<1){
    		UserRole.createBaseRoles();
    	}
    	if(HotelUser.countHotelUsers()<1){
    		HotelUser.createDefaultUsers();
    	}
    	
    	RoomType.createBaseRoomTypes(); // 
        Testimonials.addTestimonials(HotelUser.getHotelUser(1L) , "Все хорошо");
        
    	return "OK";
    }
}
