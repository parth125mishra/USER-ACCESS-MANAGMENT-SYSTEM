<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Our Application</title>
    <style>
        /* Make the body and HTML take up the full page */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            color: white;
        }

     /* Full-page background image */
     .background {
         position: fixed; /* This makes it fixed and covers the whole page */
         top: 0;
         left: 0;
         width: 100%;
         height: 100%;
         background-image: url('https://img.freepik.com/free-photo/top-view-messy-office-workspace-with-tablet_23-2150282036.jpg'); /* Ensure this is a valid base64 string */
         background-size: cover; /* Ensures the image covers the entire page */
         background-position: center; /* Centers the image */
         background-repeat: no-repeat; /* Prevents repeating the image */
         z-index: -1; /* Makes sure the background stays behind other elements */
     }


        /* Centering the content both vertically and horizontally */
        .content {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
            text-align: center;
            position: relative;
            z-index: 1; /* Ensures content is on top of the background */
            flex-direction: column; /* Stack the content vertically */
        }

        h1 {
            font-size: 50px;
            margin-bottom: 30px;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.4);
        }

        p {
            font-size: 20px;
            margin-bottom: 40px;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.5);
        }

        .button-container {
            display: flex;
            justify-content: space-evenly;
            width: 100%;
            gap: 20px;
        }

        button {
            padding: 15px 40px;
            font-size: 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
            width: 60%;
        }

        .signup-btn {
            background-color: #4CAF50;
            color: white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
        }

        .signup-btn:hover {
            background-color: #45a049;
            transform: scale(1.1);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }

        .login-btn {
            background-color: #007BFF;
            color: white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
        }

        .login-btn:hover {
            background-color: #0056b3;
            transform: scale(1.1);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }

        button:active {
            transform: scale(1);
        }

    </style>
</head>
<body>
    <div class="background"></div> <!-- Full-page background image -->

    <div class="content">
        <h1>Welcome to Our Application</h1>
        <p>Join our platform to manage requests, track activities, and much more. Please sign up or log in to get started.</p>

        <div class="button-container">
            <!-- Signup Button -->
            <form action="signup.jsp" method="GET">
                <button type="submit" class="signup-btn">Sign Up</button>
            </form>

            <!-- Login Button -->
            <form action="login.jsp" method="GET">
                <button type="submit" class="login-btn">Log In</button>
            </form>
        </div>
    </div>

</body>
</html>
