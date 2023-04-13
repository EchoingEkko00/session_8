package com.lacouf.chatgppt.service;

import com.lacouf.chatgppt.dto.ChatDto;
import com.lacouf.chatgppt.repository.ChatRepository;
import com.lacouf.chatgppt.model.Customer;
import com.lacouf.chatgppt.repository.CustomerRepository;
import org.springframework.stereotype.Service;
import com.lacouf.chatgppt.dto.CustomerDto;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class DemoService {

    private final CustomerRepository customerRepository;
    private final ChatRepository chatRepository;

    public DemoService(CustomerRepository customerRepository,
                       ChatRepository chatRepository) {
        this.customerRepository = customerRepository;
        this.chatRepository = chatRepository;
    }

    public CustomerDto save(CustomerDto customerDto) {
        return new CustomerDto(customerRepository.save(customerDto.fromDto()));
    }

    public List<CustomerDto> findAll() {
        List<CustomerDto> dtos = new ArrayList<>();
        for (Customer customer : customerRepository.findAll()) {
            dtos.add(CustomerDto.builder().name(customer.getName())
                    .email(customer.getEmail())
                    .address(customer.getAddress())
                    .phone(customer.getPhone())
                    .note(customer.getNote())
                    .build());

            System.out.println("Customer: " + customer.getName() + " " + customer.getChats());
        }


        return dtos;
    }

    public void addChat(long clientId, ChatDto chat1) {
        final Optional<Customer> clientIdOpt = customerRepository.findById(clientId);
        if (clientIdOpt.isEmpty()) {
            throw new RuntimeException("Client not found");
        }
        chatRepository.save(chat1.fromDto(clientIdOpt.get()));
    }
}
