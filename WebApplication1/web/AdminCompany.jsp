<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="exavaluUtilities.connectionProvidertoDb"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Companies</title>
    </head>
    <body>
            <table border="1">
                <tr>
                    <td style='background-color: #5995fd; color: white;'>Company Name</td>
                    <td style='background-color: #5995fd; color: white;'>Phone Number</td>
                    <td style='background-color: #5995fd; color: white;'>Address</td>
                    <td style='background-color: #5995fd; color: white;'>Company Email Address</td>
                    <td style='background-color: #5995fd; color: white;'>Company Password</td>
                    <td style='background-color: #5995fd; color: white;'>Action</td>
                </tr>
                <%
                    try {
                        Connection connection = connectionProvidertoDb.getConnectionObject().getConnection("E:\\ExavaluProject\\WebApplication1\\config\\dbParams.properties");
                        PreparedStatement pstmt = connection.prepareStatement(
                                "select * from company,companylogin where company.company_id=companylogin.company_id");

                        ResultSet rs = pstmt.executeQuery();
                        while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString("companyname")%></td>
                    <td><%=rs.getString("phonenumber")%></td>
                    <td><%=rs.getString("address")%></td>
                    <td><%=rs.getString("CompanyEmailAddress")%></td>
                    <td><%=rs.getString("CompanyPassword")%></td>
                    <td>  <a href="DeleteCompnay?compid=<%=rs.getInt("company_id")%>">Delete</a>| <a href="EditCompnay.jsp?compid=<%=rs.getInt("company_id")%>">Edit</a> </td>
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
