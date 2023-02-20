package al420445.service;

import al420445.airport.Airport;
import al420445.airport.Passenger;
import al420445.dao.AirportDao;
import al420445.dao.AirportDaoImpl;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import java.util.List;

public class AirportService {

    private final AirportDao airportDao;

    public AirportService(AirportDao airportDao) {
        this.airportDao = airportDao;
    }

    public List<Airport> getAirports() {
        return airportDao.getAirports();
    }

    public void addPassenger(String name, int airportId) {
        airportDao.addPassenger(name, airportId);


    }
}
