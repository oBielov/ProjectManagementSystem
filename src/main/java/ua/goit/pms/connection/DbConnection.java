package ua.goit.pms.connection;

import java.sql.Connection;
import java.sql.SQLException;

@FunctionalInterface
public interface DbConnection {
    Connection getConnection() throws SQLException;
}
