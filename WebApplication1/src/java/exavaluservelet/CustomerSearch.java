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
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Thomas
 */
public class CustomerSearch extends HttpServlet {

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
            out.println("<title>Servlet CustomerSearch</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerSearch at " + request.getContextPath() + "</h1>");
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
       
        try {
             PreparedStatement stmt = connection.prepareStatement("SELECT * FROM customer,contactaddress,address where customer.customer_id=contactaddress.customer_id and customer.customer_id=address.customer_id and customer.company_id=contactaddress.company_id and customer.company_id=address.company_id and customer.company_id=? and customer.cutomer_name=? or customer.customer_id=? and contactaddress.customer_id=? and address.customer_id=?  ");
             stmt.setInt(1,compIds);
            stmt.setString(2,serachInput); 
            stmt.setString(3,serachInput); 
            stmt.setString(4,serachInput); 
            stmt.setString(5,serachInput); 
             
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                al = new ArrayList();
                al.add(rs.getString("cutomer_name"));
                al.add(rs.getString("occupation"));
                al.add(rs.getInt("age"));
                al.add(rs.getString("gender"));
                al.add(rs.getInt("annual_income"));
                al.add(rs.getString("email"));
                al.add(rs.getString("phonenumber"));
                al.add(rs.getString("addressone"));
                al.add(rs.getString("addresstwo"));
                al.add(rs.getString("city"));
                al.add(rs.getString("state"));
                al.add(rs.getString("country"));
                al.add(rs.getInt("pincode"));
                pid_list.add(al);
            }
            request.setAttribute("piList", pid_list);
            RequestDispatcher view = request.getRequestDispatcher("Customersearchview.jsp");
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
