package com.eugene.hotelproj.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserRegistrationController {

	
	@RequestMapping(value="userRegistration", method=RequestMethod.POST, produces = "text/html" )
	public ModelAndView createNewUser(){
		ModelAndView modelAndView =  new ModelAndView("userRegistration");
		
		modelAndView.addObject("header", "Регистрация пользователя");
		
		
		return modelAndView;
	}
	
}
