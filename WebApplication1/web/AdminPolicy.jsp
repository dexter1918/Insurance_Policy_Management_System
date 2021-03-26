<%-- 
    Document   : AdminPolicy
    Created on : 20 Mar, 2021, 6:42:19 PM
    Author     : Thomas
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="exavaluUtilities.connectionProvidertoDb"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<table border="1">
<tr>
<td style='background-color: #5995fd; color: white;'>Policy Name</td>
<td style='background-color: #5995fd; color: white;'> Expiry</td>
<td style='background-color: #5995fd; color: white;'>LaunchDate </td>
<td style='background-color: #5995fd; color: white;'>PremimumAmmount</td>
<td style='background-color: #5995fd; color: white;'> CoverageAmmount</td>
<td style='background-color: #5995fd; color: white;'>MiniumAge</td>
<td style='background-color: #5995fd; color: white;'>MaxAge</td>
</tr>
  <%
            try {
                Connection connection = connectionProvidertoDb.getConnectionObject().getConnection("E:\\ExavaluProject\\WebApplication1\\config\\dbParams.properties");
                PreparedStatement pstmt = connection.prepareStatement("select * from policy");
                ResultSet rs = pstmt.executeQuery();
                while (rs.next()) {
                       %>
        <tr>
             <td><%=rs.getString("pname") %></td> 
            <td><%=rs.getString("expirydate") %></td>
            <td><%=rs.getString("launchdate") %></td>
            <td><%=rs.getDouble("preimumammount") %></td>
            <td><%=rs.getDouble("coverageammount") %></td>
            <td><%=rs.getInt("minimumagecoverage") %></td>
            <td><%=rs.getInt("maxage") %></td>
        </tr>
 
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

</table>
    </body>
</html>
