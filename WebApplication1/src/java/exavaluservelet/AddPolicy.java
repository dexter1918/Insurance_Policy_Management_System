/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.x`
 */
package exavaluservelet;

import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import exavaluModel.PolicyModel;
import exavaluUtilities.connectionProvidertoDb;
import exavalueBeans.CompanyLogin;
import exavalueBeans.policy;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Thomas
 */
public class AddPolicy extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
         
     //  CompanyLogin  companyLogin=(CompanyLogin)request.getSession().getAttribute("companyId");
          int i = (int) request.getSession().getAttribute("companyId");
//        String pid = request.getParameter("pid");
//        int pids = Integer.parseInt(pid);
        String pname = request.getParameter("pname");
        String exd = request.getParameter("ExpiaryDate");
       // int exds = Integer.parseInt(exd);
        String ld = request.getParameter("LaunchDate");
        //int lds = Integer.parseInt(ld);
        String prm = request.getParameter("premimumAmmount");
        Double prms = Double.parseDouble(prm);
        String ca = request.getParameter("coverageAmmount");
        Double cas = Double.parseDouble(ca);
        String mg = request.getParameter("minimumCoverage");
        int mgs = Integer.parseInt(mg);
        String mag = request.getParameter("Maxage");
        int mags = Integer.parseInt(mag);
        policy p = new policy();
      //  p.setPid(pids);
        p.setName(pname);
        p.setExpiryDate(exd);
        p.setLaunchDate(ld);
        p.setPremimumAmmount(prms);
        p.setCoverageammount(cas);
        p.setMinumumage(mgs);
        p.setMaxage(mags);
//        Connection connection = connectionProvidertoDb.getConnectionObject().getConnection("E:\\ExavaluProject\\WebApplication1\\config\\dbParams.properties");
//         String sql1 = "select pid,company_id from policy where pid=? AND company_id=?";
//         PreparedStatement stmt1 = connection.prepareStatement(sql1);
//        // stmt1.setInt(1, pids);
//         stmt1.setInt(1, i);
//         ResultSet rs1 = stmt1.executeQuery();
//          if(rs1.next() ){
//                RequestDispatcher rd = request.getRequestDispatcher("AddPolicy.jsp");
//                 out.println("<h1>PolicyId Already Exists </h1>");
//                rd.forward(request, response);
//            }
         // else{
        
         try {
            int status=PolicyModel.addPolicy(p,request);
            if(status >0)
            {
              
                response.sendRedirect("Policys.jsp"); 
            }
           
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
          }//
        
       

        
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AddPolicy.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AddPolicy.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
