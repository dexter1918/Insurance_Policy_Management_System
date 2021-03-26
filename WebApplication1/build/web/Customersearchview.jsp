<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Customers</title>
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
        <link rel="stylesheet" type="text/css" href="css/newCSS/mainForCustomer.css">
        <link rel="stylesheet" type="text/css" href="css/newCSS/styleForCustomer.css">
        <!--===============================================================================================-->
        <!-- Custom Theme files -->
        <link href="css/newCSS/bootstrap.css" type="text/css" rel="stylesheet" media="all">
        <link href="css/newCSS/styleForPolicyCustomer.css" type="text/css" rel="stylesheet" media="all">
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
        <script>
            addEventListener("load", function () {
                setTimeout(hideURLbar, 0);
            }, false);

            function hideURLbar() {
                window.scrollTo(0, 1);
            }
        </script>
        <style>
            .searchDiv {
                width: 92%;
                margin: 4% 0px 0px 4%;
                border-radius: 20px 20px 20px 20px;
            }
            .container-table10155 {
                width: 100%;
                min-height: 60vh;
                /*background: #fff;*/

                display: -webkit-box;
                display: -webkit-flex;
                display: -moz-box;
                display: -ms-flexbox;
                display: flex;
                align-items: center;
                justify-content: center;
                flex-wrap: wrap;
                padding: 33px 30px;
            }
        </style>
    </head>
    <body>
        <%
    
      String name = (String) request.getSession().getAttribute("companyName");

%>
        <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-gradient-secondary">
                <h1>
                    <a class="navbar-brand text-white" href="homePage.jsp">
                       <%=name  %> Insurance
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
                        <li class="nav-item mr-lg-3 mt-lg-0 mt-3">
                            <a class="nav-link" href="Customers.jsp">Customers</a>
                        </li>
                        <li class="nav-item mr-lg-3 mt-lg-0 mt-3">
                            <a class="nav-link" href="Policys.jsp">Policies</a>
                        </li>
                        <li class="nav-item mr-lg-3 mt-lg-0 mt-3">
                            <a class="nav-link" href="AddCustomer.jsp">Add Customer</a>
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
        <br><br>
        <!-- Table -->
        <div class="limiter">
            <div class="container-table10155">
                <div class="wrap-table100">
                <h2 style="color: white;">Customer Search Result...</h2>
                    <div class="table100 ver1 m-b-110">
                        <div class="table100-head">
                            <table>
                                <thead>
                                    <tr class="row100 head">
                                        <th class="cell100 column1">Name</th>
                                        <th class="cell100 column2">Occupation</th>
                                        <th class="cell100 column3">Age</th>
                                        <th class="cell100 column4">Gender</th>
                                        <th class="cell100 column5">Annual Income</th>
                                        <th class="cell100 column6">City</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="table100-body js-pscroll">
                            <table>
                                <tbody>
                                    <%
                                        int count = 0;
                                        String color = "#F9EBB3";
                                        if (request.getAttribute("piList") != null) {
                                            ArrayList al = (ArrayList) request.getAttribute("piList");
                                            System.out.println(al);
                                            Iterator itr = al.iterator();
                                            while (itr.hasNext()) {

                                                if ((count % 2) == 0) {
                                                    color = "#eeffee";
                                                }
                                                count++;
                                                ArrayList pList = (ArrayList) itr.next();
                                    %>
                                    <tr class="row100 body">
                                        <td class="cell100 column1"><%=pList.get(0)%></td>
                                        <td class="cell100 column2"><%=pList.get(1)%></td>
                                        <td class="cell100 column3"><%=pList.get(2)%></td>
                                        <td class="cell100 column4"><%=pList.get(3)%></td>
                                        <td class="cell100 column5"><%=pList.get(4)%></td>
                                        <td class="cell100 column6"><%=pList.get(9)%></td>
                                    </tr>
                                    <% }
                               }
                               if (count == 0) { %>
                                    <tr>
                                        <td colspan=4 align="center" ><b>No Record Found..</b></td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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