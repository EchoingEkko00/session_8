package al420445.airport;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import java.time.LocalDate;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@DiscriminatorValue("O")
public class OneWayTicket extends Ticket {
    private LocalDate latestDepartureDate;

    public LocalDate getLatestDepartureDate() {
        return latestDepartureDate;
    }

    public void setLatestDepartureDate(LocalDate latestDepartureDate) {
        this.latestDepartureDate = latestDepartureDate;
    }
}
