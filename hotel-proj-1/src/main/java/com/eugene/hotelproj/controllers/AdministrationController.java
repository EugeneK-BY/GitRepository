package com.eugene.hotelproj.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdministrationController {

	@RequestMapping(value="/administration", method=RequestMethod.GET ,produces = "text/html")
	public ModelAndView administrationMainPage(){
		return new ModelAndView("administration");
	}
	
}
