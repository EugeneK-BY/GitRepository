package com.eugene.hotelproj.controllers;
import com.eugene.hotelproj.models.UserProfile;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/userprofiles")
@Controller
@RooWebScaffold(path = "userprofiles", formBackingObject = UserProfile.class)
public class UserProfileController {
}
