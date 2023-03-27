package ca.cal.thymeleafdemo.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class GreetingController {
    @GetMapping("/greeting")
    public String greeting(@RequestParam(name="name", required = false,
            defaultValue = "Zak") String name, Model model) {
        model.addAttribute("name", name);
        return "greeting";
    }

    @GetMapping("/greeting/{name}")
    public String greetingName(@PathVariable("name") String name, Model model) {
        model.addAttribute("name", name);
        return "greeting";
    }
}