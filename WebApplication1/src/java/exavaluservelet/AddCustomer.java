/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package exavaluservelet;

import exavaluModel.CustomerModel;
import exavaluUtilities.connectionProvidertoDb;
import exavalueBeans.Address;
import exavalueBeans.ContactAddress;
import exavalueBeans.Customer;
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

/**
 *
 * @author Thomas
 */
public class AddCustomer extends HttpServlet {

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
          int i = (int) request.getSession().getAttribute("companyId");
//         String customerId = request.getParameter("customerId");
//         int customerIds = Integer.parseInt(customerId);
         String customerName = request.getParameter("customerName");
         String occupation = request.getParameter("occupation");
         String age = request.getParameter("age");
         int ages = Integer.parseInt(age);
         String gender = request.getParameter("gender");
         String annualIncome = request.getParameter("annualIncome");
         int annualIncomes = Integer.parseInt(annualIncome);
         String email = request.getParameter("email");
         String phoneNumber = request.getParameter("phoneNumber");
         String addressOne = request.getParameter("addressOne");
         String addresstwo = request.getParameter("addresstwo");
         String city = request.getParameter("city");
         String state = request.getParameter("state");
         String country = request.getParameter("country");
         String pincode = request.getParameter("pincode");
        // int pincodes = Integer.parseInt(pincode);
         Customer customer=new Customer();
         Address address=new Address();
         ContactAddress contactAddress=new ContactAddress();
        // customer.setCustomerId(customerIds);
         customer.setCustomerName(customerName);
         customer.setOccupation(occupation);
         customer.setAge(ages);
         customer.setGender(gender);
         customer.setAnnualIncome(annualIncomes);
         contactAddress.setEmail(email);
         contactAddress.setPhoneNumber(phoneNumber);
         address.setAddressOne(addressOne);
         address.setAddressTwo(addresstwo);
         address.setCity(city);
         address.setState(state);
         address.setCountry(country);
         address.setPincode(pincode);
         customer.setContactAddress(contactAddress);
         customer.setAddress(address);
//         Connection connection = connectionProvidertoDb.getConnectionObject().getConnection("E:\\ExavaluProject\\WebApplication1\\config\\dbParams.properties");
//         String sql1 = "select  customer_id,customer.company_id from customer where customer_id=? and customer.company_id=? ";
//         PreparedStatement stmt1 = connection.prepareStatement(sql1);
//         stmt1.setInt(1, customerIds);
//         stmt1.setInt(2, i);
//         ResultSet rs1 = stmt1.executeQuery();
//          if(rs1.next() ){
//              out.println("<h1>CustomerId Already Exists </h1>");
//                RequestDispatcher rd = request.getRequestDispatcher("AddCustomer.jsp");
//                 
//                rd.forward(request, response);
//            }

          
         int status = CustomerModel.addCompany(customer, request);
         if (status > 0) {
                 RequestDispatcher rd = request.getRequestDispatcher("Customers.jsp");
                 rd.forward(request, response);
                
            } 
         else{
             out.print("Unable to add");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AddCustomer.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AddCustomer.class.getName()).log(Level.SEVERE, null, ex);
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
