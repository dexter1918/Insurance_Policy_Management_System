<%-- 
    Document   : header
    Created on : 4 Mar, 2021, 11:52:11 PM
    Author     : Thomas
--%>

<%@page import="exavalueBeans.CompanyLogin"%>
<%@page import="exavalueBeans.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link rel="stylesheet" href="css/home1.css">
        <link rel="stylesheet" href="css/w3.css">
        <script type="text/javascript">
            window.history.forward();
            function noBack()
            {
                window.onbeforeunload = function () {
                    return "Your work will be lost.";
                };
            }
        </script>
        
    </head>
    <body>
        <header>
                  

            <div class="container">
                <div class="logo">

                    <a href="https://www.exavalu.com/" rel="home" title="ExaValuHomePage" ><img src="https://www.exavalu.com/wp-content/uploads/2019/05/exavaluLogo.png" height="50px" width="150px"> <strong style="color:#576266 ">ExaValu</strong> <span style="color:#576266 " >nsurance</span> </a>
                </div>

                <nav>
                    <ul>
                        <li> <a href="#">Welcome:</a>  </li>
                        <li> <a href="homePage.jsp">Home</a>  </li>
                        <li><a href="Policys.jsp"  title="Policies"> Policies </a></li>
                        <li><a href="CompanyAdd.jsp" title="customer"> Company  </a></li>
                        <li><a href="Customers.jsp" title="customer"> Customer  </a></li>
                        <li><a href="showAssignPolicy.jsp" title="customer"> AssignCustomer  </a></li>
                         <li><a href="FeedBack.jsp" title="customer"> Feedback  </a></li>
                        <li><a href="Logout" title="logout"> Logout</a></li>
                    </ul>
                </nav>
            </div>
        </header>
    </body>
</html>
