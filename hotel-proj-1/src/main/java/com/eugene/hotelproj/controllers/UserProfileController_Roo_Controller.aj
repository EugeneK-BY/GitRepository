// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.eugene.hotelproj.controllers;

import com.eugene.hotelproj.controllers.UserProfileController;
import com.eugene.hotelproj.models.UserProfile;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect UserProfileController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String UserProfileController.create(@Valid UserProfile userProfile, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, userProfile);
            return "userprofiles/create";
        }
        uiModel.asMap().clear();
        userProfile.persist();
        return "redirect:/userprofiles/" + encodeUrlPathSegment(userProfile.getUserProfileId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String UserProfileController.createForm(Model uiModel) {
        populateEditForm(uiModel, new UserProfile());
        return "userprofiles/create";
    }
    
    @RequestMapping(value = "/{userProfileId}", produces = "text/html")
    public String UserProfileController.show(@PathVariable("userProfileId") Long userProfileId, Model uiModel) {
        uiModel.addAttribute("userprofile", UserProfile.findUserProfile(userProfileId));
        uiModel.addAttribute("itemId", userProfileId);
        return "userprofiles/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String UserProfileController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("userprofiles", UserProfile.findUserProfileEntries(firstResult, sizeNo));
            float nrOfPages = (float) UserProfile.countUserProfiles() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("userprofiles", UserProfile.findAllUserProfiles());
        }
        return "userprofiles/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String UserProfileController.update(@Valid UserProfile userProfile, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, userProfile);
            return "userprofiles/update";
        }
        uiModel.asMap().clear();
        userProfile.merge();
        return "redirect:/userprofiles/" + encodeUrlPathSegment(userProfile.getUserProfileId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{userProfileId}", params = "form", produces = "text/html")
    public String UserProfileController.updateForm(@PathVariable("userProfileId") Long userProfileId, Model uiModel) {
        populateEditForm(uiModel, UserProfile.findUserProfile(userProfileId));
        return "userprofiles/update";
    }
    
    @RequestMapping(value = "/{userProfileId}", method = RequestMethod.DELETE, produces = "text/html")
    public String UserProfileController.delete(@PathVariable("userProfileId") Long userProfileId, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        UserProfile userProfile = UserProfile.findUserProfile(userProfileId);
        userProfile.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/userprofiles";
    }
    
    void UserProfileController.populateEditForm(Model uiModel, UserProfile userProfile) {
        uiModel.addAttribute("userProfile", userProfile);
    }
    
    String UserProfileController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
