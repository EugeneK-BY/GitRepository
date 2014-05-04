package com.eugene.hotelproj.controllers;
import com.eugene.hotelproj.models.HotelUser;
import com.eugene.hotelproj.models.RoomType;
import com.eugene.hotelproj.models.Testimonials;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/testimonials")
@Controller
@RooWebScaffold(path = "testimonials", formBackingObject = Testimonials.class)
public class TestimonialsController {
	
    @RequestMapping("/userTestimonials")
    public ModelAndView kindOfRooms() {
        ModelAndView mav = new ModelAndView("pages-fs/testimonials");
        mav.addObject("models", Testimonials.getListOfTestimonials());
        return mav;
    }
	
}
