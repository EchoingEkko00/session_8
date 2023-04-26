package com.lacouf.chatgppt.repository;

import com.lacouf.chatgppt.model.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerRepository extends JpaRepository<Customer, Long> {
}
