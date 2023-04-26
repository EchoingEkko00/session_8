package cal.al420445.dao;

import cal.al420445.model.Paiement;

import java.sql.*;

public class PaiementDaoImpl extends DaoConnManager implements PaiementDao {

    private static String insertPaiement =
            "BEGIN TRANSACTION; INSERT INTO PAIEMENT(facture_id, amount, created) values(?,?,?);COMMIT ;";
    private static String sqlPs = "SELECT id, facture_id, amount, created FROM Paiement" +
            " WHERE id = ?;";

    @Override
    public void save(Paiement paiement) {
        try(Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
            PreparedStatement ps = conn.prepareStatement(insertPaiement)) {
            conn.setAutoCommit(false);

            System.out.println();
            System.out.println("inserting records with prepared statement...");

            ps.setInt(1, paiement.getFactureId());
            ps.setDouble(2, paiement.getAmount());
            ps.setDate(3, java.sql.Date.valueOf(paiement.getCreated()));

            ps.executeUpdate();
        } catch (SQLException e) {
            handleException(e);
        }
    }

    @Override
    public Paiement getPaiement(int id) {
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
                    return new Paiement(rs.getInt(1),
                            rs.getInt(2),
                            rs.getDouble(3),
                            rs.getDate(4).toLocalDate());

                }
            }
        } catch (SQLException e) {
            handleException(e);
        }
        return null;
    }

}
