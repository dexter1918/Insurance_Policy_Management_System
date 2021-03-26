/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package exavaluservelet;

import exavaluModel.PolicyModel;
import exavalueBeans.policy;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Thomas
 */
public class EditPolicy extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditPolicy</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditPolicy at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
        processRequest(request, response);
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
        String pid = request.getParameter("pid");
        int pids = Integer.parseInt(pid);
        String pname = request.getParameter("pname");
        String exd = request.getParameter("ExpiaryDate");
        //Double exds = Double.parseDouble(exd);
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
        policy p= new policy();
        p.setPid(pids);
        p.setName(pname);
        p.setExpiryDate(exd);
        p.setLaunchDate(ld);
        p.setPremimumAmmount(prms);
        p.setCoverageammount(cas);
        p.setMinumumage(mgs);
        p.setMaxage(mags);
        try {
            int status=PolicyModel.update(p,request);
            if(status >0)
            {
              
                response.sendRedirect("Policys.jsp"); 
            }
            else{
                   System.out.println("Sorry! unable to update record");
            }
        } catch (SQLException ex) {
            Logger.getLogger(EditPolicy.class.getName()).log(Level.SEVERE, null, ex);
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
