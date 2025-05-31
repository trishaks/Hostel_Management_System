package com.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class ReportCriteriaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("reportType");
        request.setAttribute("reportType", type);
        RequestDispatcher rd = request.getRequestDispatcher("report_result.jsp");
        rd.forward(request, response);
    }
}
