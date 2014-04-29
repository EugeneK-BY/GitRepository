package com.eugene.hotelproj.controllers;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.eugene.hotelproj.models.RoomType;

@RequestMapping("/roomtypes")
@Controller
@RooWebScaffold(path = "roomtypes", formBackingObject = RoomType.class)
public class RoomTypeController {
	
	@RequestMapping("/services")
	public ModelAndView kindOfRooms(){
		
		RoomType.createBaseRoomTypes();
		ModelAndView mav =  new ModelAndView("pages-fs/services");
		mav.addObject("models", RoomType.getListOfRoomTypes());

		return mav;
	}
}
