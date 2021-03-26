<%-- 
    Document   : UpdateAssign
    Created on : 20 Mar, 2021, 10:49:49 AM
    Author     : Thomas
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="exavaluUtilities.connectionProvidertoDb"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
 int ids = (int) request.getSession().getAttribute("companyId");
  String pid = request.getParameter("policyId");
  int pids  = Integer.parseInt(pid);
  String cid = request.getParameter("cid");
  int cids = Integer.parseInt(cid);
  PreparedStatement ps = null;
 Connection connection = connectionProvidertoDb.getConnectionObject().getConnection("E:\\ExavaluProject\\WebApplication1\\config\\dbParams.properties");
try
{

String sql="update policyissue set pid=?  where  customer_id="+cids+" and company_id="+ids+" " ;
ps = connection.prepareStatement(sql);
ps.setInt(1,pids);
//ps.setInt(2,ids);
//ps.setInt(3,pids);
//ps.setInt(4,cids);

int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully");
  response.sendRedirect("showAssignPolicy.jsp"); 
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

















<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
        
        
        
    </body>
</html>
