package al420445;

import al420445.airport.Airport;
import al420445.airport.OneWayTicket;
import al420445.airport.Passenger;
import al420445.airport.ReturnTicket;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import java.time.LocalDate;

public class Main5 {
    public static void main(String[] args) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("hibernate2.ex1");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();

        final TypedQuery<Airport> query =
                em.createQuery("select a from Airport a where lower(a.name) like 'henri%'", Airport.class);
        Airport airport = query.getSingleResult();
        var pass = new Passenger("Christopher");
        pass.setAirport(airport);
        pass.addTicket(new OneWayTicket(LocalDate.now()));
        pass.addTicket(new ReturnTicket(LocalDate.now().plusDays(5)));

        em.persist(pass);
        em.getTransaction().commit();
        em.close();
    }
}
