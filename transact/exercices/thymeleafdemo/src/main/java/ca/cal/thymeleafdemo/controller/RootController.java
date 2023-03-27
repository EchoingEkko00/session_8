package ca.cal.thymeleafdemo.controller;

import ca.cal.thymeleafdemo.model.ClasseData;
import ca.cal.thymeleafdemo.service.MonService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/")
public class RootController {

    private final MonService service;

    public RootController(MonService service) {
        this.service = service;
    }

    @RequestMapping
    public String index(Model model) {
        model.addAttribute("pageTitle", "Hello, World!");
        model.addAttribute("users", List.of("Albert Einstein",
                "Niels Bohr",
                "James Clerk Maxwell"));
        model.addAttribute("classData", new ClasseData());
        return "index";
    }
}
