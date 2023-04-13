package com.lacouf.chatgppt.dto;

import com.lacouf.chatgppt.model.Chat;
import com.lacouf.chatgppt.model.Customer;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ChatDto {
    private String nom;

    public Chat fromDto(Customer customer) {
        return Chat.builder()
                .customer(customer)
                .nom(nom)
                .build();
    }
}
