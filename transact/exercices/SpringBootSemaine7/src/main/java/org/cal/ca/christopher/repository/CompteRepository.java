package org.cal.ca.christopher.repository;


import org.cal.ca.christopher.modeles.Compte;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CompteRepository extends JpaRepository<Compte, Long> {
}
