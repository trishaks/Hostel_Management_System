<!DOCTYPE html>
<html>
<head>
    <title>Report Criteria</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            padding: 40px;
        }

        h2 {
            font-family: 'Georgia', serif;
            color: #2c3e50;
        }

        form {
            background-color: #fff;
            border: 2px solid #3498db;
            border-radius: 10px;
            padding: 25px;
            max-width: 500px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        p {
            font-weight: bold;
        }

        input[type="text"],
        input[type="date"] {
            margin: 5px 0 15px;
            padding: 8px;
            width: 90%;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        input[type="radio"] {
            margin-right: 8px;
        }

        input[type="submit"] {
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <h2>Generate Reports</h2>

    <form action="ReportServlet" method="post">
        <p>Select Report Type:</p>
        <label><input type="radio" name="reportType" value="pendingFees"> Students with Pending Fees</label><br>

        <label><input type="radio" name="reportType" value="room"> Students in Specific Room</label><br>
        Room Number: <input type="text" name="room"><br>

        <label><input type="radio" name="reportType" value="admissionDate"> Students Admitted Between Dates</label><br>
        From: <input type="date" name="startDate"> 
        To: <input type="date" name="endDate"><br><br>

        <input type="submit" value="Generate Report">
    </form>
</body>
</html>
