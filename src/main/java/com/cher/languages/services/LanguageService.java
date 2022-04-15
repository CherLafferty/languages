package com.cher.languages.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cher.languages.models.Language;
import com.cher.languages.repositories.LanguageRepo;

@Service
public class LanguageService {

	//CRUD
	
	//dependency injection
	@Autowired
	private LanguageRepo languageRepo;
	
	//CREATE
	public Language createLanguage(Language language) {
		return languageRepo.save(language);
	}
	
	//READ ALL
	public List<Language>allLanguages() {
		return languageRepo.findAll();
	}
	
	//READ ONE
	public Language findLanguage(Long id) {
		Optional<Language> optionalLanguage = languageRepo.findById(id);
		if (optionalLanguage.isPresent()) {
			return optionalLanguage.get();
		} else {
			return null;
		}
	}
	
	//UPDATE
	public Language updateLanguage(Language language) {
		return languageRepo.save(language);
	}
	
	//DELETE
	public void deleteLanguage(Long id) {
		languageRepo.deleteById(id);
	}
	
}
