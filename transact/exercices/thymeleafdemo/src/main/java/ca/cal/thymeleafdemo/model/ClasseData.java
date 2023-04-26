package ca.cal.thymeleafdemo.model;

import lombok.Data;

import java.util.HashMap;
import java.util.Map;

@Data
public class ClasseData {
    private String name;
    private Map<String, String> countries = new HashMap<>();
    private String[] languages = new String[] { "Java", "C#", "Python", "JavaScript"};

    public ClasseData() {
        name = "John Doe";
        countries.put("CA", "Canada");
        countries.put("US", "United States");
        countries.put("FR", "France");
        countries.put("DE", "Germany");
        countries.put("JP", "Japan");
    }
}
