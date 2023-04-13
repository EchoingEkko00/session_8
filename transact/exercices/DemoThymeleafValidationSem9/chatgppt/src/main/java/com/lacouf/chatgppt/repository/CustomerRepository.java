package com.lacouf.chatgppt.repository;

import com.lacouf.chatgppt.model.Customer;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CustomerRepository extends JpaRepository<Customer, Long> {
    @Query(value = "select c from Customer c join fetch c.chats")
    List<Customer> findAllWithChatsMethodeQueJaiInvente();

    @EntityGraph(attributePaths = {"chats"})
    List<Customer> findAll();

    @EntityGraph(attributePaths = {"chats"})
    List<Customer> findAllByNameIgnoreCase(String name);
}
