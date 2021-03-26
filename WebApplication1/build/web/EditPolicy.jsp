<%--
    Document   : EditPolicy
    Created on : 4 Mar, 2021, 10:19:30 PM
    Author     : Thomas
--%>

<%@page import="exavaluModel.PolicyModel"%>
<%@page import="exavalueBeans.policy"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html
  

<!DOCTYPE html>
<html>
   <head>
      <title>Edit Policy Details</title>
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
      <link rel="stylesheet" type="text/css" href="css/newCSS/mainForCustomer2.css">
      <link rel="stylesheet" type="text/css" href="css/newCSS/styleForEditPolicyDetails.css">
      <!--===============================================================================================-->
      <script>
         addEventListener("load", function () {
             setTimeout(hideURLbar, 0);
         }, false);

         function hideURLbar() {
             window.scrollTo(0, 1);
         }
      </script>
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
      <link href="css/newCSS/timeline.css" type="text/css" rel="stylesheet" media="all">
   </head>
   <body>
         <%
         String sid=request.getParameter("pid");  
         int pid=Integer.parseInt(sid);
         policy e=PolicyModel.getPolicyId(pid,request);  
        %>
      <header>
          <%
    
      String name = (String) request.getSession().getAttribute("companyName");

%>
         <nav class="navbar navbar-expand-lg navbar-light bg-gradient-secondary">
            <h1>
                <a class="navbar-brand text-white" href="homePage.jsp">
              <%=name  %>Insurance
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
                  <li>
                    <a href="Logout">
                     <button type="button" class="btn  ml-lg-2 w3ls-btn">
                     <i class="fas fa-sign-out-alt"></i>
                     </button>
                     </a>
                  </li>
               </ul>
            </div>
         </nav>
      </header>

      <span class="br"></span>

      <form action="EditPolicy"  method="post" class="editForm">
         <div>
            <h2 class="title">Edit Policy Details</h2>
            
            <input type="hidden" name="pid" value="<%=e.getPid()%>">
            
            <div class="input-field">
               <i class="fas fa-file-invoice"></i>
               <input name="pname" type="text" placeholder="Name" value="<%= e.getName() %>"/>
            </div> 
            <div class="input-field">
               <i class="fas fa-file-invoice"></i>
               <input name="ExpiaryDate" type="text" placeholder="Expiary Date" value="<%= e.getExpiryDate()%>"/>
            </div>
            <div class="input-field">
               <i class="fas fa-file-invoice"></i>
               <input name="LaunchDate" type="text" placeholder="Launch Date" value="<%= e.getLaunchDate()%>"/>
            </div>
            <div class="input-field">
               <i class="fas fa-file-invoice"></i>
               <input name="premimumAmmount" type="text" placeholder="Premimum Ammount" value="<%= e.getPremimumAmmount()%>"/>
            </div>
            <div class="input-field">
               <i class="fas fa-file-invoice"></i>
               <input name="coverageAmmount" type="text" placeholder="Coverage Ammount" value="<%= e.getCoverageammount()%>"/>
            </div>
            <div class="input-field">
               <i class="fas fa-file-invoice"></i>
               <input name="minimumCoverage" type="number" placeholder="Minimum Age Offering" value="<%= e.getMinumumage()%>"/>
            </div>
            <div class="input-field">
               <i class="fas fa-file-invoice"></i>
               <input name="Maxage" type="number" placeholder="Maximum Age Offering" value="<%= e.getMaxage()%>"/>
            </div>

            <div class="button">
              <input type="submit" value="Save" class="btnn solid" />
            </div>

         </div>
      </form>


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
         $('.js-pscroll').each(function(){
         	var ps = new PerfectScrollbar(this);

         	$(window).on('resize', function(){
         		ps.update();
         	})
         });


      </script>
      <!--===============================================================================================-->
      <script src="js/main.js"></script>
      <script src="js/jquery-2.2.3.min.js"></script>
      <!-- //js -->
      <!-- testimonials  Responsiveslides -->
      <script src="js/responsiveslides.min.js"></script>
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
      <script src="js/move-top.js"></script>
      <script src="js/easing.js"></script>
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
      <script src="js/SmoothScroll.min.js"></script>
      <!-- //smooth-scrolling-of-move-up -->
      <script src="js/counter.js"></script>
      <!-- //stats -->
      <!-- Bootstrap core JavaScript
         ================================================== -->
      <!-- Placed at the end of the document so the pages load faster -->
      <script src="js/bootstrap.js"></script>
   </body>
</html>
