<%@ page import="java.util.List" %>
<%@ page import="com.model.Student" %>
<%
    List<Student> result = (List<Student>) request.getAttribute("result");
%>
<!DOCTYPE html>
<html>
<head><title>Report Result</title></head>
<body>
    <h2>Report Results</h2>
    <table border="1">
        <tr>
            <th>ID</th><th>Name</th><th>Room</th><th>Admission Date</th><th>Fees Paid</th><th>Pending Fees</th>
        </tr>
        <%
        if (result != null && !result.isEmpty()) {
            for (Student s : result) {
        %>
        <tr>
            <td><%= s.getStudentID() %></td>
            <td><%= s.getStudentName() %></td>
            <td><%= s.getRoomNumber() %></td>
            <td><%= s.getAdmissionDate() %></td>
            <td><%= s.getFeesPaid() %></td>
            <td><%= s.getPendingFees() %></td>
        </tr>
        <% } } else { %>
        <tr><td colspan="6">No records found for the selected report.</td></tr>
        <% } %>
    </table>
</body>
</html>
