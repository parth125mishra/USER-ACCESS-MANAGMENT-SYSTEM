package com.servlet;

import java.io.*;
import com.dao.RequestDAO;
import com.model.Request;
import com.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/requestAccess")
public class RequestServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to request access page
        request.getRequestDispatcher("/requestAccess.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Collect form data
        int softwareId = Integer.parseInt(request.getParameter("software"));
        String accessType = request.getParameter("accessType");
        String reason = request.getParameter("reason");

        // Get the logged-in user from session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // Check if the user is logged in
        if (user == null) {
            // If user is not logged in, redirect to login page
            response.sendRedirect("login.jsp");
            return;
        }

        // Create a new access request
        Request newRequest = new Request();
        newRequest.setUserId(user.getId());
        newRequest.setSoftwareId(softwareId);
        newRequest.setAccessType(accessType);
        newRequest.setReason(reason);
        newRequest.setStatus("Pending");

        // Save the access request to the database
        RequestDAO requestDAO = new RequestDAO();
        requestDAO.addRequest(newRequest);

        // Redirect to the confirmation page
        response.sendRedirect("accessRequestConfirmation.jsp");
    }
}
