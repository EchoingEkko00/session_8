package cal.al420445.dao;

import cal.al420445.model.Paiement;

public interface PaiementDao {
    void save(Paiement paiement);
    Paiement getPaiement(int id);
}
