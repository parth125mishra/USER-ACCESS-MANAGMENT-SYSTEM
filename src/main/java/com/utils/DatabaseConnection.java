package com.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String URL = "jdbc:postgresql://localhost:5432/user_schema";
    private static final String USER = "postgres";
    private static final String PASSWORD = "admin";  // Change this to your password

    public static Connection getConnection() throws SQLException {
        try {
            // Load PostgreSQL JDBC Driver (Optional for newer JDBC versions)
            Class.forName("org.postgresql.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("PostgreSQL JDBC driver not found", e);
        }
    }
}

