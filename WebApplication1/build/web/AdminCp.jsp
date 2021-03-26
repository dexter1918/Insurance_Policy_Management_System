<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="exavaluUtilities.connectionProvidertoDb"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet"
              href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
        <title>JSP Page</title>
    </head>
    <body style="background-image: url(images/bannerBlurred.jpg)">
        <br>
        <h2 style="color: white; margin-left: 9%;">Policies Assigned to Customers...</h2>
        <div class="container mb-3 mt-3">
            <table class="table table-striped table-bordered myDataTable" style="width: 100%" id="myTable">
                <thead id="myTableHeader" style="background-color: #6c7ae0; color: white;">
                    <tr>
                        <th>Company ID</th>
                        <th>Company Name</th>
                        <th>Customer ID</th>
                        <th>Customer Name</th>
                        <th>Policy ID</th>
                        <th>Policy Name</th>
                    </tr>
                </thead>
                <tbody id="myTableBody">
                    <%
                        try {
                            Connection connection = connectionProvidertoDb.getConnectionObject().getConnection("E:\\ExavaluProject\\WebApplication1\\config\\dbParams.properties");
                            PreparedStatement pstmt = connection.prepareStatement("select * from policyissue, companylogin, customer, policy where policyissue.customer_id = customer.customer_id and policyissue.company_id = companylogin.company_id and policyissue.pid = policy.pid");
                            ResultSet rs = pstmt.executeQuery();
                            while (rs.next()) {
                    %>
                    <tr class="myTableData" style="color: gray; background-color: white">
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
                </tbody>
            </table>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.6.0/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>
        <script>
            $('.myDataTable').dataTable({
                "bPaginate": false,
                "bInfo": false
            });
        </script>
    </body>
</html>
