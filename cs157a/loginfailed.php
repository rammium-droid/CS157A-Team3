<!DOCTYPE html>
<html lang="en" style="background-color:aquamarine;">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log In</title>
</head>
<body align="center">
    <h1 align="center">Log In</h1>
    <p align="center" style="color:red">Wrong email or password. Please try again</p>
    <form method = "post" action = "signin.php" align="center">
        <p>Email: <input id="email" type="text" name="email_address"></p>
        <p>Password: <input id="password" type="Password" name="Password"></p>
        <button id="logIn">Log In</button>
    </form>
</body>
</html>