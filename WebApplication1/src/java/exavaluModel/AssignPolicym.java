/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package exavaluModel;

import exavaluUtilities.connectionProvidertoDb;
import exavalueBeans.AssignPolicys;
import exavaluservelet.AssignPolicy;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Thomas
 */
public class AssignPolicym {

    public static int addCompany(AssignPolicys assignPolicys, HttpServletRequest request) throws IOException, SQLException {
        int i = (int) request.getSession().getAttribute("companyId");
        Connection connection = connectionProvidertoDb.getConnectionObject().getConnection("E:\\ExavaluProject\\WebApplication1\\config\\dbParams.properties");
        PreparedStatement pstmt = connection.prepareStatement("insert into policyissue(company_id,customer_id,pid) values(?,?,?)");
        pstmt.setInt(1, i);
        pstmt.setInt(2, assignPolicys.getCustomerId());
        pstmt.setInt(3, assignPolicys.getPolicyId());
        int status = pstmt.executeUpdate();
        return status;
    }
        public static int delete(int cid,int pid, HttpServletRequest request) {
        int i = 0;
          int ids = (int)request.getSession().getAttribute("companyId");
        try {
            Connection connection = connectionProvidertoDb.getConnectionObject().getConnection("E:\\ExavaluProject\\WebApplication1\\config\\dbParams.properties");
            PreparedStatement stmt = connection.prepareStatement("DELETE from policyissue where pid=? and company_id=? and customer_id=?");
            stmt.setInt(1, pid);
            stmt.setInt(2, ids);
            stmt.setInt(3, cid);
            i = stmt.executeUpdate();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return i;

    }
        public static AssignPolicys getAssignId(int cid,int pid,HttpServletRequest request) throws IOException, SQLException{ 
            AssignPolicys assignPolicys= new AssignPolicys();
            int ids = (int)request.getSession().getAttribute("companyId");
             Connection connection = connectionProvidertoDb.getConnectionObject().getConnection("E:\\ExavaluProject\\WebApplication1\\config\\dbParams.properties");
                PreparedStatement ps=connection.prepareStatement("select * from policyissue  where pid=? and company_id=? and customer_id=? ");
                 ps.setInt(1,pid);
                 ps.setInt(2,ids);
                 ps.setInt(3,cid);
                  ResultSet rs=ps.executeQuery();  
                   if(rs.next()){  
                assignPolicys.setCompanyId(rs.getInt(1));  
                assignPolicys.setCustomerId(rs.getInt(2));
                assignPolicys.setPolicyId(rs.getInt(3));
                   }
                   return assignPolicys;
                   
                 
        }
                
        
         

        
        
 

}
