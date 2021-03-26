/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package exavaluservelet;

import exavaluModel.CompanyModel;
import exavaluUtilities.connectionProvidertoDb;
import exavalueBeans.Company;
import exavalueBeans.CompanyLogin;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import static java.sql.JDBCType.NULL;
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

/**
 *
 * @author Thomas
 */
public class CompanyServlet extends HttpServlet {

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
            out.println("<title>Servlet CompanyServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CompanyServlet at " + request.getContextPath() + "</h1>");
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
           
            
        try {
            PrintWriter out = response.getWriter();
//            String pid = request.getParameter("company_id");
//
//            int pids = Integer.parseInt(pid);

            String cname = request.getParameter("companyname");
            String cmail = request.getParameter("companyemail");
            String Caddress = request.getParameter("address");
            String cnumber = request.getParameter("phonenumber");
            String password = request.getParameter("password");
            Company company = new Company();
            CompanyLogin companyLogin = new CompanyLogin();
           // company.setCompany_id(pids);
            //company.setCompanyName(cname);
            companyLogin.setCompanyName(cname);
            companyLogin.setCompanyEmail(cmail);
            companyLogin.setPassword(password);
            company.setCompanyAddress(Caddress);
            company.setCompanyNummber(cnumber);
            company.setCompanyLogin(companyLogin);
            int status;
            Connection connection = connectionProvidertoDb.getConnectionObject().getConnection("E:\\ExavaluProject\\WebApplication1\\config\\dbParams.properties");
            String sql = "select CompanyEmailAddress from companylogin where CompanyEmailAddress=? ";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, cmail);
            ResultSet rs = stmt.executeQuery();
//            String sql1 = "select company_id from company where company_id=? ";
//            PreparedStatement stmt1 = connection.prepareStatement(sql1);
//            stmt1.setInt(1, pids);
//            ResultSet rs1 = stmt1.executeQuery();
            if(rs.next() ){
//                RequestDispatcher rd = request.getRequestDispatcher("CompanyAdd.jsp");
//                  out.println("<h1>Email Exists </h1>");
//                rd.forward(request, response);
                             out.println("<script type=\"text/javascript\">");
                out.println("alert('Email Already Exists');");
                out.println("location='login.jsp';");
                out.println("</script>");
                
                
            }
//            else if(rs1.next())
//            {
//                 RequestDispatcher rd = request.getRequestDispatcher("CompanyAdd.jsp");
//                  out.println("<h1>Usename Exists </h1>");
//                rd.forward(request, response);
//            }
            else{
            status = CompanyModel.addCompany(company);
            if (status > 0) {
//                out.println("<script type=\"text/javascript\">");
//                out.println("alert('Register Succsfull');");
//                out.println("</script>");
//                response.sendRedirect("login.jsp");
                
                  out.println("<script type=\"text/javascript\">");
                            out.println("alert('SignUp Succsfull');");
                out.println("location='login.jsp';");
                out.println("</script>");
                
                
                
                
                
                
                
                
            } else {
                response.sendRedirect("CompanyAdd.jsp");
                out.println("Sorry! unable to save record");
                
            }
        }
        }catch (SQLException ex) {

            System.out.println(ex.getMessage());

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
