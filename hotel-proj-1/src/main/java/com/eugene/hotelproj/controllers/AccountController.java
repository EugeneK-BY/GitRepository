package com.eugene.hotelproj.controllers;

import com.eugene.hotelproj.models.UserRole;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/account")
@Controller
@RooWebScaffold(path = "userroles", formBackingObject = UserRole.class)
public class AccountController {
	@RequestMapping(method = RequestMethod.GET)
	public String account() {

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetails = (UserDetails) SecurityContextHolder
					.getContext().getAuthentication().getPrincipal();
			if (userDetails.getAuthorities().toString().equals("[admin]")
					|| userDetails.getAuthorities().toString()
							.equals("[manager]")) {
				return "redirect:/administration";
			} else {
				return "index:/reservation";
			}

		}
		return "index";
	}
}
