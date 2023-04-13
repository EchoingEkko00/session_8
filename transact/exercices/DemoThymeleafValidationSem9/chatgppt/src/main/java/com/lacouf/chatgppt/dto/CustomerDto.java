package com.lacouf.chatgppt.dto;

import com.lacouf.chatgppt.model.Customer;
import jakarta.persistence.Column;
import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CustomerDto {

    private Long id;
    @NotNull
    @NotBlank(message = "Doit entrer un nom")
    @Column(name = "name")
    private String name;

    @NotBlank(message = "Doit entrer une adresse")
    @Column(name = "address")
    private String address;

    @NotBlank(message = "Doit entrer un téléphone")
    @Column(name = "phone")
    @Pattern(regexp = "^\\d{3}-\\d{3}-\\d{4}$", message = "Doit être au format 123-456-7890")
    private String phone;

    //@Min(value = 5, message = "Doit avoir au moins 5 caractères")
    //@Max(value = 20, message = "Doit avoir au plus 20 caractères")
    @Size(min = 5, max = 20, message = "Doit avoir entre 5 et 20 caractères")
    private String note;

    @Email(message = "Doit être une adresse courriel valide")
    private String email;

    public CustomerDto(Customer customer) {
        this.id = customer.getId();
        this.name = customer.getName();
        this.address = customer.getAddress();
        this.phone = customer.getPhone();
        this.note = customer.getNote();
        this.email = customer.getEmail();
    }

    public Customer fromDto() {
        return Customer.builder()
                .id(id)
                .name(name)
                .address(address)
                .phone(phone)
                .note(note)
                .email(email)
                .build();
    }

}
