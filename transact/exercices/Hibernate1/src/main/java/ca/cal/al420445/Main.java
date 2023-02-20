package ca.cal.al420445;

import ca.cal.al420445.airport.Airport;
import ca.cal.al420445.airport.Passenger;
import ca.cal.al420445.airport.Ticket;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class Main {

    public static void main(String[] args) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("hibernate1.ex1");
        EntityManager em = emf.createEntityManager();

        em.getTransaction().begin();

        Airport airport = new Airport(1, "Henri Coanda");

        Passenger john = new Passenger( "Moukaila Smith");
        john.setAirport(airport);
        Passenger mike = new Passenger( "Michael Johnson");
        mike.setAirport(airport);
        airport.addPassenger(john);
        airport.addPassenger(mike);

        Ticket ticket1 = new Ticket("AA1234");
        ticket1.setPassenger(john);

        Ticket ticket2 = new Ticket("BB5678");
        ticket2.setPassenger(john);

        john.addTicket(ticket1);
        john.addTicket(ticket2);

        Ticket ticket3 = new Ticket("CC0987");
        ticket3.setPassenger(mike);
        mike.addTicket(ticket3);

        em.persist(airport);
        em.persist(john);
        em.persist(mike);

        em.persist(ticket1);
        em.persist(ticket2);
        em.persist(ticket3);

        em.getTransaction().commit();

        em.close();
        emf.close();

    }
}
