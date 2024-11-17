<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Software</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }

        h1 {
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
        }

        input, textarea, .checkbox-group, button {
            margin-bottom: 15px;
        }

        input, textarea {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 100%;
        }

        .checkbox-group label {
            display: inline-block;
            margin-right: 10px;
        }

        button {
            padding: 10px;
            font-size: 16px;
            color: white;
            background-color: #4CAF50;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Create Software</h1>
        <form action="createSoftware" method="POST">
            <label for="name">Software Name:</label>
            <input type="text" id="name" name="name" placeholder="Enter software name" required>

            <label for="description">Description:</label>
            <textarea id="description" name="description" rows="5" placeholder="Enter a brief description" required></textarea>

            <label>Access Levels:</label>
            <div class="checkbox-group">
                <label><input type="checkbox" name="accessLevels" value="Read"> Read</label>
                <label><input type="checkbox" name="accessLevels" value="Write"> Write</label>
                <label><input type="checkbox" name="accessLevels" value="Admin"> Admin</label>
            </div>

            <button type="submit">Create Software</button>
        </form>
    </div>
</body>
</html>
