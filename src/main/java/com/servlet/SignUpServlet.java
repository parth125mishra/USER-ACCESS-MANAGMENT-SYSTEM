package com.servlet;

import java.io.*;
import com.dao.UserDAO;
import com.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class SignUpServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to the signup.jsp page
        request.getRequestDispatcher("/signup.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Collect form data
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Create a new user
        User newUser = new User();
        newUser.setUsername(username);
        newUser.setPassword(password);
        newUser.setRole("Employee");// You should hash the password before storing it

        // Save user in the database
        UserDAO userDAO = new UserDAO();
        userDAO.addUser(newUser);

        // Redirect to login page after successful signup
        response.sendRedirect("login.jsp");
    }
}
