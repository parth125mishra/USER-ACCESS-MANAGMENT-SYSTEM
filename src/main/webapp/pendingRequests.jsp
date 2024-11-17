<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pending Requests</title>
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

        td button {
            padding: 5px 10px;
            font-size: 14px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .approve {
            background-color: #4CAF50;
            color: white;
        }

        .approve:hover {
            background-color: #45a049;
        }

        .reject {
            background-color: #f44336;
            color: white;
        }

        .reject:hover {
            background-color: #e53935;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Pending Requests</h1>
        <table>
            <tr>
                <th>Request ID</th>
                <th>Employee Name</th>
                <th>Software</th>
                <th>Access Type</th>
                <th>Reason</th>
                <th>Actions</th>
            </tr>
            <%
                try {
                    // Fetching pending requests from the database
                    com.dao.RequestDAO requestDAO = new com.dao.RequestDAO();
                    java.util.List<com.model.Request> pendingRequests = requestDAO.getPendingRequests();

                    for (com.model.Request req : pendingRequests) {
            %>
                        <tr>
                            <td><%= req.getId() %></td>
                            <td><%= req.getUserId() %></td> <!-- Employee Name (fetch this separately if needed) -->
                            <td><%= req.getSoftwareId() %></td> <!-- Software Name (fetch this separately if needed) -->
                            <td><%= req.getAccessType() %></td>
                            <td><%= req.getReason() %></td>
                            <td>
                                <form action="approveRequest" method="GET" style="display:inline;">
                                    <input type="hidden" name="requestId" value="<%= req.getId() %>">
                                    <input type="hidden" name="action" value="approve">
                                    <button type="submit" class="approve">Approve</button>
                                </form>
                                <form action="approveRequest" method="GET" style="display:inline;">
                                    <input type="hidden" name="requestId" value="<%= req.getId() %>">
                                    <input type="hidden" name="action" value="reject">
                                    <button type="submit" class="reject">Reject</button>
                                </form>
                            </td>
                        </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='6'>Error fetching pending requests.</td></tr>");
                }
            %>
        </table>
    </div>
</body>
</html>
