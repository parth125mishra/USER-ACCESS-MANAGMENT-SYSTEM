package com.dao;

import com.model.Request;
import com.model.Software;
import com.utils.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RequestDAO {
    private static final String INSERT_REQUEST_SQL = "INSERT INTO requests (user_id, software_id, access_type, reason, status) VALUES (?, ?, ?, ?, ?)";
    private static final String UPDATE_REQUEST_STATUS_SQL = "UPDATE requests SET status = ? WHERE id = ?";
    private static final String SELECT_PENDING_REQUESTS_SQL = "SELECT * FROM requests WHERE status = 'Pending'";
    private static final String SELECT_ALL_SOFTWARE_SQL= "SELECT id, name FROM software";

    // Add a new access request to the database
    public void addRequest(Request request) {
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_REQUEST_SQL)) {

            preparedStatement.setInt(1, request.getUserId());
            preparedStatement.setInt(2, request.getSoftwareId());
            preparedStatement.setString(3, request.getAccessType());
            preparedStatement.setString(4, request.getReason());
            preparedStatement.setString(5, request.getStatus());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Software> getAvailableSoftware() {
        List<Software> softwareList = new ArrayList<>();

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SOFTWARE_SQL);
             ResultSet rs = preparedStatement.executeQuery()) {

            while (rs.next()) {
                Software software = new Software();
                software.setId(rs.getInt("id"));
                software.setName(rs.getString("name"));
                softwareList.add(software);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return softwareList;
    }

    // Update the status of a request (approve/reject)
    public void updateRequestStatus(int requestId, String status) {
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_REQUEST_STATUS_SQL)) {

            preparedStatement.setString(1, status);
            preparedStatement.setInt(2, requestId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Get all pending requests
    public List<Request> getPendingRequests() {
        List<Request> requests = new ArrayList<>();
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PENDING_REQUESTS_SQL);
             ResultSet rs = preparedStatement.executeQuery()) {

            while (rs.next()) {
                Request request = new Request();
                // Populate the Request object with data from ResultSet
                request.setId(rs.getInt("id"));
                request.setUserId(rs.getInt("user_id"));  // Assuming 'user_id' is the column name in the DB
                request.setSoftwareId(rs.getInt("software_id"));  // Assuming 'software_id' is the column name in the DB
                request.setAccessType(rs.getString("access_type"));
                request.setReason(rs.getString("reason"));
                request.setStatus(rs.getString("status"));
                // Add the populated Request object to the list
                requests.add(request);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return requests;
    }


}
