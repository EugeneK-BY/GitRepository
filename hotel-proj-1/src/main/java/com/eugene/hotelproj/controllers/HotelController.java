package com.eugene.hotelproj.controllers;
import com.eugene.hotelproj.models.HotelUser;
import com.eugene.hotelproj.models.UserRole;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/*@RequestMapping("/hotelusers")*/
@Controller
@RooWebScaffold(path = "hotelusers", formBackingObject = HotelUser.class)
public class HotelController {
	
    @RequestMapping("/gallery")
    public ModelAndView gallery() {
    	
    	return new ModelAndView("pages-fs/gallery");
    }
    

    @RequestMapping("/restaurant")
    public ModelAndView restourant() {
    	return new ModelAndView("pages-fs/restaurant");
    }
    
    @RequestMapping("/booking")
    public ModelAndView booking() {
    	return new ModelAndView("pages-fs/booking");
    }
    
    
}
