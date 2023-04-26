package cal.al420445.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

import java.time.LocalDate;

@Data
public class Facture {
    @NonNull
    private int id;
    private LocalDate created;
    private double amount;
    @NonNull
    private long registrationId;

    public Facture(long registrationId, double amount) {
        created = LocalDate.now();
        this.registrationId = registrationId;
        this.amount = amount;
    }

    public Facture(int id, double amount, LocalDate created, long registrationId) {
        this.id = id;
        this.amount = amount;
        this.created = created;
        this.registrationId = registrationId;
    }
}
