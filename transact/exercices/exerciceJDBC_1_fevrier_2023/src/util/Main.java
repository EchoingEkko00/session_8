package util;

import DAO.RegistrationDAOimpl;
import services.RegistrationService;

public class Main {
    public static void main(String[] args) {
        final RegistrationDAOimpl dao = new RegistrationDAOimpl();
        final RegistrationService registrationService = new RegistrationService(dao);
        JDBCclass.createDatabase();
        registrationService.createRegistration(1,"Chris","archambault",20);
    }
}