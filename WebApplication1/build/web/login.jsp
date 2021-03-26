<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script
            src="https://kit.fontawesome.com/64d58efce2.js"
            crossorigin="anonymous"
        ></script>
        <link rel="stylesheet" href="css/newCSS/style2.css" />
        <title>Login and Signup</title>
    </head>
    <body>
        <div class="container">
            <div class="forms-container">
                <div class="signin-signup">
                    <form name="myform" method="post" action="login" class="sign-in-form" onsubmit="return validateForm1()" required>
                        <h2 class="title">Sign In</h2>
                        <div class="input-field">
                            <i class="fas fa-user"></i>
                            <input name="email_address" type="email" placeholder="Company Email" />
                        </div>
                        <div class="input-field">
                            <i class="fas fa-lock"></i>
                            <input name="password" type="password" placeholder="Password" />
                        </div>
                        <input type="submit" value="Login" class="btn solid" />
                        <a href="#" style="font-size: 10px; color: #5995fd; text-decoration: none;">Forgot Password?</a>
                    </form>

                    <form name="sign-up-form" class="sign-up-form" action="CompanyServlet" method="post"
                          oninput='confirmPasswordFromSignup.setCustomValidity(confirmPasswordFromSignup.value != password.value ? "Passwords do not match." : "")'
                          onsubmit="return validateForm()" required>

                        <h2 class="title">Sign Up</h2>
                        <div class="input-field">
                            <i class="fas fa-user"></i>
                            <input name="companyname" type="text" placeholder="Company Name" />
                        </div>
                        <div class="input-field">
                            <i class="fas fa-envelope"></i>
                            <input name="companyemail" type="email" placeholder="Company Email" />
                        </div>
                        <div class="input-field">
                            <i class="fas fa-map-marker-alt"></i>
                            <input name="address" type="text" maxlength="100" placeholder="Company Address" />
                        </div>
                        <div class="input-field">
                            <i class="fa fa-phone"></i>
                            <input name="phonenumber" type="number" maxlength="10" placeholder="Company Phone Number" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"/>
                        </div>
                        <div class="input-field">
                            <i class="fas fa-lock"></i>
                            <input id="password1" name="password" type="password" pattern=".{6,12}" required title="6 to 12 characters" placeholder="Password" />
                        </div>
                        <div class="input-field">
                            <i class="fas fa-lock"></i>
                            <input id="password2" name="confirmPasswordFromSignup" type="password" pattern=".{6,12}" required title="6 to 12 characters" placeholder="Confirm Password" />
                        </div>
                        <input type="submit" class="btn" value="Sign up" />
                    </form>
                </div>
            </div>
            <div class="panels-container">
                <div class="panel left-panel">
                    <div class="content">
                        <h3>New here ?</h3>
                        <p>
                            Get the Experience of working with the best Insurance Policy Management System
                        </p>
                        <button class="btn transparent" id="sign-up-btn">
                            Sign up
                        </button>
                    </div>
                    <img src="images/log.svg" class="image" alt="" />
                </div>
                <div class="panel right-panel">
                    <div class="content">
                        <h3>One of us ?</h3>
                        <p>
                            Continue working with the best Insurance Policy Management System
                        </p>
                        <button class="btn transparent" id="sign-in-btn">
                            Sign in
                        </button>
                    </div>
                    <img src="images/register.svg" class="image" alt="" />
                </div>
            </div>
        </div>
        <script>
            function validateForm() {
                var companyname = document.forms["sign-up-form"]["companyname"].value;
                var companyemail = document.forms["sign-up-form"]["companyemail"].value;
                var address = document.forms["sign-up-form"]["address"].value;
                var phonenumber = document.forms["sign-up-form"]["phonenumber"].value;
                var password = document.forms["sign-up-form"]["password"].value;
                var confirmPasswordFromSignup = document.forms["sign-up-form"]["confirmPasswordFromSignup"].value;
                if (companyname === "" || companyemail === "" || address === "" || phonenumber === "" || password === "" || confirmPasswordFromSignup === "") {
                    alert("Every field must be filled out");
                    return false;
                }
            }
            function validateForm1() {
                var x = document.forms["myform"]["email_address"].value;
                var y = document.forms["myform"]["password"].value;
                if (x === "") {
                    alert("Company Email must be entered");
                    return false;
                }
                else if (y === ""){
                    alert("Password must be entered");
                    return false;                    
                }
            }
        </script>
        <script src="js/newJs/app.js"></script>
    </body>
</html>
