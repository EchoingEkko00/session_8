package ca.cal.al420445;

import ca.cal.al420445.airport.Passenger;
import ca.cal.al420445.airport.Ticket;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class Main2 {
    public static void main(String[] args) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("hibernate1.ex1");
        EntityManager em = emf.createEntityManager();

        em.getTransaction().begin();


        Passenger passenger = new Passenger("John");
        em.persist(passenger);

        Ticket t1 = new Ticket("ticket1");
        t1.setPassenger(passenger);
        em.persist(t1);

        Ticket t2 = new Ticket("ticket2");
        t2.setPassenger(passenger);
        em.persist(t2);


        em.getTransaction().commit();

        em.close();
        emf.close();
    }
}
