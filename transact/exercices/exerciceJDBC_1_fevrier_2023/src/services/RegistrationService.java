package services;

import DAO.RegistrationDAO;
import model.Registration;

public class RegistrationService {
    RegistrationDAO dao;

    public RegistrationService(RegistrationDAO dao) {
        this.dao = dao;
    }

    public void createRegistration(long id, String lastName, String firstName, int age) {
        dao.save(new Registration(id,lastName,firstName,age));
    }
}
