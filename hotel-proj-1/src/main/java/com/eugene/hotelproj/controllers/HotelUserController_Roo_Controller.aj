// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.eugene.hotelproj.controllers;

import com.eugene.hotelproj.controllers.HotelUserController;
import com.eugene.hotelproj.models.HotelUser;
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

privileged aspect HotelUserController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String HotelUserController.create(@Valid HotelUser hotelUser, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, hotelUser);
            return "hotelusers/create";
        }
        uiModel.asMap().clear();
        hotelUser.persist();
        return "redirect:/hotelusers/" + encodeUrlPathSegment(hotelUser.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String HotelUserController.createForm(Model uiModel) {
        populateEditForm(uiModel, new HotelUser());
        return "hotelusers/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String HotelUserController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("hoteluser", HotelUser.findHotelUser(id));
        uiModel.addAttribute("itemId", id);
        return "hotelusers/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String HotelUserController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("hotelusers", HotelUser.findHotelUserEntries(firstResult, sizeNo));
            float nrOfPages = (float) HotelUser.countHotelUsers() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("hotelusers", HotelUser.findAllHotelUsers());
        }
        return "hotelusers/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String HotelUserController.update(@Valid HotelUser hotelUser, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, hotelUser);
            return "hotelusers/update";
        }
        uiModel.asMap().clear();
        hotelUser.merge();
        return "redirect:/hotelusers/" + encodeUrlPathSegment(hotelUser.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String HotelUserController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, HotelUser.findHotelUser(id));
        return "hotelusers/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String HotelUserController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        HotelUser hotelUser = HotelUser.findHotelUser(id);
        hotelUser.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/hotelusers";
    }
    
    void HotelUserController.populateEditForm(Model uiModel, HotelUser hotelUser) {
        uiModel.addAttribute("hotelUser", hotelUser);
    }
    
    String HotelUserController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
