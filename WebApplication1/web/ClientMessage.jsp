<%-- 
    Document   : ClientMessage
    Created on : 20 Mar, 2021, 10:14:04 PM
    Author     : Thomas
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="exavaluUtilities.connectionProvidertoDb"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
    <body>

<table border="1"align="center">

 <tr>
                <td style='background-color: #5995fd; color: white;'>  Company Name</td>
                <td style='background-color: #5995fd; color: white;'>  Company Email</td>
                <td style='background-color: #5995fd; color: white;'>  Message</td>
            </tr>
 <%
            try {
                Connection connection = connectionProvidertoDb.getConnectionObject().getConnection("E:\\ExavaluProject\\WebApplication1\\config\\dbParams.properties");
                PreparedStatement pstmt = connection.prepareStatement("select * from feedback");
               
                ResultSet rs = pstmt.executeQuery();
                while (rs.next()) {
        %>

        
         <tr>
             <td><%=rs.getString("cname") %></td> 
            <td><%=rs.getString("cmail") %></td>
            <td><%=rs.getString("cmessage") %></td>
            
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
