package com.servlet;

import java.io.*;
import com.dao.RequestDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/approveRequest")
public class ApprovalServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve request ID from URL
        int requestId = Integer.parseInt(request.getParameter("requestId"));
        String action = request.getParameter("action");

        // Update request status based on the action (approve/reject)
        RequestDAO requestDAO = new RequestDAO();
        if (action.equals("approve")) {
            requestDAO.updateRequestStatus(requestId, "Approved");
        } else if (action.equals("reject")) {
            requestDAO.updateRequestStatus(requestId, "Rejected");
        }

        // Redirect back to the pending requests page
        response.sendRedirect("pendingRequests.jsp");
    }
}
