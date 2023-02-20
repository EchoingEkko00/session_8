package al420445;

import al420445.airport.Airport;
import al420445.airport.Passenger;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class Main4 {
    public static void main(String[] args) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("hibernate2.ex1");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();

        var p1 = em.find(Passenger.class, 1);

        //final Passenger cedric = new Passenger("Cedric");
        //em.persist(cedric);

        em.getTransaction().commit();
        em.close();


        System.out.println(p1);



        em = emf.createEntityManager();
        em.getTransaction().begin();

        em.flush();
        var airport = em.find(Airport.class, 2);
        p1.setAirport(airport);

        em.merge(p1);
        em.getTransaction().commit();
        em.close();

        System.out.println(p1);
    }
}
