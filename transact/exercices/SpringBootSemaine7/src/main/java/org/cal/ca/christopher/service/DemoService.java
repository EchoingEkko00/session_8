package org.cal.ca.christopher.service;

import org.cal.ca.christopher.modeles.Cours;
import org.cal.ca.christopher.modeles.Etudiant;
import org.cal.ca.christopher.modeles.Prof;
import org.cal.ca.christopher.repository.CompteRepository;
import org.cal.ca.christopher.repository.CoursRepository;
import org.cal.ca.christopher.repository.EtudiantRepository;
import org.cal.ca.christopher.repository.ProfRepository;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.util.List;

@Component
public class DemoService {

    private CoursRepository coursRepository;
    private ProfRepository profRepository;
    private EtudiantRepository etudiantRepository;
    private CompteRepository compteRepository;

    public DemoService(CoursRepository coursRepository,
                       ProfRepository profRepository,
                       EtudiantRepository etudiantRepository,
                       CompteRepository compteRepository) {

        this.coursRepository = coursRepository;
        this.profRepository = profRepository;
        this.etudiantRepository = etudiantRepository;
        this.compteRepository = compteRepository;
    }

    public Cours saveCours(String nomCours, int heures, int credits) {
        return coursRepository.save(new Cours(nomCours, heures, credits));
    }

    public Cours saveCours(Cours cours) {
        return coursRepository.save(cours);
    }

    public Prof saveProf(String firstName, String lastName,
                         String email, int age,
                         LocalDate dateOfBirth, boolean active) {
        return profRepository.save(
                new Prof(firstName,
                        lastName,
                        email,
                        age,
                        dateOfBirth,
                        active));
    }

    public Prof saveProf(Prof prof) {
        return profRepository.save(prof);
    }

    public Etudiant saveEtudiant(String prenom, String nom) {
        return etudiantRepository.save(new Etudiant(prenom, nom));
    }

    public void addProfToCours(long profId, long coursId) {
        var profOpt = profRepository.findByIdWithCours(profId);
        var coursOpt = coursRepository.findById(coursId);
        if (profOpt.isEmpty() || coursOpt.isEmpty())
            return;  // Comment on appelle ce bloc 'if' ?
        var prof = profOpt.get();
        var cours = coursOpt.get();

        prof.addCours(cours);
        cours.setProf(prof);
        profRepository.save(prof);
        coursRepository.save(cours);
    }

    public List<Prof> findAllProfs() {
        return profRepository.findAll();
    }
/*
    public long saveCompte(String nom, int balance) {
        var compte = new Compte(nom, balance);
        return compteRepository.save(compte).getId();
    }

    @Transactional
    public void transfertDeCompteACompte(Compte source, Compte destination, int montant) throws UnsufficientFunds {
        // Gard clause
        if (source.getBalance() < montant)
            throw new UnsufficientFunds("Compte " + source.getNom() + " n'as pas assez de fond");

        source.setBalance(source.getBalance()-montant);
        destination.setBalance(destination.getBalance()+montant);

        compteRepository.save(source);
        compteRepository.save(destination);
    }

    public Optional<Compte> findCompte(long sourceId) {
        return compteRepository.findById(sourceId);
    }

    public Optional<Prof> findProfById(long id) {
        return profRepository.findById(id);
    }*/
}
