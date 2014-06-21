package com.eugene.hotelproj.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eugene.hotelproj.models.HotelUser;
import com.eugene.hotelproj.models.UserProfile;
import com.eugene.hotelproj.models.UserRole;
import com.eugene.hotelproj.util.CustomPasswordEncoder;
import com.eugene.hotelproj.util.HotelUtil;

@Controller
public class UserRegistrationController {

	
	@RequestMapping(value="/registrationForm/{userType}", produces = "text/html" )
	public String createNewUserForm(@PathVariable("userType") String userType, Model uiModel){
		
		if(userType.equals("user")){
			populateEditUserForm(uiModel, new HotelUser());
		}else if(userType.equals("employee")){
			uiModel.addAttribute("page_header", "Регистрация сотрудника");
		}else{
			uiModel.addAttribute("page_header", "Регистрация");
		}
		return "registration/userRegistration";
	}

	
	@RequestMapping(value="/registration/{userType}" ,method=RequestMethod.POST ,produces = "text/html")
	public String createNewUser(@PathVariable("userType") String userType, @Valid HotelUser hotelUser, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest){
		if(userType.equals("user")){
			if (bindingResult.hasErrors()) {
	        	populateEditUserForm(uiModel, hotelUser);
	            return  "registration/userRegistration";
	        }
	        uiModel.asMap().clear();
	        hotelUser.userProfile.persist();
	        hotelUser.userRole = UserRole.getRoleByCode(HotelUtil.USER_ROLE_USER);
	        hotelUser.setPassword(CustomPasswordEncoder.encriptToSHA256(hotelUser.getPassword()));
	        hotelUser.persist();
	        uiModel.addAttribute("page_header", "Регистрация пользователя успешна");
	        return "registration/registrationComplite";
		}else{
        	populateEditUserForm(uiModel, hotelUser);
            return  "registration/userRegistration";
		}
       // return "redirect:/hotelusers/" + encodeUrlPathSegment(hotelUser.getId().toString(), httpServletRequest);
	}
	
	
	private void populateEditUserForm(Model uiModel,HotelUser hotelUser){
		uiModel.addAttribute("page_header", "Регистрация пользователя");
		uiModel.addAttribute("path", "/registration/user");
		if(hotelUser.userProfile==null){
			hotelUser.userProfile =  new UserProfile();
		}
		uiModel.addAttribute("hotelUser", hotelUser);
	}
	
	
	
}
