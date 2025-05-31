<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Hostel Management System</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f8ff;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 60%;
            margin: 80px auto;
            background: #ffffff;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            text-align: center;
        }

        h1 {
            font-size: 36px;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            margin: 15px 0;
        }

        a {
            text-decoration: none;
            display: inline-block;
            padding: 15px 30px;
            font-size: 18px;
            color: #fff;
            background-color: #3498db;
            border-radius: 12px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🏨 Hostel Management System</h1>
        <ul>
            <li><a href="studentadd.jsp">➕ Add Student</a></li>
            <li><a href="studentupdate.jsp">📝 Update Student</a></li>
            <li><a href="studentdelete.jsp">❌ Delete Student</a></li>
            <li><a href="studentdisplay.jsp">📄 Display Student</a></li>
            <li><a href="report_form.jsp">📊 Generate Report</a></li>
        </ul>
    </div>
</body>
</html>
