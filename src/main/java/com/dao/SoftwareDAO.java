package com.dao;

import com.model.Software;
import com.utils.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SoftwareDAO {
    private static final String INSERT_SOFTWARE_QUERY = "INSERT INTO software (name, description, access_levels) VALUES (?, ?, ?)";
    private static final String SELECT_ALL_SOFTWARE = "SELECT * FROM software";

    public boolean addSoftware(Software software) {
        try (Connection conn = DatabaseConnection.getConnection()) {
            try (PreparedStatement stmt = conn.prepareStatement(INSERT_SOFTWARE_QUERY)) {
                stmt.setString(1, software.getName());
                stmt.setString(2, software.getDescription());
                stmt.setString(3, software.getAccessLevels());
                int rowsAffected = stmt.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Software> getAllSoftware() {
        List<Software> softwareList = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection()) {
            try (Statement stmt = conn.createStatement()) {
                ResultSet rs = stmt.executeQuery(SELECT_ALL_SOFTWARE);
                while (rs.next()) {
                    Software software = new Software();
                    software.setId(rs.getInt("id"));
                    software.setName(rs.getString("name"));
                    software.setDescription(rs.getString("description"));
                    software.setAccessLevels(rs.getString("access_levels"));
                    softwareList.add(software);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return softwareList;
    }
}

