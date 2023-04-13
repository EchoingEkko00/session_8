package com.lacouf.chatgppt.controller;

import com.lacouf.chatgppt.dto.CustomerDto;
import com.lacouf.chatgppt.model.Customer;
import com.lacouf.chatgppt.repository.CustomerRepository;
import com.lacouf.chatgppt.service.DemoService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class CustomerController {

    private DemoService demoService;

    public CustomerController(DemoService demoService) {
        this.demoService = demoService;
    }

    @GetMapping("/newCustomer")
    public String showNewCustomerForm(Model model) {
        model.addAttribute("customer", new CustomerDto());
        return "new-customer-form";
    }

    @PostMapping("/saveCustomer")
    public String saveCustomer(@Valid @ModelAttribute("customer") CustomerDto customer,
                               BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "new-customer-form";
        }
        demoService.save(customer);
        return "redirect:/customerList";
    }

    @GetMapping("/customerList")
    public String showCustomerList(Model model) {
        List<CustomerDto> customers = demoService.findAll();
        model.addAttribute("customers", customers);
        return "customer-list";
    }

}
