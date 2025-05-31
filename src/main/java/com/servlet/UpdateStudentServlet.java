package com.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class UpdateStudentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Replace with your actual DB credentials
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/your_database";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "password";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Set response content type
        response.setContentType("text/html");

        // Get parameters from request
        String studentId = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String roomNumber = request.getParameter("room");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish database connection
            conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);

            // Prepare SQL statement
            String sql = "UPDATE students SET name = ?, email = ?, room = ? WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, roomNumber);
            pstmt.setString(4, studentId);

            int rowsUpdated = pstmt.executeUpdate();

            if (rowsUpdated > 0) {
                response.getWriter().println("<h3>Student updated successfully!</h3>");
            } else {
                response.getWriter().println("<h3>No student found with ID: " + studentId + "</h3>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Error updating student: " + e.getMessage() + "</h3>");
        } finally {
            // Close resources
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }

    // Optional: support GET for testing
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
