<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.model.Software, com.dao.SoftwareDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Software List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        .add-button {
            display: inline-block;
            padding: 10px 15px;
            font-size: 14px;
            color: white;
            background-color: #4CAF50;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            margin-bottom: 20px;
        }

        .add-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Software List</h1>

        <!-- Link to create new software -->
        <a href="createSoftware.jsp" class="add-button">Add New Software</a>

        <!-- Software table -->
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Access Levels</th>
            </tr>
            <%
                try {
                    // Fetch software list from SoftwareDAO
                    SoftwareDAO softwareDAO = new SoftwareDAO();
                    List<Software> softwareList = softwareDAO.getAllSoftware();

                    for (Software software : softwareList) {
            %>
                        <tr>
                            <td><%= software.getId() %></td>
                            <td><%= software.getName() %></td>
                            <td><%= software.getDescription() %></td>
                            <td><%= software.getAccessLevels() %></td>
                        </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='4'>Error fetching software list.</td></tr>");
                }
            %>
        </table>
    </div>
</body>
</html>
