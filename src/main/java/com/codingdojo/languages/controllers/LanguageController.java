package com.codingdojo.languages.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.languages.models.Language;
import com.codingdojo.languages.services.LanguageService;

@Controller
public class LanguageController {
	@Autowired
	LanguageService languageService;
	
    @GetMapping("/languages")
    public String language(@ModelAttribute("language") Language language, Model model) {
    	List <Language> languages = languageService.getAll();
    	
    	model.addAttribute("languages", languages);
        return "index.jsp";
    }
    
    @PostMapping("/languages")
    public String create(@Valid @ModelAttribute("language") Language language,
    		BindingResult result,
    		RedirectAttributes redirectAttributes)
    {     	
        if (result.hasErrors()) {
        	redirectAttributes.addFlashAttribute("message", "Errors make corrections"); 
        	return "index.jsp";
        }
        
        languageService.create(language);
        redirectAttributes.addFlashAttribute("message", "Language added");
        
        return "redirect:/languages";
    }   
    
    @GetMapping("/languages/{id}")
    public String show(@PathVariable("id") Long id, Model model) {
        Language language =  languageService.getById(id);
        model.addAttribute("language", language);
        return "show.jsp";
    }
    
    @GetMapping("/languages/{id}/edit")
    public String edit(@PathVariable("id") Long id, Model model) {
        Language language =  languageService.getById(id);
        model.addAttribute("language", language);
        return "edit.jsp";
    }
    
    @PutMapping("/languages/{id}")
    public String update(@Valid @ModelAttribute("language") Language language, BindingResult result) {
        if (result.hasErrors()) {
            return "edit.jsp";
        } else {
            languageService.update(language);
            return "redirect:/languages";       }
    }   
    
    @DeleteMapping("/languages/{id}")    
    public String destroy(@PathVariable("id") Long id) {
    	languageService.delete(id);
        return "redirect:/languages";
    }
}
