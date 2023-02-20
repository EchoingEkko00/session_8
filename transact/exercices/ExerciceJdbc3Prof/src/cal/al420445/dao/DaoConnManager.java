package cal.al420445.dao;

import java.sql.SQLException;

public abstract class DaoConnManager {
    protected static final String JDBC_DRIVER = "org.h2.Driver";
    protected static final String DB_URL =
            "jdbc:h2:~/registrationexercice;AUTO_SERVER=true;INIT=RUNSCRIPT FROM '~/create.sql'";
    protected static final String USER = "sa";
    protected static final String PASS = "";

    protected static void handleException(Exception exception) {
        if (exception instanceof SQLException) {
            SQLException sqlException = (SQLException) exception;
            System.out.println("Error Code: " + sqlException.getErrorCode());
            System.out.println("SQL State: " + sqlException.getSQLState());
        }
        System.out.println("SQLException message: " + exception.getMessage());
        System.out.println("Stacktrace: ");
        exception.printStackTrace();
    }

    static {
        // STEP 1: Register JDBC driver
        try {
            Class.forName(JDBC_DRIVER);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
