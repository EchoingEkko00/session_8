package org.cal.ca.christopher.modeles;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
public class Etudiant {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    private String prenom;
    private String nom;

    public Etudiant(String prenom, String nom) {
        this.prenom = prenom;
        this.nom = nom;
    }
}
