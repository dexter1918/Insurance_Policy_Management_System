<%-- 
    Document   : AdminCp
    Created on : 20 Mar, 2021, 7:26:26 PM
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
                <td style='background-color: #5995fd; color: white;'>Company ID</td>
                <td style='background-color: #5995fd; color: white;'>Company Name</td>
                <td style='background-color: #5995fd; color: white;'>Customer ID</td>
                <td style='background-color: #5995fd; color: white;'>Customer Name</td>
                <td style='background-color: #5995fd; color: white;'>Policy ID</td>
                <td style='background-color: #5995fd; color: white;'>Policy Name</td>

            </tr>
                
                <%
                    try {
                        Connection connection = connectionProvidertoDb.getConnectionObject().getConnection("E:\\ExavaluProject\\WebApplication1\\config\\dbParams.properties");
//                        PreparedStatement pstmt = connection.prepareStatement("select companyname,cutomer_name,pname,policyissue.customer_id,policy.pid from company,customer,policy,policyissue where company.company_id=policyissue.company_id and policy.company_id=policyissue.company_id and customer.customer_id=policyissue.customer_id and policy.pid=policyissue.pid");
//                          PreparedStatement pstmt = connection.prepareStatement("select * from policyissue, companylogin, customer");
                            PreparedStatement pstmt = connection.prepareStatement("select * from policyissue, companylogin, customer, policy where policyissue.customer_id = customer.customer_id and policyissue.company_id = companylogin.company_id and policyissue.pid = policy.pid");

                        ResultSet rs = pstmt.executeQuery();
                        while (rs.next()) {
                %>

            
            <tr>
                <td><%=rs.getString("company_id")%></td>
                <td><%=rs.getString("companyname")%></td>
                <td><%=rs.getString("customer_id")%></td> 
                <td><%=rs.getString("cutomer_name")%></td>
                <td><%=rs.getString("pid")%></td>
                <td><%=rs.getString("pname")%></td>

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
