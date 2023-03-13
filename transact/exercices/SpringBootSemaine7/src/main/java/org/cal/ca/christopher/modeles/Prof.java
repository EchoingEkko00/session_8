package org.cal.ca.christopher.modeles;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
@Data
@NoArgsConstructor
public class Prof {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    private String firstName;
    private String lastName;
    private String email;
    private int age;
    private LocalDate dateOfBirth;
    private boolean active;

    @OneToMany(mappedBy = "prof")
    List<Cours> cours = new ArrayList<>();

    public Prof(String firstName,
                String lastName,
                String email,
                int age,
                LocalDate dateOfBirth,
                boolean active) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.age = age;
        this.dateOfBirth = dateOfBirth;
        this.active = active;
    }

    public void addCours(Cours cour) {
        cours.add(cour);
        cour.setProf(this);
    }
}
