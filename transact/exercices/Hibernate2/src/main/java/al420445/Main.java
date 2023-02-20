package al420445;

import al420445.airport.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.time.LocalDate;

public class Main {

    public static void main(String[] args) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("hibernate2.ex1");
        EntityManager em = emf.createEntityManager();

        em.getTransaction().begin();

        Airport airport = new Airport("Henri Coanda");

        Passenger moukaila = new Passenger("Moukaila Smith");
        Address address = new Address();
        address.setStreet("street");
        address.setCity("city");
        address.setProvince("province");
        address.setCodePostal("code");
        moukaila.setAddress(address);

        moukaila.setAirport(airport);
        Passenger mike = new Passenger("Michael Johnson");
        mike.setAirport(airport);
        airport.addPassenger(moukaila);
        airport.addPassenger(mike);
/*
        OneWayTicket ticket1 = new OneWayTicket();
        ticket1.setNumber("AA1234");
        ticket1.setLatestDepartureDate(LocalDate.now());
        ticket1.setPassenger(moukaila);

        ReturnTicket ticket2 = new ReturnTicket();
        ticket2.setNumber("BB5678");
        ticket2.setLatestReturnDate(LocalDate.now());
        ticket2.setPassenger(moukaila);

        moukaila.addTicket(ticket1);
        moukaila.addTicket(ticket2);

        OneWayTicket ticket3 = new OneWayTicket();
        ticket3.setNumber("CC6767");
        ticket3.setLatestDepartureDate(LocalDate.now());
        ticket3.setPassenger(mike);
        mike.addTicket(ticket3);*/

        em.persist(airport);
        em.persist(moukaila);
        em.persist(mike);
/*

        em.persist(ticket1);
        em.persist(ticket2);
        em.persist(ticket3);
*/

        em.getTransaction().commit();

        em.close();
        emf.close();

    }
}
