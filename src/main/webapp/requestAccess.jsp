<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Request Access</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
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

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 5px;
            font-weight: bold;
        }

        select, textarea, button {
            margin-bottom: 15px;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            padding: 10px;
            font-size: 16px;
            color: white;
            background-color: #4CAF50;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Request Access</h1>
        <form action="requestAccess" method="POST">
            <label for="software">Select Software:</label>
            <select id="software" name="software" required>
                <%
                    try {
                        // Fetch available software from the database
                        com.dao.RequestDAO requestDAO = new com.dao.RequestDAO();
                        java.util.List<com.model.Software> softwareList = requestDAO.getAvailableSoftware();

                        for (com.model.Software software : softwareList) {
                %>
                    <option value="<%= software.getId() %>"><%= software.getName() %></option>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<option value=''>Error fetching software</option>");
                    }
                %>
            </select>

            <label for="accessType">Access Type:</label>
            <select id="accessType" name="accessType" required>
                <option value="Read">Read</option>
                <option value="Write">Write</option>
                <option value="Admin">Admin</option>
            </select>

            <label for="reason">Reason for Request:</label>
            <textarea id="reason" name="reason" rows="5" required></textarea>

            <button type="submit">Submit Request</button>
        </form>
    </div>
</body>
</html>
