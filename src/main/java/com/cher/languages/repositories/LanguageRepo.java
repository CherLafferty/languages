package com.cher.languages.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.cher.languages.models.Language;



@Repository
public interface LanguageRepo extends CrudRepository<Language, Long> {
    // this method retrieves all the travels from the database
    List<Language> findAll();
	
}