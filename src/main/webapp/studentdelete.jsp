<!DOCTYPE html>
<html>
<head>
    <title>Delete Student</title>
    <style>
        body {
            font-family: 'Trebuchet MS', sans-serif;
            background-color: #f9f9f9;
            padding: 50px;
        }

        h2 {
            text-align: center;
            color: #c0392b;
        }

        .form-box {
            width: 350px;
            margin: 0 auto;
            padding: 25px;
            background-color: #ffffff;
            border: 2px solid #e74c3c;
            border-radius: 10px;
            box-shadow: 0 0 12px rgba(0, 0, 0, 0.1);
        }

        label {
            font-weight: bold;
            color: #555;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-top: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        input[type="submit"] {
            background-color: #e74c3c;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            width: 100%;
            font-size: 15px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>
    <h2>Delete Student</h2>
    <div class="form-box">
        <form action="DeleteStudentServlet" method="get">
            <label>Student ID:</label>
            <input type="text" name="id" required>
            <input type="submit" value="Delete Student">
        </form>
    </div>
</body>
</html>
