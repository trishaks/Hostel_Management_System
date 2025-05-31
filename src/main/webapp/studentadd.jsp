<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<html>
<head>
    <title>Add Student</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f3f6f9;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 400px;
            margin: 50px auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-bottom: 5px;
            font-weight: bold;
            color: #444;
        }
        input[type="text"],
        input[type="date"],
        input[type="number"] {
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        input[type="submit"] {
            background-color: #4285f4;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #3367d6;
        }
        .msg {
            text-align: center;
            font-weight: bold;
            margin-bottom: 15px;
        }
        .success { color: green; }
        .failure, .error { color: red; }
    </style>
</head>
<body>
<div class="container">
    <h2>Add Student</h2>

    <%
        String msg = request.getParameter("msg");
        if ("success".equals(msg)) {
    %>
        <div class="msg success">Student added successfully!</div>
    <% } else if ("failure".equals(msg)) { %>
        <div class="msg failure">Failed to add student.</div>
    <% } else if ("error".equals(msg)) { %>
        <div class="msg error">An error occurred.</div>
    <% } %>

    <form action="AddStudentServlet" method="post">
        <label>Student ID:</label>
        <input type="text" name="id" required>

        <label>Name:</label>
        <input type="text" name="name" required>

        <label>Room Number:</label>
        <input type="text" name="room" required>

        <label>Admission Date:</label>
        <input type="date" name="date" required>

        <label>Fees Paid:</label>
        <input type="number" step="0.01" name="paid" required>

        <label>Pending Fees:</label>
        <input type="number" step="0.01" name="pending" required>

        <input type="submit" value="Add Student">
    </form>
</div>
</body>
</html>
