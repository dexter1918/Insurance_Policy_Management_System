<%-- 
    Document   : EditCompnay
    Created on : 20 Mar, 2021, 9:23:45 PM
    Author     : Thomas
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="exavaluUtilities.connectionProvidertoDb"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
        String id = request.getParameter("compid");
    try {
        Connection connection = connectionProvidertoDb.getConnectionObject().getConnection("E:\\ExavaluProject\\WebApplication1\\config\\dbParams.properties");
        PreparedStatement pstmt = connection.prepareStatement(
                "select * from company,companylogin where company.company_id=companylogin.company_id and company.company_id="+id);

        ResultSet rs = pstmt.executeQuery();
        while (rs.next()) {

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
        <form method="post" action="UpdateCompany.jsp">
            <input type="hidden" name="company_id" value="<%=rs.getString("company_id")%>">
            
            <br>
            Company name:<br>
            <input type="text" name="companyname" value="<%=rs.getString("companyname")%>">
            <br>
             Phone Number:<br>
            <input type="text" name="phonenumber" value="<%=rs.getString("phonenumber")%>">
            <br>
            Address:<br>
            <input type="text" name="address" value="<%=rs.getString("address")%>">
            <br>
            Email Id:<br>
            <input type="email" name="CompanyEmailAddress" value="<%=rs.getString("CompanyEmailAddress")%>">
            
             <br>
             Company Password:<br>
            <input type="text" name="CompanyPassword" value="<%=rs.getString("CompanyPassword")%>">
            <br><br>
            <input type="submit" value="Update">
        </form>
            <%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

    </body>
</html>
