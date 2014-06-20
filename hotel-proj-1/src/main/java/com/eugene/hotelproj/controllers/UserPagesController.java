package com.eugene.hotelproj.controllers;
import com.eugene.hotelproj.models.Reservation;
import com.eugene.hotelproj.models.Room;
import com.eugene.hotelproj.models.UserRole;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/user")
@Controller
public class UserPagesController {
	
	@RequestMapping(value="/reservation", method=RequestMethod.GET, produces = "text/html" )
	public String reservRoom(Model uiModel){
		 populateReservation(uiModel, new Reservation());
		return "user-pages/reserv-room";
	}

	
    void populateReservation(Model uiModel, Reservation reservation) {
        uiModel.addAttribute("reservation", reservation);
        uiModel.addAttribute("rooms", Room.findAllRooms());
    }
	
	
}
