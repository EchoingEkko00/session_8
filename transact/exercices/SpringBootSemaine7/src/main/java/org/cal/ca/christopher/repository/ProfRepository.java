package org.cal.ca.christopher.repository;

import org.cal.ca.christopher.modeles.Prof;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface ProfRepository extends JpaRepository<Prof, Long> {

    @Query(value = "SELECT p FROM Prof p LEFT JOIN FETCH p.cours c WHERE p.id = :profId")
    Optional<Prof> findByIdWithCours(@Param("profId") long profId);

    //Prof findByAgeBetween(int min, int max);

}
