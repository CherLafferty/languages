package com.cher.languages.controllers;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cher.languages.models.Language;
import com.cher.languages.services.LanguageService;


@Controller
public class LanguageController {

	@Autowired
	LanguageService languageRepo;

	@GetMapping("/languages")
	public String index(Model model, @ModelAttribute("language") Language language) {
		List<Language> allLanguages = languageRepo.allLanguages();
		model.addAttribute("allLanguages", allLanguages);

		return "index.jsp";
	}
	
	@RequestMapping("/languages/{id}")
	public String showOne(@PathVariable("id") Long id, Model model) {
		Language language = languageRepo.findLanguage(id);
		model.addAttribute(language);
		return "showOne.jsp";
	}

	@PostMapping("/languages")
	public String create(@Valid @ModelAttribute("language") Language language, BindingResult result) {

		if (result.hasErrors()) {
			return "index.jsp";
		} else {
			languageRepo.createLanguage(language);
			return "redirect:/languages";
		}
	}

	@RequestMapping("/languages/edit/{id}")
	public String edit(@PathVariable("id") Long id, Model model) {
		Language language = languageRepo.findLanguage(id);
		model.addAttribute("language", language);
		return "edit.jsp";
	}

	@RequestMapping(value = "/languages/edit/{id}", method = RequestMethod.PUT)
	public String update(@Valid @ModelAttribute("language") Language language, BindingResult result) {
		if (result.hasErrors()) {
			return "edit.jsp";
		} else {
			languageRepo.updateLanguage(language);
			return "redirect:/languages";
		}
	}

	@DeleteMapping("/languages/{id}")
	public String destroy(@PathVariable("id") Long id) {
		languageRepo.deleteLanguage(id);
		return "redirect:/languages";
	}
}
