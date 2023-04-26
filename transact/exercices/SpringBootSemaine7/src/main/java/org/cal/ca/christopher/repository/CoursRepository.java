package org.cal.ca.christopher.repository;

import org.cal.ca.christopher.modeles.Cours;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CoursRepository extends JpaRepository<Cours, Long> {
    Cours findByNomCoursAndCredit(String nomCours, int credit);

    @Query("select c.nomCours, c.heures * c.credit from Cours c where c.nomCours like %:coursNom%")
    List<Object[]> findByAsArray(@Param("coursNom")String text);
}
