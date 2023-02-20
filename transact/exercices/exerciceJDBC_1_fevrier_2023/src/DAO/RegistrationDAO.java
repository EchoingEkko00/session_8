package DAO;

import model.Registration;

import java.util.List;

public interface RegistrationDAO {
    public void save(Registration registration);
    public void delete(Registration registration);

    public void delete(int id);

    public Registration get(int id);
    public List<Registration> getAll();
}
