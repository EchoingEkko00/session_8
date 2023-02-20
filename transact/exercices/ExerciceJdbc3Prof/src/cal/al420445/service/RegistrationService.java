package cal.al420445.service;

import cal.al420445.dao.FactureAndPaiementDAO;
import cal.al420445.dao.FactureDao;
import cal.al420445.dao.PaiementDao;
import cal.al420445.dao.RegistrationDAO;
import cal.al420445.model.Facture;
import cal.al420445.model.Paiement;
import cal.al420445.model.Registration;

public class RegistrationService {

    private final RegistrationDAO dao;
    private final FactureDao factureDao;
    private final PaiementDao paiementDao;

    private final FactureAndPaiementDAO factureAndPaiementDAO;

    public RegistrationService(RegistrationDAO dao, FactureDao factureDao, PaiementDao paiementDao, FactureAndPaiementDAO factureAndPaiementDAO){
        this.dao = dao;
        this.factureDao = factureDao;
        this.paiementDao = paiementDao;
        this.factureAndPaiementDAO = factureAndPaiementDAO;
    }
    public void createRegistration(String firstName, String lastName, int age) {
        dao.save(new Registration(lastName, firstName, age));
    }

    public Registration getRegistration(int registrationId) {
        return dao.get(registrationId);
    }

    public void createFacture(Facture facture) {
        factureDao.save(facture);
    }

    public void createPaiement(Paiement paiement) {
        paiementDao.save(paiement);
    }

    public void createPaimentAndFacture(Facture facture) {
        factureAndPaiementDAO.save(facture);
    }


    public Facture getFacture(int factureId) {
        return factureDao.getFacture(factureId);
    }

    public Paiement getPaiement(int paiementId) {
        return paiementDao.getPaiement(paiementId);
    }
}
