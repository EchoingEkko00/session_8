package org.cal.ca.christopher;

import org.cal.ca.christopher.service.DemoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.time.LocalDate;

@SpringBootApplication
public class SpringBootSemaine7Application implements CommandLineRunner {

	@Autowired
	private DemoService service;

	public static void main(String[] args) {
		SpringApplication.run(SpringBootSemaine7Application.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		service.saveEtudiant("Christopher","William");
		service.saveProf("Francois","Lacouf","prof@email.com",25, LocalDate.of(1989,02,1),true);
	}
}
