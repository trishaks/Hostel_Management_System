<!DOCTYPE html>
<html>
<head>
    <title>Update Student</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f7;
            margin: 0;
            padding: 40px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
        }

        .form-container {
            background-color: #ffffff;
            border: 2px solid #3498db;
            border-radius: 10px;
            padding: 30px;
            width: 400px;
            margin: 0 auto;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="date"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        input[type="submit"] {
            background-color: #3498db;
            color: white;
            padding: 12px;
            margin-top: 20px;
            border: none;
            border-radius: 5px;
            width: 100%;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <h2>Update Student</h2>
    <div class="form-container">
        <form action="UpdateStudentServlet" method="post">
            <label>Student ID:</label>
            <input type="text" name="id" required>

            <label>Name:</label>
            <input type="text" name="name" required>

            <label>Room No:</label>
            <input type="text" name="room" required>

            <label>Admission Date:</label>
            <input type="date" name="date" required>

            <label>Fees Paid:</label>
            <input type="text" name="paid" required>

            <label>Pending Fees:</label>
            <input type="text" name="pending" required>

            <input type="submit" value="Update Student">
        </form>
    </div>
</body>
</html>
