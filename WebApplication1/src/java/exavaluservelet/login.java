package exavaluservelet;

import exavaluUtilities.connectionProvidertoDb;
import java.io.IOException;
import java.io.PrintWriter;
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

public class login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
            response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //get the parameters form request
            String emailaddress = request.getParameter("email_address");
            String password = request.getParameter("password");
            /* TODO output your page here. You may use following sample code. */

            Connection connection = connectionProvidertoDb.getConnectionObject().getConnection("E:\\ExavaluProject\\WebApplication1\\config\\dbParams.properties");

            String sql = "SELECT * FROM companylogin where CompanyEmailAddress=? and CompanyPassword=?";

            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, emailaddress);
            stmt.setString(2, password);

            // execute SQL
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
           
                
                
                
                HttpSession session = request.getSession();

                int i = rs.getInt("company_id");
                String name=rs.getString("companyname");
                
                session.setAttribute("companyName", name);
                session.setAttribute("companyId", i);

                RequestDispatcher rd = request.getRequestDispatcher("homePage.jsp");
                rd.forward(request, response);

            } else {

                // failed validation
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Email or password incorrect');");
                out.println("location='login.jsp';");
                out.println("</script>");
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
