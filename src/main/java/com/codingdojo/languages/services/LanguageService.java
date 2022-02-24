package com.codingdojo.languages.services;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.stereotype.Service;

import com.codingdojo.languages.models.Language;
import com.codingdojo.languages.repositories.LanguageRepository;

@Service
public class LanguageService {
	private final LanguageRepository languageRepository;
    
    public LanguageService(LanguageRepository languageRepository) {
        this.languageRepository = languageRepository;
    }
    
    public List<Language> getAll() {
        return languageRepository.findAll();
    }
    
	public Language getById(Long id) {
        Optional<Language> optionalLanguage = languageRepository.findById(id);
        if(optionalLanguage.isPresent()) {
            return optionalLanguage.get();
        } else {
            return null;
        }
	}
	
    public Language create(Language b) {
        return languageRepository.save(b);
    }
    
	public void update(@Valid Language language) {
		languageRepository.save(language);		
	}
	
	public void delete(long id) {
		languageRepository.deleteById(id);
	}
}