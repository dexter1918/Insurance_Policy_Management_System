<%-- 
    Document   : EditAssignPolicys
    Created on : 20 Mar, 2021, 9:22:39 AM
    Author     : Thomas
--%>

<%@page import="java.util.List"%>
<%@page import="exavaluModel.PolicyModel"%>
<%@page import="exavalueBeans.policy"%>
<%@page import="exavalueBeans.AssignPolicys"%>
<%@page import="exavaluModel.AssignPolicym"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
   <%
        String pid = request.getParameter("policyId");
        int pids  = Integer.parseInt(pid);
        String cid = request.getParameter("cid");
        int cids = Integer.parseInt(cid);
         AssignPolicys assignPolicys=AssignPolicym.getAssignId(cids, pids, request);
        %>
<html>
    <head></head>
    <body>
     <form action="UpdateAssign.jsp" method="post">
            <table>
                <tr>
                    <td> <input type="hidden" name="cid" value="<%=assignPolicys.getCustomerId()%>" > </td>
                        
                </tr>
                <tr>
                    <td>Enter Policy Id=</td>
                    <td> <input type="text" name="policyId" value="<%=assignPolicys.getPolicyId()%>" >  </td>
                </tr>
                <tr><td> <input type="submit" value="Update"> </td></tr>
            </table>
     </form>
                 <table>
                    <tr>
                        
                        <th>policyId</th>
                        <th>policy Name</th>
                    </tr>
                    
                    
                <%            List<policy> list = PolicyModel.getAllPolicys(request);
                    for (policy p
                            : list) {

                %>
                    
                    
                     <tr>    
               
                    <td><%=p.getPid()%></td>
                    <td><%=p.getName()%></td>
                     </tr>
                     
                    <%}%>
                    
                </table>
    </body>
</html>
