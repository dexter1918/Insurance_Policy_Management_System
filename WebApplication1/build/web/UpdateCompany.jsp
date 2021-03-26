<%-- 
    Document   : UpdateCompany
    Created on : 20 Mar, 2021, 9:44:21 PM
    Author     : Thomas
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="exavaluUtilities.connectionProvidertoDb"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
       
<%
 String company_id = request.getParameter("company_id");
 int compid=Integer.parseInt(company_id);
String companyname=request.getParameter("companyname");
String phonenumber=request.getParameter("phonenumber");
String address=request.getParameter("address");
String CompanyEmailAddress=request.getParameter("CompanyEmailAddress");
String CompanyPassword=request.getParameter("CompanyPassword");
  PreparedStatement ps = null;
 Connection connection = connectionProvidertoDb.getConnectionObject().getConnection("E:\\ExavaluProject\\WebApplication1\\config\\dbParams.properties");
try
{

String sql="update company,companylogin set companyname=?,phonenumber=?,address=?,CompanyEmailAddress=?,CompanyPassword=?  where  company.company_id=companylogin.company_id and company.company_id="+compid ;
ps = connection.prepareStatement(sql);
ps.setString(1,companyname);
ps.setString(2,phonenumber);
ps.setString(3,address);
ps.setString(4,CompanyEmailAddress);
ps.setString(5,CompanyPassword);


int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully");
  response.sendRedirect("AdminCompany.jsp"); 
}
else
{
out.print("There is a problem in updating Record.");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}

%>









    </body>
</html>
