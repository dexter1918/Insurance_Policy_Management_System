<%@page import="java.util.List"%>
<%@page import="exavalueBeans.policy"%>
<%@page import="exavaluModel.PolicyModel"%>
<%@page import="exavaluModel.CustomerModel"%>
<%@page import="exavalueBeans.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
    String sid = request.getParameter("cid");
    int cid = Integer.parseInt(sid);
    Customer e = CustomerModel.getCustomerId(cid, request);
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Assign Policy</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="utf-8" />
        <meta name="keywords" content="Insurance Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
              SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
        <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/newCSS/util.css">
        <link rel="stylesheet" type="text/css" href="css/newCSS/mainForAssignPolicy.css">
        <link href="css/newCSS/styleForAssignPolicy.css" type="text/css" rel="stylesheet" media="all">
        <!-- For the style of the input field -->
        <link rel="stylesheet" type="text/css" href="css/newCSS/styleForEditPolicyDetails.css">
        <!--===============================================================================================-->
        <!-- Custom Theme files -->
        <link href="css/newCSS/bootstrap.css" type="text/css" rel="stylesheet" media="all">
        <!-- <link href="css/newCSS/styleForAssignPolicy.css" type="text/css" rel="stylesheet" media="all"> -->
        <!-- how it works -->
        <link href="css/newCSS/timeline.css" type="text/css" rel="stylesheet" media="all">
        <!-- grid hover -->
        <link href="css/newCSS/hover.css" type="text/css" rel="stylesheet" media="all">
        <!-- font-awesome icons -->
        <!--<link href="css/newCSS/fontawesome-all.min.css" rel="stylesheet">-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" />
        <!-- overriding a bootstrap property -->
        <link href="css/newCSS/custom.css" type="text/css" rel="stylesheet" media="all">
        <!-- //Custom Theme files -->
        <!-- online-fonts -->
        <link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
              rel="stylesheet">
        <!-- //online-fonts -->
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet"
              href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
        <script>
            addEventListener("load", function () {
                setTimeout(hideURLbar, 0);
            }, false);

            function hideURLbar() {
                window.scrollTo(0, 1);
            }
        </script>
        <style>
            .assignPolicy {
                width: 81%;
                background-color: #fff;
                padding: 1% 0px 7% 1%;
                margin: 4% 0px 0px 9.5%;
                border-radius: 20px 20px 20px 20px;
            }
        </style>
    </head>

    <body>
        <%
            String name = (String) request.getSession().getAttribute("companyName");

        %>

        <br>
        <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-gradient-secondary">
                <h1>
                    <a class="navbar-brand text-white" href="homePage.jsp">
                        <%=name%> Insurance
                    </a>
                </h1>
                <button class="navbar-toggler ml-md-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-lg-auto text-center">
                        <li class="nav-item  mr-lg-3 mt-lg-0 mt-3">
                            <a class="nav-link" href="homePage.jsp">Home
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item  mr-lg-3 mt-lg-0 mt-3">
                            <a class="nav-link" href="Customers.jsp">Customers</a>
                        </li>

                        <li class="nav-item mr-lg-3 mt-lg-0 mt-3">
                            <a class="nav-link" href="Policys.jsp">Policies</a>
                        </li>

                        <li>
                            <a href="Logout">
                                <button type="button" class="btn  ml-lg-2 w3ls-btn" >
                                    <i class="fas fa-sign-out-alt"></i>
                                </button>
                            </a>
                        </li>

                    </ul>
                </div>

            </nav>
        </header>

        <br>

        <form action="AssignPolicy" method="post">
            <div class="assignPolicy">

                <h3 style="color: #0093d0;">Assign Policy to <%=e.getCustomerName()%> [CID - <%=e.getCustomerId()%>]</h3>

                <hr style="width:99%;text-align:left;margin-left:0">

                <div class="input-field">
                    <i class="fas fa-file-invoice"></i>
                    <input type="hidden" name="customerId" value="<%=e.getCustomerId()%>" >
                    <input name="policyId" type="text" placeholder="Enter the Policy ID to be assigned" required/>
                </div>

                <div class="button">
                    <input type="submit" value="Assign" class="btnn solid" />
                </div>

            </div>

        </form>

        <br>
        <h2 style="color: white; margin-left: 10%;">Available Policies</h2>

        <div class="container mb-3 mt-3">
            <table class="table table-striped table-bordered myDataTable" style="width: 100%" id="myTable">
                <thead id="myTableHeader" style="background-color: #6c7ae0; color: white;">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Expiry Date</th>
                        <th>Launch Date</th>
                        <th>Premium Amount</th>
                        <th>Coverage Amount</th>
                        <th>MinAgeOffering</th>
                        <th>MaxAgeOffering</th>
                        <th>Edit/Delete</th>
                    </tr>
                </thead>
                <tbody id="myTableBody">
                    <% List<policy> list = PolicyModel.getAllPolicys(request);
                        for (policy p : list) {
                    %>
                    <tr class="myTableData" style="color: gray; background-color: white">
                        <td><%=p.getPid()%></td>
                        <td><%=p.getName()%></td>
                        <td><%=p.getExpiryDate()%></td>
                        <td><%=p.getLaunchDate()%></td>
                        <td><%=p.getPremimumAmmount()%></td>
                        <td><%=p.getCoverageammount()%></td>
                        <td><%=p.getMinumumage()%></td>
                        <td><%=p.getMaxage()%></td>
                        <td>
                            <a href="EditPolicy.jsp?pid=<%=p.getPid()%>" class="edit">Edit</a>
                            <a href="Delete?pid=<%=p.getPid()%>">Delete</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>

        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.6.0/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>
        <script>
            $('.myDataTable').dataTable({
                "bPaginate": false,
                "bInfo": false
            });
        </script>
        <!--===============================================================================================-->
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script>
            $('.js-pscroll').each(function () {
                var ps = new PerfectScrollbar(this);

                $(window).on('resize', function () {
                    ps.update();
                })
            });
        </script>
        <!--===============================================================================================-->
        <script src="js/newJs/main.js"></script>

        <script src="js/newJs/jquery-2.2.3.min.js"></script>
        <!-- //js -->

        <!-- testimonials  Responsiveslides -->
        <script src="js/newJs/responsiveslides.min.js"></script>
        <script>
            // You can also use"$(window).load(function() {"
            $(function () {
                // Slideshow 4
                $("#slider3").responsiveSlides({
                    auto: true,
                    pager: true,
                    nav: false,
                    speed: 500,
                    namespace: "callbacks",
                    before: function () {
                        $('.events').append("<li>before event fired.</li>");
                    },
                    after: function () {
                        $('.events').append("<li>after event fired.</li>");
                    }
                });

            });
        </script>
        <!-- //testimonials  Responsiveslides -->
        <!-- start-smooth-scrolling -->
        <script src="js/newJs/move-top.js"></script>
        <script src="js/newJs/easing.js"></script>
        <script>
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();

                    $('html,body').animate({
                        scrollTop: $(this.hash).offset().top
                    }, 1000);
                });
            });
        </script>
        <!-- //end-smooth-scrolling -->
        <!-- smooth-scrolling-of-move-up -->
        <script>
            $(document).ready(function () {
                /*
                 var defaults = {
                 containerID: 'toTop', // fading element id
                 containerHoverID: 'toTopHover', // fading element hover id
                 scrollSpeed: 1200,
                 easingType: 'linear'
                 };
                 */
                $().UItoTop({
                    easingType: 'easeOutQuart'
                });
            });
        </script>
        <script src="js/newJs/SmoothScroll.min.js"></script>
        <!-- //smooth-scrolling-of-move-up -->
        <script src="js/newJs/counter.js"></script>
        <!-- //stats -->
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="js/newJs/bootstrap.js"></script>
    </body>
</html>
