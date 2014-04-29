// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.eugene.hotelproj.controllers;

import com.eugene.hotelproj.controllers.ReservedController;
import com.eugene.hotelproj.models.Reserved;
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

privileged aspect ReservedController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ReservedController.create(@Valid Reserved reserved, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, reserved);
            return "reserveds/create";
        }
        uiModel.asMap().clear();
        reserved.persist();
        return "redirect:/reserveds/" + encodeUrlPathSegment(reserved.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ReservedController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Reserved());
        return "reserveds/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ReservedController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("reserved", Reserved.findReserved(id));
        uiModel.addAttribute("itemId", id);
        return "reserveds/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ReservedController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("reserveds", Reserved.findReservedEntries(firstResult, sizeNo));
            float nrOfPages = (float) Reserved.countReserveds() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("reserveds", Reserved.findAllReserveds());
        }
        return "reserveds/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ReservedController.update(@Valid Reserved reserved, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, reserved);
            return "reserveds/update";
        }
        uiModel.asMap().clear();
        reserved.merge();
        return "redirect:/reserveds/" + encodeUrlPathSegment(reserved.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ReservedController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Reserved.findReserved(id));
        return "reserveds/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ReservedController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Reserved reserved = Reserved.findReserved(id);
        reserved.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/reserveds";
    }
    
    void ReservedController.populateEditForm(Model uiModel, Reserved reserved) {
        uiModel.addAttribute("reserved", reserved);
    }
    
    String ReservedController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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