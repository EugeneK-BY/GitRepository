package com.eugene.hotelproj.controllers;
import com.eugene.hotelproj.models.Reserved;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/reserveds")
@Controller
@RooWebScaffold(path = "reserveds", formBackingObject = Reserved.class)
public class ReservedController {
}
