package com.lacouf.chatgppt.controller;

import com.lacouf.chatgppt.model.Customer;
import com.lacouf.chatgppt.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class CustomerController {

    @Autowired
    private CustomerRepository customerRepository;

    @GetMapping("/newCustomer")
    public String showNewCustomerForm(Model model) {
        model.addAttribute("customer", new Customer());
        return "new-customer-form";
    }

    @PostMapping("/saveCustomer")
    public String saveCustomer(@ModelAttribute("customer") Customer customer) {
        customerRepository.save(customer);
        return "redirect:/customerList";
    }

    @GetMapping("/customerList")
    public String showCustomerList(Model model) {
        List<Customer> customers = customerRepository.findAll();
        model.addAttribute("customers", customers);
        return "customer-list";
    }

}
