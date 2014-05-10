package com.eugene.hotelproj.controllers;
import com.eugene.hotelproj.models.HotelUser;
import com.eugene.hotelproj.models.Room;
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
        
        
        	for(int i=1; i<10; i++){
        		Room.createRoom(1, i, RoomType.findRoomType(1L));
        	}

        	for(int i=10; i<20; i++){
        		Room.createRoom(i,1,RoomType.findRoomType(2L));
        	}
   
        	for(int i=20; i<25; i++){
        		Room.createRoom(i,1,RoomType.findRoomType(3L));
        	}
       
        
    	return "OK";
    }
}
