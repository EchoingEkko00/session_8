package com.lacouf.chatgppt.controller;

import com.lacouf.chatgppt.model.Customer;
import com.lacouf.chatgppt.repository.CustomerRepository;
import com.lacouf.chatgppt.service.DemoService;
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
    private DemoService demoService;

    @GetMapping("/newCustomer")
    public String showNewCustomerForm(Model model) {
        model.addAttribute("customer", new Customer());
        return "new-customer-form";
    }

    @PostMapping("/saveCustomer")
    public String saveCustomer(@ModelAttribute("customer") Customer customer) {
        demoService.save(customer);
        return "redirect:/customerList";
    }

    @GetMapping("/customerList")
    public String showCustomerList(Model model) {
        List<Customer> customers = demoService.findAll();
        model.addAttribute("customers", customers);
        return "customer-list";
    }

}
