package cal.al420445.dao;

import cal.al420445.model.Facture;

public interface FactureDao {
    void save(Facture facture);
    Facture getFacture(int id);

}
