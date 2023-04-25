package com.lacouf.reacttodo.service;

import com.lacouf.reacttodo.model.Todo;
import com.lacouf.reacttodo.repos.TodoRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TodoService {

    public TodoRepository repository;

    public TodoService(TodoRepository repository) {
        this.repository = repository;
    }

    public List<Todo> getAllTodos() {
        return repository.findAll();
    }

    public Optional<Todo> saveTodo(Todo todo) {
        return Optional.of(repository.save(todo));
    }
}
