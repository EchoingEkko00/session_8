package com.lacouf.chatgppt;

import com.lacouf.chatgppt.dto.ChatDto;
import com.lacouf.chatgppt.dto.CustomerDto;
import com.lacouf.chatgppt.model.Customer;
import com.lacouf.chatgppt.service.DemoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.List;

@SpringBootApplication
public class ChatgpptApplication implements CommandLineRunner {

    @Autowired
    private DemoService demoService;

    public static void main(String[] args) {
        SpringApplication.run(ChatgpptApplication.class, args);
    }

    @Override
    public void run(String... args) throws Exception {
        demoService.save(CustomerDto.builder()
                .name("Samir")
                .address("1234 rue de la paix")
                .phone("514-123-4567")
                .email("l@l.com")
                .build());

        final CustomerDto customerDto = demoService.save(CustomerDto.builder()
                .name("Zak")
                .address("112 rue de la guerre")
                .phone("514-123-4534")
                .email("n@lol.com")
                .build());

        demoService.addChat(customerDto.getId(), ChatDto.builder()
                .nom("Chat1")
                .build());

        demoService.findAll();
    }
}
