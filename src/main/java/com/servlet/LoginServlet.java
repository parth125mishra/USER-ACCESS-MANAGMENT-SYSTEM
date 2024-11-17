package com.servlet;

import java.io.*;
import com.dao.UserDAO;
import com.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to login.jsp page
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Collect form data
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Validate user credentials
        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserByUsername(username);

        if (user != null && user.getPassword().equals(password)) {  // Password should be hashed
            // Create session for the user
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // Redirect based on user role
            if (user.getRole().equals("Employee")) {
                response.sendRedirect("requestAccess.jsp");
            } else if (user.getRole().equals("Manager")) {
                response.sendRedirect("pendingRequests.jsp");
            } else if (user.getRole().equals("Admin")) {
                response.sendRedirect("createSoftware.jsp");
            }
        } else {
            // Invalid credentials
            response.sendRedirect("login.jsp?error=true");
        }
    }
}

