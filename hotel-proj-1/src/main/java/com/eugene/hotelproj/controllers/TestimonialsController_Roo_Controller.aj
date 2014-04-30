// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.eugene.hotelproj.controllers;

import com.eugene.hotelproj.controllers.TestimonialsController;
import com.eugene.hotelproj.models.HotelUser;
import com.eugene.hotelproj.models.Testimonials;
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

privileged aspect TestimonialsController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String TestimonialsController.create(@Valid Testimonials testimonials, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, testimonials);
            return "testimonials/create";
        }
        uiModel.asMap().clear();
        testimonials.persist();
        return "redirect:/testimonials/" + encodeUrlPathSegment(testimonials.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String TestimonialsController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Testimonials());
        return "testimonials/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String TestimonialsController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("testimonials", Testimonials.findTestimonials(id));
        uiModel.addAttribute("itemId", id);
        return "testimonials/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String TestimonialsController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("testimonialses", Testimonials.findTestimonialsEntries(firstResult, sizeNo));
            float nrOfPages = (float) Testimonials.countTestimonialses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("testimonialses", Testimonials.findAllTestimonialses());
        }
        return "testimonials/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String TestimonialsController.update(@Valid Testimonials testimonials, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, testimonials);
            return "testimonials/update";
        }
        uiModel.asMap().clear();
        testimonials.merge();
        return "redirect:/testimonials/" + encodeUrlPathSegment(testimonials.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String TestimonialsController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Testimonials.findTestimonials(id));
        return "testimonials/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String TestimonialsController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Testimonials testimonials = Testimonials.findTestimonials(id);
        testimonials.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/testimonials";
    }
    
    void TestimonialsController.populateEditForm(Model uiModel, Testimonials testimonials) {
        uiModel.addAttribute("testimonials", testimonials);
        uiModel.addAttribute("hotelusers", HotelUser.findAllHotelUsers());
    }
    
    String TestimonialsController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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