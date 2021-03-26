<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> Login Page </title>
<style>
Body {
  font-family: Calibri, Helvetica, sans-serif;
}
button {
       background-color: #5995fd;
       width: 100%;
        color: white;
        padding: 15px;
        margin: 10px 0px;
        border: none;
        cursor: pointer;
         }
 /* form {
        border: 3px ;
    } */
 input[type=text], input[type=password] {
        width: 100%;
        margin: 8px 0;
        padding: 12px 20px;
        display: inline-block;
        border: 2px solid #5995fd;
        box-sizing: border-box;
    }
 button:hover {
        opacity: 0.7;
    }
  .cancelbtn {
        width: auto;
        padding: 10px 18px;
        margin: 10px 5px;
    }

    .container {
        margin-top: 1%;
        margin-left: 38%;
        width: 20%;
        padding: 20px 25px 25px 25px;
        background-color: lightblue;
    }
</style>
</head>
<body>
    <center> <h1 style="margin-top: 10%;"> Admin Login Form </h1> </center>
    <form action="Admins" method="post">
        <div class="container">
            <label>Username : </label>
            <input type="text" placeholder="Enter Username" name="name" required>
            <label>Password : </label>
            <input type="password" placeholder="Enter Password" name="password" required>
            <button type="submit">Login</button>
        </div>
    </form>
</body>
</html>
