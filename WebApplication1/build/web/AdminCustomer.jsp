<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="exavaluUtilities.connectionProvidertoDb"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <table border="1">
            <tr>
                <td style='background-color: #5995fd; color: white;'>Customer Name</td>
                <td style='background-color: #5995fd; color: white;'>Occupation</td>
                <td style='background-color: #5995fd; color: white;'>Age</td>
                <td style='background-color: #5995fd; color: white;'>Gender</td>
                <td style='background-color: #5995fd; color: white;'>Annual Income</td>
                <td style='background-color: #5995fd; color: white;'>Email Address</td>
                <td style='background-color: #5995fd; color: white;'>Phone Number</td>
                <td style='background-color: #5995fd; color: white;'>Address Line 1</td>
                <td style='background-color: #5995fd; color: white;'>Address Line 2</td>
                <td style='background-color: #5995fd; color: white;'>City</td>
                <td style='background-color: #5995fd; color: white;'>State</td>
                <td style='background-color: #5995fd; color: white;'>Country</td>
                <td style='background-color: #5995fd; color: white;'>Pin Code</td>
            </tr>
            <%
                try {
                    Connection connection = connectionProvidertoDb.getConnectionObject().getConnection("E:\\ExavaluProject\\WebApplication1\\config\\dbParams.properties");
                    PreparedStatement pstmt = connection.prepareStatement(
                            "SELECT * FROM customer,address,contactaddress where  customer.customer_id=address.customer_id and customer.customer_id=contactaddress.customer_id and customer.company_id=address.company_id and customer.company_id=contactaddress.company_id;");

                    ResultSet rs = pstmt.executeQuery();
                    while (rs.next()) {
            %>
            <tr>
                <td><%=rs.getString("cutomer_name")%></td>
                <td><%=rs.getString("occupation")%></td>
                <td><%=rs.getInt("age")%></td>
                <td><%=rs.getString("gender")%></td>
                <td><%=rs.getInt("annual_income")%></td>
                <td><%=rs.getString("email")%></td>
                <td><%=rs.getString("phonenumber")%></td>
                <td><%=rs.getString("addressone")%></td>
                <td><%=rs.getString("addresstwo")%></td>
                <td><%=rs.getString("city")%></td>
                <td><%=rs.getString("state")%></td>
                <td><%=rs.getString("country")%></td>
                <td><%=rs.getInt("pincode")%></td>
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
