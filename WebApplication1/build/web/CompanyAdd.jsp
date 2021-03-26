<%-- 
    Document   : CompanyAdd
    Created on : 10 Mar, 2021, 10:15:31 AM
    Author     : Thomas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            * {
                box-sizing: border-box;
            }

            input[type=text], select, textarea {
                width: 100%;
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 4px;
                resize: vertical;
            }

            label {
                padding: 12px 12px 12px 0;
                display: inline-block;
            }

            input[type=submit] {
                background-color: #4CAF50;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                float: right;
            }

            input[type=submit]:hover {
                background-color: #45a049;
            }

            .container {
                border-radius: 5px;
                background-color: #f2f2f2;
                padding: 20px;
            }

            .col-25 {
                float: left;
                width: 25%;
                margin-top: 6px;
            }

            .col-75 {
                float: left;
                width: 75%;
                margin-top: 6px;
            }

            /* Clear floats after the columns */
            .row:after {
                content: "";
                display: table;
                clear: both;
            }

            /* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
            @media screen and (max-width: 600px) {
                .col-25, .col-75, input[type=submit] {
                    width: 100%;
                    margin-top: 0;
                }
            }
        </style>



    </head>
    <body>
        <div class="container">
            <form action="CompanyServlet" method="post">
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Company Id</label>
                    </div>
                    <div class="col-75">
                        <input type="text" id="fname" name="company_id" placeholder="Company id..">
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="lname">Company Name</label>
                    </div>
                    <div class="col-75">
                        <input type="text" id="lname" name="companyname" placeholder="Your last name..">
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="country">Company Email</label>
                    </div>
                    <div class="col-75">
                        <input type="text" name="companyemail">
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="Company Password">Company Password</label>
                    </div>
                    <div class="col-75">
                        <input type="text" name="password">
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="subject">Company Address</label>
                    </div>
                    <div class="col-75">
                        <textarea id="subject" name="address" placeholder="Write something.." style="height:200px"></textarea>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="subject">Company PhoneNumber</label>
                    </div>
                    <div class="col-75">
                        <input type="text" name="phonenumber" >
                    </div>
                </div>
                <br>
                <div class="row">
                    <input type="submit" value="Submit">
                </div>
            </form>
        </div>




    </body>
</html>
