<!Doctype html>
<html>
    <title>Admin Home</title>
    <style>
        .abc {
            width: 51%;
            height: 8%;

            position: absolute;
            top:0;
            bottom: 0;
            left: 0;
            right: 0;

            margin: auto;
        }

        .btn-group button {
            background-color: white; 
            border: 1px; /* Green border */
            color: #5995fd; /* White text */
            padding: 10px 24px; /* Some padding */
            cursor: pointer; /* Pointer/hand icon */
            float: left; /* Float the buttons side by side */
            margin-right: 7px;
            border-radius: 5px; 
        }

        /* Clear floats (clearfix hack) */
        .btn-group:after {
            content: "";
            clear: both;
            display: table;
        }

        .btn-group button:not(:last-child) {
            border-right: none; /* Prevent double borders */
        }

        /* Add a background color on hover */
        .btn-group button:hover {
            background-color: #3e8e41;
        }
    </style>
    <body  style="background-image: url(images/bannerBlurred.jpg)">
        <!--<h2 style="color: white; margin-left: 9%;">List of Companies...</h2>-->
        <div class="abc">
            <div class="btn-group">
                <button onclick="location.href = 'AdminCompany.jsp';">Companies</button>
                <button onclick="location.href = 'AdminCustomer.jsp';">Customers</button>
                <button onclick="location.href = 'AdminPolicy.jsp';">Policies</button>
                <button onclick="location.href = 'AdminCp.jsp';">Policies Of Customers</button>
                <button onclick="location.href = 'ClientMessage.jsp';">Clients' Message</button>        
            </div>
        </div>
        <button style="margin-left: 95%;" onclick="location.href = 'AdminLogout';">Logout</button>
</body>
</html>
