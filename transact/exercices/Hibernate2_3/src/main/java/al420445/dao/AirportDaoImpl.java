package al420445.dao;

import al420445.airport.Airport;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import java.util.List;

public class AirportDaoImpl implements AirportDao {
    public List<Airport> getAirports() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("hibernate2.ex1");
        EntityManager em = emf.createEntityManager();

        em.getTransaction().begin();

        List<Airport> airports = em.createQuery("select airport from Airport airport", Airport.class).getResultList();

        em.getTransaction().commit();

        em.close();
        emf.close();

        return airports;
    }

    public void addPassenger(String name, int airportId) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("hibernate2.ex1");
        EntityManager em = emf.createEntityManager();

        em.getTransaction().begin();

        final Query query = em.createQuery("select pass from Passenger where name=?");
        query.setParameter(1, name);
        final List passengers = query.getResultList();
        if (!passengers.isEmpty()) {

        }


        em.getTransaction().commit();

        em.close();
        emf.close();
    }
}
