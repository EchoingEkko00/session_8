package cal.al420445.dao;

import cal.al420445.model.Facture;
import cal.al420445.model.Paiement;

public interface FactureAndPaiementDAO {
    void save(Facture facture);
    void delete(Facture facture, Paiement paiement);

    void get(int id);

    void getAll();
}
