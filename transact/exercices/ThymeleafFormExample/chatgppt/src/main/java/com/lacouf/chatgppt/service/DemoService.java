package com.lacouf.chatgppt.service;

import com.lacouf.chatgppt.model.Customer;
import com.lacouf.chatgppt.repository.CustomerRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DemoService {

    private final CustomerRepository customerRepository;

    public DemoService(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    public Customer save(Customer customer) {
        return customerRepository.save(customer);
    }

    public List<Customer> findAll() {
        return customerRepository.findAll();
    }
}
