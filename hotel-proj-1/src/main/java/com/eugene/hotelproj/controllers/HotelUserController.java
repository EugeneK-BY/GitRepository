package com.eugene.hotelproj.controllers;
import com.eugene.hotelproj.models.HotelUser;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/hotelusers")
@Controller
@RooWebScaffold(path = "hotelusers", formBackingObject = HotelUser.class)
public class HotelUserController {
}
