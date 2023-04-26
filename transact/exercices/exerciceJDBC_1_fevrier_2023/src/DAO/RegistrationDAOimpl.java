package DAO;

import model.Registration;

import java.sql.*;
import java.util.List;
import util.JDBCclass;

public class RegistrationDAOimpl implements RegistrationDAO {
    @Override
    public void save(Registration registration) {
        JDBCclass.save(registration);
    }

    @Override
    public void delete(Registration registration) {

    }

    @Override
    public void delete(int id) {

    }

    @Override
    public Registration get(int id) {
        return null;
    }

    @Override
    public List<Registration> getAll() {
        return null;
    }
}
