package cal.al420445.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NonNull;

import java.time.LocalDate;
@Data
@AllArgsConstructor
public class Paiement {
    @NonNull
    private int id;
    @NonNull
    private int factureId;
    private double amount;
    private LocalDate created;

    public Paiement(int factureId, double amount, LocalDate created) {
        this.factureId = factureId;
        this.amount = amount;
        this.created = created;
    }

}
