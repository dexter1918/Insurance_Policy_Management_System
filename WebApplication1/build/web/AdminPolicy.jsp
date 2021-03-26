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
        <h2 style="color: white; margin-left: 9%;">List of Policies...</h2>
        <div class="container mb-3 mt-3">
            <table class="table table-striped table-bordered myDataTable" style="width: 100%" id="myTable">
                <thead id="myTableHeader" style="background-color: #6c7ae0; color: white;">
                    <tr>
                        <th>Policy Name</th>
                        <th> Expiry</th>
                        <th>LaunchDate </th>
                        <th>PremimumAmmount</th>
                        <th> CoverageAmmount</th>
                        <th>MiniumAge</th>
                        <th>MaxAge</th>
                    </tr>
                </thead>
                <tbody id="myTableBody">
                    <%
                        try {
                            Connection connection = connectionProvidertoDb.getConnectionObject().getConnection("E:\\ExavaluProject\\WebApplication1\\config\\dbParams.properties");
                            PreparedStatement pstmt = connection.prepareStatement("select * from policy");
                            ResultSet rs = pstmt.executeQuery();
                            while (rs.next()) {
                    %>
                    <tr class="myTableData" style="color: gray; background-color: white">
                        <td><%=rs.getString("pname")%></td> 
                        <td><%=rs.getString("expirydate")%></td>
                        <td><%=rs.getString("launchdate")%></td>
                        <td><%=rs.getDouble("preimumammount")%></td>
                        <td><%=rs.getDouble("coverageammount")%></td>
                        <td><%=rs.getInt("minimumagecoverage")%></td>
                        <td><%=rs.getInt("maxage")%></td>
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
