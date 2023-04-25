package com.lacouf.reacttodo.model;

import lombok.*;

import javax.persistence.Entity;
import javax.persistence.Id;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
@Entity
public class Todo {
    @Id
    private Long id;

    private String text;
    private String day;
    private boolean reminder;

    public Long getId() {
        return id;
    }
}
