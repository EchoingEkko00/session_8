package model;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class Registration {
    private long id;

    private String lastName;
    private String firstName;
    private int age;


}
