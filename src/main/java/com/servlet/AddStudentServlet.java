// AddStudentServlet.java
package com.servlet;

import com.dao.HostelDAO;
import com.model.Student;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

public class AddStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String idStr = request.getParameter("id");
            String name = request.getParameter("name");
            String room = request.getParameter("room");
            String dateStr = request.getParameter("date");
            String paidStr = request.getParameter("paid");
            String pendingStr = request.getParameter("pending");

            if (idStr == null || name == null || room == null || dateStr == null ||
                paidStr == null || pendingStr == null ||
                idStr.isEmpty() || name.isEmpty() || room.isEmpty() || dateStr.isEmpty() ||
                paidStr.isEmpty() || pendingStr.isEmpty()) {
                request.setAttribute("errorMessage", "All fields are required!");
                request.getRequestDispatcher("studentadd.jsp").forward(request, response);
                return;
            }

            int id = Integer.parseInt(idStr);
            double paid = Double.parseDouble(paidStr);
            double pending = Double.parseDouble(pendingStr);
            Date admissionDate = Date.valueOf(dateStr);

            Student student = new Student(id, name, room, admissionDate, paid, pending);

            HostelDAO dao = new HostelDAO();
            boolean success = dao.addStudent(student);

            if (success) {
                HttpSession session = request.getSession();
                session.setAttribute("message", "Student added successfully!");
                response.sendRedirect("displayStudents");
            } else {
                request.setAttribute("errorMessage", "Failed to add student. Please try again.");
                request.getRequestDispatcher("studentadd.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An unexpected error occurred: " + e.getMessage());
            request.getRequestDispatcher("studentadd.jsp").forward(request, response);
        }
    }
}

