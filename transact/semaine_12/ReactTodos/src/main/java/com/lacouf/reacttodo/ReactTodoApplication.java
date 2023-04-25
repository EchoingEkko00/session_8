package com.lacouf.reacttodo;


import com.fasterxml.jackson.annotation.JsonInclude;
import com.lacouf.reacttodo.model.Todo;
import com.lacouf.reacttodo.repos.TodoRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;

@SpringBootApplication
public class ReactTodoApplication implements CommandLineRunner {
    private final TodoRepository repository;
    public ReactTodoApplication(TodoRepository repository) {
        this.repository = repository;
    }
    public static void main(String[] args) {
        SpringApplication.run(ReactTodoApplication.class, args);
    }
    @Override
    public void run(String... args) throws Exception {
        //repository.deleteAll();

        // save a couple of customers
//        repository.save(Todo.builder()
//                        .text("Todo1")
//                        .day("Hier")
//                        .reminder(false)
//                        .build());
//
//        repository.save(Todo.builder()
//                .text("Todo2")
//                .day("Aujourd'hui")
//                .reminder(true)
//                .build());

        // fetch all todo
        System.out.println("Todos avec findAll():");
        System.out.println("-------------------------------");
        for (Todo todo : repository.findAll()) {
            System.out.println(todo);
        }
        System.out.println();
    }
}
