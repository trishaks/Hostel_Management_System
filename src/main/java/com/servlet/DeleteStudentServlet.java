// DeleteStudentServlet.java
package com.servlet;

import com.dao.HostelDAO;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class DeleteStudentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            new HostelDAO().deleteStudent(id);
            response.sendRedirect("displayStudents");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error deleting student: " + e.getMessage());
            request.getRequestDispatcher("studentdisplay.jsp").forward(request, response);
        }
    }
}

