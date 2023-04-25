package com.lacouf.reacttodo.service;

import com.lacouf.reacttodo.model.Todo;
import com.lacouf.reacttodo.repos.TodoRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.ArrayList;
import java.util.List;

import static org.mockito.Mockito.when;
import static org.assertj.core.api.Assertions.assertThat;

@ExtendWith(MockitoExtension.class)
public class TodoServiceTest {

    @Mock
    private TodoRepository repository;

    @InjectMocks
    private TodoService service;

    @Test
    public void testGetAllTodos() {
        // Arrange
        when(repository.findAll()).thenReturn(getListOfTodos());

        // Act
        final List<Todo> allTodos = service.getAllTodos();

        // Assert
        assertThat(allTodos.size()).isEqualTo(3);
        assertThat(allTodos.get(0).getText()).isEqualTo("todo1");
    }

    private List<Todo> getListOfTodos() {
        List<Todo> todoList = new ArrayList<>();
        todoList.add(Todo.builder()
                .id("1")
                .text("todo1")
                .day("Aujourd'hui")
                .reminder(false)
                .build());
        todoList.add(Todo.builder()
                .id("2")
                .text("todo2")
                .day("Hier")
                .reminder(true)
                .build());
        todoList.add(Todo.builder()
                .id("3")
                .text("todo3")
                .day("Demain")
                .reminder(false)
                .build());
        return todoList;
    }

}
