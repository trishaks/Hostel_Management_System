

// ReportServlet.java
package com.servlet;

import com.dao.HostelDAO;
import com.model.Student;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ReportServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String reportType = request.getParameter("reportType");
            HostelDAO dao = new HostelDAO();
            List<Student> result = null;

            switch (reportType) {
                case "pendingFees":
                    result = dao.getStudentsWithPendingFees();
                    break;
                case "room":
                    result = dao.getStudentsByRoom(request.getParameter("room"));
                    break;
                case "admissionDate":
                    result = dao.getStudentsAdmittedBetween(request.getParameter("startDate"), request.getParameter("endDate"));
                    break;
            }

            request.setAttribute("result", result);
            request.getRequestDispatcher("report_result.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Report generation failed: " + e.getMessage());
            request.getRequestDispatcher("report.jsp").forward(request, response);
        }
    }
}
