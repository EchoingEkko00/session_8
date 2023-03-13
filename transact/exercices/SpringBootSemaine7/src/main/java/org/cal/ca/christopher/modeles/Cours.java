package org.cal.ca.christopher.modeles;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Data
@NoArgsConstructor
public class Cours {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    private String nomCours;
    private int heures;
    private int credit;
    private String samir;

    @ManyToOne
    @JoinColumn(name = "prof_id")
    @ToString.Exclude
    private Prof prof;

    public Cours(String nomCours, int heures, int credit) {
        this.nomCours = nomCours;
        this.heures = heures;
        this.credit = credit;
    }

}
