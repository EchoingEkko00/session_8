package com.lacouf.reacttodo.controller;

import com.lacouf.reacttodo.model.Todo;
import com.lacouf.reacttodo.service.TodoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/todos")
public class ReactTodoController {
    Logger logger = LoggerFactory.getLogger(ReactTodoController.class);

    private final TodoService todoService;

    public ReactTodoController(TodoService todoService) {
        this.todoService = todoService;
    }

    @GetMapping
    public List<Todo> getAllTodos() {
        logger.info("getAllTodos");
        return todoService.getAllTodos();
    }

    @PostMapping
    @CrossOrigin(origins = "http://localhost:3000")
    public ResponseEntity<Todo> createTodo(@RequestBody Todo newTodo) {
        logger.info("post - createTodo " + newTodo);
        return todoService.saveTodo(newTodo)
                .map(todo -> ResponseEntity.status(HttpStatus.OK).body(todo))
                .orElse(ResponseEntity.status(HttpStatus.NOT_FOUND).build());
    }
}
