 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package exavaluModel;

import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import exavaluUtilities.connectionProvidertoDb;
import exavalueBeans.CompanyLogin;
import exavalueBeans.policy;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Thomas
 */
public class PolicyModel {
       public static int gen() {
    Random r = new Random( System.currentTimeMillis() );
    return ((1 + r.nextInt(2)) * 10000 + r.nextInt(10000));
}

    public static List<policy> getAllPolicys(HttpServletRequest request) {
        // ArrayList list = new ArrayList();
         int i= (int) request.getSession().getAttribute("companyId");
        List<policy> list = new ArrayList<policy>();
        try {
            Connection connection = connectionProvidertoDb.getConnectionObject().getConnection("E:\\ExavaluProject\\WebApplication1\\config\\dbParams.properties");
            
            String sql = "SELECT * FROM policy where company_id=?";

            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1,i);
             ResultSet rs = stmt.executeQuery();
       
            while (rs.next()) {
                policy policys = new policy();
                policys.setPid(rs.getInt("pid"));
                policys.setName(rs.getString("pname"));
                policys.setExpiryDate(rs.getString("expirydate"));
                policys.setLaunchDate(rs.getString("launchdate"));
                policys.setPremimumAmmount(rs.getDouble("preimumammount"));
                policys.setCoverageammount(rs.getDouble("coverageammount"));
                policys.setMinumumage(rs.getInt("minimumagecoverage"));
                policys.setMaxage(rs.getInt("maxage"));
                list.add(policys);
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list;

    }

    public static int delete(int id,HttpServletRequest request) {
        int i = 0;
          int ids = (int)request.getSession().getAttribute("companyId");
        try {
            Connection connection = connectionProvidertoDb.getConnectionObject().getConnection("E:\\ExavaluProject\\WebApplication1\\config\\dbParams.properties");
            PreparedStatement stmt = connection.prepareStatement("DELETE from policy where pid=? and company_id=?");
            stmt.setInt(1, id);
            stmt.setInt(2, ids);
            i = stmt.executeUpdate();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return i;

    }
    public static policy getPolicyId(int id,HttpServletRequest request) throws IOException{
        int ids= (int) request.getSession().getAttribute("companyId");
        policy p=new policy();  
          Connection connection = connectionProvidertoDb.getConnectionObject().getConnection("E:\\ExavaluProject\\WebApplication1\\config\\dbParams.properties");
        try{  
            
            PreparedStatement ps=connection.prepareStatement("select * from policy where pid=? and  company_id=? ");  
            ps.setInt(1,id); 
            ps.setInt(2,ids); 
            ResultSet rs=ps.executeQuery();  
            if(rs.next()){  
                p.setPid(rs.getInt(1));  
                p.setName(rs.getString(2));
                p.setExpiryDate(rs.getString(3));
                p.setLaunchDate(rs.getString(4));
                p.setPremimumAmmount(rs.getDouble(5)); 
                p.setCoverageammount(rs.getDouble(6)); 
                p.setMinumumage(rs.getInt(7)); 
                p.setMaxage(rs.getInt(8)); 
                    
                               
            }  
            
        }catch(Exception ex){ex.printStackTrace();}  
          
        return p;  
    }  

    public static int update(policy p, HttpServletRequest request) throws IOException, SQLException {
         int ids = (int)request.getSession().getAttribute("companyId");
        int status = 0;
        Connection connection = connectionProvidertoDb.getConnectionObject().getConnection("E:\\ExavaluProject\\WebApplication1\\config\\dbParams.properties");

        PreparedStatement pstmt = connection.prepareStatement("update policy set pname=?,expirydate=?,launchdate=?,preimumammount=?,coverageammount=?,minimumagecoverage=?,maxage=? where pid=? and company_id=? ");
        pstmt.setString(1, p.getName());
        pstmt.setString(2, p.getExpiryDate());
        pstmt.setString(3, p.getLaunchDate());
        pstmt.setDouble(4, p.getPremimumAmmount());
        pstmt.setDouble(5, p.getCoverageammount());
        pstmt.setInt(6, p.getMinumumage());
        pstmt.setInt(7, p.getMaxage());
        pstmt.setInt(8, p.getPid());
         pstmt.setInt(9, ids);
        status=pstmt.executeUpdate();  
        return status;
    }
    
    
   public static int addPolicy(policy policys, HttpServletRequest request) throws IOException, SQLException {
       int status = 0;
       int i= (int) request.getSession().getAttribute("companyId");
       int rand = gen();

      Connection connection = connectionProvidertoDb.getConnectionObject().getConnection("E:\\ExavaluProject\\WebApplication1\\config\\dbParams.properties");
      PreparedStatement pstmt =
      connection.prepareStatement("insert into policy(company_id,pid,pname,expirydate,launchdate,preimumammount,coverageammount,minimumagecoverage,maxage) values (?,?,?,?,?,?,?,?,?)");
     
      pstmt.setInt(1,i);
      pstmt.setInt(2, rand);
      pstmt.setString(3, policys.getName());
      pstmt.setString(4, policys.getExpiryDate());
      pstmt.setString(5, policys.getLaunchDate());
      pstmt.setDouble(6, policys.getPremimumAmmount());
      pstmt.setDouble(7, policys.getCoverageammount());
      pstmt.setInt(8, policys.getMinumumage());
      pstmt.setInt(9, policys.getMaxage());
      status=pstmt.executeUpdate();  
        return status;
       
        
    }

}
