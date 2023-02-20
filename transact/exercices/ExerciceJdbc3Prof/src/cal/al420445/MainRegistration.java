package cal.al420445;

import cal.al420445.dao.*;
import cal.al420445.model.Facture;
import cal.al420445.model.Paiement;
import cal.al420445.model.Registration;
import cal.al420445.service.RegistrationService;

public class MainRegistration {
    public static void main(String[] args) {
        final RegistrationDAO dao = new RegistrationDAOH2Impl();
        final FactureDao daoFacture = new FactureDaoImpl();
        final PaiementDao daoPaiement = new PaiementDaoImpl();
        final FactureAndPaiementDAO factureAndPaiementDAO = new FactureAndPaiementDaoImplH2();

        final RegistrationService registrationService = new RegistrationService(dao, daoFacture, daoPaiement, factureAndPaiementDAO);
    //  registrationService.createRegistration("Cedric", "NoSe", 18);
    //  registrationService.createRegistration("Marc", "NoSe", 20);

        final Registration registration1 = registrationService.getRegistration(1);
        System.out.println(registration1);
        System.out.println(registrationService.getRegistration(2));

        registrationService.createFacture(new Facture(registration1.getId(), 12.24));
        final Facture facture = registrationService.getFacture(1);
        System.out.println(facture);

        registrationService.createPaiement(new Paiement(facture.getId(), facture.getAmount(), facture.getCreated()));
        System.out.println(registrationService.getPaiement(1));

        //Mes tests
        final Registration registration2 = registrationService.getRegistration(2);
        registrationService.createPaimentAndFacture(new Facture(registration2.getId(), 45.67));

    }
}
