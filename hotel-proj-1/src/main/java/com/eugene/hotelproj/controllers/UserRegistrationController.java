package com.eugene.hotelproj.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.eugene.hotelproj.models.HotelUser;
import com.eugene.hotelproj.models.UserProfile;
import com.eugene.hotelproj.models.UserRole;

@Controller
public class UserRegistrationController {

	
	@RequestMapping(value="/registration/{userType}", produces = "text/html" )
	public ModelAndView createNewUser(@PathVariable("userType") String userType){
		ModelAndView modelAndView =  new ModelAndView("registration/userRegistration");
		if(userType.equals("user")){
			modelAndView.addObject("page_header", "Регистрация пользователя");
			modelAndView.addObject("hotelUser", new HotelUser());
		}else if(userType.equals("employee")){
			modelAndView.addObject("page_header", "Регистрация сотрудника");
		}else{
			modelAndView.addObject("page_header", "Регистрация");
		}
		return modelAndView;
	}

}
