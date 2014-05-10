package com.eugene.hotelproj.controllers;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.eugene.hotelproj.models.Reservation;
import com.eugene.hotelproj.models.Room;
import com.eugene.hotelproj.viewModels.ReservationVM;

@RequestMapping("/reservations")
@Controller
@RooWebScaffold(path = "reservations", formBackingObject = Reservation.class)
public class ReservationController {
	
	
	@RequestMapping(value="/findRooms", method=RequestMethod.POST, produces = "text/html" )
	public ModelAndView findRooms(@Valid ReservationVM reservationModel, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest){
		
		//validation
		ModelAndView modelAndView = new ModelAndView("rooms/availableRooms");
		List<Room> list =  Room.getListAvaliableRooms(reservationModel);
		if(list.size() <1){
			modelAndView.addObject("emptylist", true);
		}else{
			modelAndView.addObject("models", list);
		}
		
		return modelAndView;
	}
	
	
}
