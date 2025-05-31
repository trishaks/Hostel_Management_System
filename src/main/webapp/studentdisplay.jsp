<%@ page import="java.util.*, com.model.Student, com.dao.HostelDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Records</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef2f7;
            padding: 20px;
        }

        .container {
            width: 90%;
            margin: 40px auto;
            background-color: #fff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px 12px;
            border: 1px solid #ccc;
            text-align: center;
        }

        th {
            background-color: #3498db;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        tr:hover {
            background-color: #e2f0fb;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>All Hostel Students</h2>
    <table>
        <tr>
            <th>Student ID</th>
            <th>Name</th>
            <th>Room Number</th>
            <th>Admission Date</th>
            <th>Fees Paid</th>
            <th>Pending Fees</th>
        </tr>
        <%
            HostelDAO dao = new HostelDAO();
            List<Student> students = dao.getAllStudents();
            for (Student student : students) {
        %>
        <tr>
            <td><%= student.getStudentID() %></td>
            <td><%= student.getStudentName() %></td>
            <td><%= student.getRoomNumber() %></td>
            <td><%= student.getAdmissionDate() %></td>
            <td><%= student.getFeesPaid() %></td>
            <td><%= student.getPendingFees() %></td>
        </tr>
        <%
            }
        %>
        
    </table>
    <div style="display: flex; justify-content: center; align-items: center;">
  <a href="index.jsp" style="display:inline-block; padding:10px 20px; background-color:#007bff; color:white; text-decoration:none; border-radius:5px; font-size:16px; font-weight:bold;">Back to Home</a>
</div>
</div>


</body>
</html>
