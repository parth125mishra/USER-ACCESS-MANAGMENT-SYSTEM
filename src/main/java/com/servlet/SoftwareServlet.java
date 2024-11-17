package com.servlet;


import java.io.*;
import com.dao.SoftwareDAO;
import com.model.Software;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/createSoftware")
public class SoftwareServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to the software creation page
        request.getRequestDispatcher("/createSoftware.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Collect form data
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String[] accessLevels = request.getParameterValues("accessLevels");

        // Create a new software entry
        Software newSoftware = new Software();
        newSoftware.setName(name);
        newSoftware.setDescription(description);
        newSoftware.setAccessLevels(String.join(", ", accessLevels));

        // Save software in the database
        SoftwareDAO softwareDAO = new SoftwareDAO();
        softwareDAO.addSoftware(newSoftware);

        // Redirect to success page or software list page
        response.sendRedirect("softwareList.jsp");
    }
}

