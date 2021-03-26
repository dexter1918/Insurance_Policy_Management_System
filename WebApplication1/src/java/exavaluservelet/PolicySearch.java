/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package exavaluservelet;

import exavaluUtilities.connectionProvidertoDb;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Thomas
 */
public class PolicySearch extends HttpServlet {

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
            out.println("<title>Servlet PolicySearch</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PolicySearch at " + request.getContextPath() + "</h1>");
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
        Connection connection = connectionProvidertoDb.getConnectionObject().getConnection("E:\\ExavaluProject\\WebApplication1\\config\\dbParams.properties");
        Statement st;
        
        String serachInput = request.getParameter("serachInput");
         String compId = request.getParameter("compId");
         int compIds=Integer.parseInt(compId);
        //int id=Integer.parseInt(policyName);
        ArrayList al = null;
        ArrayList pid_list = new ArrayList();
      //  String query = "select * from policy where pname='"+policyName+"' or pid ="+id+" ";
       
        try {
             PreparedStatement stmt = connection.prepareStatement("select * from policy where company_id=? and pname=? or pid=? ");
             stmt.setInt(1,compIds);
            stmt.setString(2,serachInput); 
            stmt.setString(3,serachInput); 
             
            //stmt.setInt(2,id);
           // st = connection.createStatement();
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                al = new ArrayList();
                al.add(rs.getString("pname"));
                al.add(rs.getString("expirydate"));
                al.add(rs.getString("launchdate"));
                al.add(rs.getDouble("preimumammount"));
                al.add(rs.getDouble("coverageammount"));
                al.add(rs.getInt("minimumagecoverage"));
                al.add(rs.getInt("maxage"));
                pid_list.add(al);
            }
            request.setAttribute("piList", pid_list);
            RequestDispatcher view = request.getRequestDispatcher("searchview.jsp");
            view.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
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
