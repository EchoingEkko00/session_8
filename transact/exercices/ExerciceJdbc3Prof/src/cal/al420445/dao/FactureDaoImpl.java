package cal.al420445.dao;

import cal.al420445.model.Facture;
import cal.al420445.model.Registration;
import cal.al420445.utils.JDBCclass;

import java.sql.*;
import java.time.LocalDate;

public class FactureDaoImpl extends DaoConnManager implements FactureDao {
    private static String insertFacture = "INSERT INTO Facture(amount, created, registration_id) values(?,?,?);";
    private static String sqlPs = "SELECT id, amount, created, registration_id FROM Facture" +
            " WHERE id = ?;";



    @Override
    public void save(Facture facture) {
        try(Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
            PreparedStatement ps = conn.prepareStatement(insertFacture)) {
            conn.setAutoCommit(true);

            System.out.println();
            System.out.println("inserting records with prepared statement...");

            ps.setDouble(1, facture.getAmount());
            ps.setDate(2, java.sql.Date.valueOf(facture.getCreated()));
            ps.setLong(3, facture.getRegistrationId());

            ps.executeUpdate();
        } catch (SQLException e) {
            handleException(e);
        }
    }

    @Override
    public Facture getFacture(int id) {
        try(Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
            PreparedStatement ps = conn.prepareStatement(sqlPs);) {
            conn.setAutoCommit(false);

            // Select all records having ID equal or greater than 101
            System.out.println();
            System.out.println("retrieving statement...");

            ps.setInt(1, id);

            // NOTEZ le try à l'intérieur du try
            try (ResultSet rs = ps.executeQuery();) {
                if (rs.next()) {
                    return new Facture(rs.getInt(1),
                            rs.getDouble(2),
                            rs.getDate(3).toLocalDate(),
                            rs.getLong(4));
                }
            }
        } catch (SQLException e) {
            handleException(e);
        }
        return null;
    }
}
