package cal.al420445.dao;

import cal.al420445.model.Facture;
import cal.al420445.model.Paiement;

import java.sql.*;

public class FactureAndPaiementDaoImplH2 implements FactureAndPaiementDAO{
    private static final String JDBC_DRIVER = "org.h2.Driver";
    private static final String DB_URL =
            "jdbc:h2:~/registrationexercice;AUTO_SERVER=true;INIT=RUNSCRIPT FROM '~/create.sql'";
    private static final String USER = "sa";
    private static final String PASS = "";
    private static String insertFacture = "BEGIN TRANSACTION; INSERT INTO Facture(amount, created, registration_id) values(?,?,?);";

    private static String insertPaiement =
            "BEGIN TRANSACTION; INSERT INTO PAIEMENT(facture_id, amount, created) values(?,?,?);";
    private static String sqlPs = "SELECT id, amount, created, registration_id FROM Facture" +
            " WHERE id = ?;";

    static {
        // STEP 1: Register JDBC driver
        try {
            Class.forName(JDBC_DRIVER);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void save(Facture facture) {
        try(Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
            PreparedStatement ps = conn.prepareStatement(insertFacture)) {
            conn.setAutoCommit(false);

            System.out.println();
            System.out.println("inserting records with prepared statement...");

            ps.setDouble(1, facture.getAmount());
            ps.setDate(2, java.sql.Date.valueOf(facture.getCreated()));
            ps.setLong(3, facture.getRegistrationId());

            ps.executeUpdate();
            PreparedStatement ps2 = conn.prepareStatement(insertPaiement); {
                System.out.println();
                System.out.println("inserting records with prepared statement...");

                ps2.setInt(1, facture.getId());
                ps2.setDouble(2, facture.getAmount());
                ps2.setDate(3, java.sql.Date.valueOf(facture.getCreated()));

                ps2.executeUpdate();
                conn.commit();
            }
        } catch (SQLException e) {
            handleException(e);
        }
    }

    @Override
    public void delete(Facture facture, Paiement paiement) {

    }

    @Override
    public void get(int id) {

    }

    @Override
    public void getAll() {

    }

    private static void handleException(Exception exception) {
        if (exception instanceof SQLException) {
            SQLException sqlException = (SQLException) exception;
            System.out.println("Error Code: " + sqlException.getErrorCode());
            System.out.println("SQL State: " + sqlException.getSQLState());
        }
        System.out.println("SQLException message: " + exception.getMessage());
        System.out.println("Stacktrace: ");
        exception.printStackTrace();
    }
}
