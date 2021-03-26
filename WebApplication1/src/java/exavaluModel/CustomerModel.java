/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package exavaluModel;

import exavaluUtilities.connectionProvidertoDb;
import exavalueBeans.Address;
import exavalueBeans.ContactAddress;
import exavalueBeans.Customer;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Thomas
 */
public class CustomerModel {
public static int gen() {
    Random r = new Random( System.currentTimeMillis() );
    return ((1 + r.nextInt(2)) * 10000 + r.nextInt(10000));
}

    public static int addCompany(Customer customer, HttpServletRequest request) throws IOException, SQLException {
        int i = (int) request.getSession().getAttribute("companyId");
         int rand = gen();
        Connection connection = connectionProvidertoDb.getConnectionObject().getConnection("E:\\ExavaluProject\\WebApplication1\\config\\dbParams.properties");
        PreparedStatement pstmt = connection.prepareStatement("insert into customer(company_id,customer_id ,cutomer_name,occupation,age,gender,annual_income) values (?,?,?,?,?,?,?)");
        pstmt.setInt(1, i);
        pstmt.setInt(2, rand);
        pstmt.setString(3, customer.getCustomerName());
        pstmt.setString(4, customer.getOccupation());
        pstmt.setInt(5, customer.getAge());
        pstmt.setString(6, customer.getGender());
         pstmt.setInt(7, customer.getAnnualIncome());
        int status = pstmt.executeUpdate();
        pstmt = connection.prepareStatement("insert into contactaddress(customer_id,email,phonenumber,company_id) values (?,?,?,?) ");
        pstmt.setInt(1,  rand);
        pstmt.setString(2, customer.getContactAddress().getEmail());
        pstmt.setString(3, customer.getContactAddress().getPhoneNumber());
        pstmt.setInt(4, i);
        status = pstmt.executeUpdate();
        pstmt = connection.prepareStatement("insert into address(customer_id,addressone,addresstwo,city,state,country,pincode,company_id) values(?,?,?,?,?,?,?,?)  ");
        pstmt.setInt(1, rand);
        pstmt.setString(2, customer.getAddress().getAddressOne());
        pstmt.setString(3, customer.getAddress().getAddressTwo());
        pstmt.setString(4, customer.getAddress().getCity());
        pstmt.setString(5, customer.getAddress().getState());
        pstmt.setString(6, customer.getAddress().getCountry());
        pstmt.setString(7, customer.getAddress().getPincode());
        pstmt.setInt(8, i);
        status = pstmt.executeUpdate();

        return status;

    }
    
    

    public static List<Customer> getAllCustomer(HttpServletRequest request) throws IOException, SQLException {
     
        int i = (int)request.getSession().getAttribute("companyId");
        
        List<Customer> list = new ArrayList<Customer>();
        Connection connection = connectionProvidertoDb.getConnectionObject().getConnection("E:\\ExavaluProject\\WebApplication1\\config\\dbParams.properties");
        String sql = "SELECT * FROM customer,contactaddress,address where customer.company_id=? and customer.customer_id=contactaddress.customer_id and customer.customer_id=address.customer_id and customer.company_id=contactaddress.company_id and customer.company_id=address.company_id";
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setInt(1, i);
        
        ResultSet rs = stmt.executeQuery();
         while (rs.next()) {
                Customer customer = new Customer();
                ContactAddress contactAddress=new ContactAddress();
                Address address=new Address();
                customer.setCustomerId(rs.getInt("customer_id"));
                customer.setCustomerName(rs.getString("cutomer_name"));
                customer.setOccupation(rs.getString("occupation"));
                customer.setAge(rs.getInt("age"));
                customer.setGender(rs.getString("gender"));
                customer.setAnnualIncome(rs.getInt("annual_income"));
                contactAddress.setEmail(rs.getString("email"));
                contactAddress.setPhoneNumber(rs.getString("phonenumber"));
                address.setAddressOne(rs.getString("addressone"));
                address.setAddressTwo(rs.getString("addresstwo"));
                address.setCity(rs.getString("city"));
                address.setState(rs.getString("state"));
                address.setCountry(rs.getString("country"));
                address.setPincode(rs.getString("pincode"));
                customer.setContactAddress(contactAddress);
                customer.setAddress(address);
                list.add(customer);
            }
         return list;
        }
      public static Customer getCustomerId(int id,HttpServletRequest request) throws IOException, SQLException{  
          int ids = (int)request.getSession().getAttribute("companyId");
          Customer customer = new Customer();
          ContactAddress contactAddress=new ContactAddress();
          Address address=new Address();
           Connection connection = connectionProvidertoDb.getConnectionObject().getConnection("E:\\ExavaluProject\\WebApplication1\\config\\dbParams.properties");
            PreparedStatement ps=connection.prepareStatement("SELECT * FROM customer,contactaddress,address where customer.customer_id=contactaddress.customer_id and customer.customer_id=address.customer_id and customer.company_id=contactaddress.company_id and customer.company_id=address.company_id and  customer.company_id=? and customer.customer_id=? ");  
            ps.setInt(1,ids);  
            ps.setInt(2,id);  
            ResultSet rs=ps.executeQuery(); 
            if(rs.next()){ 
                customer.setCustomerId(rs.getInt("customer_id"));
                customer.setCustomerName(rs.getString("cutomer_name"));
                customer.setOccupation(rs.getString("occupation"));
                customer.setAge(rs.getInt("age"));
                customer.setGender(rs.getString("gender"));
                customer.setAnnualIncome(rs.getInt("annual_income"));
                contactAddress.setEmail(rs.getString("email"));
                contactAddress.setPhoneNumber(rs.getString("phonenumber"));
                address.setAddressOne(rs.getString("addressone"));
                address.setAddressTwo(rs.getString("addresstwo"));
                address.setCity(rs.getString("city"));
                address.setState(rs.getString("state"));
                address.setCountry(rs.getString("country"));
                address.setPincode(rs.getString("pincode"));
                customer.setContactAddress(contactAddress);
                customer.setAddress(address);
                
            }
            return customer;
            
            
            
      }
      
      public static int update(Customer customer,HttpServletRequest request) throws IOException, SQLException {
           int ids = (int)request.getSession().getAttribute("companyId");
            int status = 0;
        Connection connection = connectionProvidertoDb.getConnectionObject().getConnection("E:\\ExavaluProject\\WebApplication1\\config\\dbParams.properties");

        PreparedStatement pstmt = connection.prepareStatement
("update customer,address,contactaddress set cutomer_name=?,occupation=?,age=?,gender=?,annual_income=?,email=?,phonenumber=?,addressone=?,addresstwo=?,city=?,state=?,country=?,pincode=? where customer.customer_id=? AND customer.company_id=? and customer.customer_id=contactaddress.customer_id and customer.customer_id=address.customer_id and customer.company_id=contactaddress.company_id and customer.company_id=address.company_id");
        pstmt.setString(1, customer.getCustomerName());
        pstmt.setString(2, customer.getOccupation());
        pstmt.setInt(3, customer.getAge());
        pstmt.setString(4, customer.getGender());
        pstmt.setInt(5, customer.getAnnualIncome());
        pstmt.setString(6, customer.getContactAddress().getEmail());
        pstmt.setString(7, customer.getContactAddress().getPhoneNumber()); 
         pstmt.setString(8, customer.getAddress().getAddressOne());
        pstmt.setString(9, customer.getAddress().getAddressTwo());
        pstmt.setString(10, customer.getAddress().getCity());
        pstmt.setString(11, customer.getAddress().getState());
        pstmt.setString(12, customer.getAddress().getCountry());
        pstmt.setString(13, customer.getAddress().getPincode());
        pstmt.setInt(14, customer.getCustomerId());
        pstmt.setInt(15, ids);
        status=pstmt.executeUpdate();  
        return status;
        
      }
      
    
       public static int delete(int id,HttpServletRequest request) {
            int ids = (int)request.getSession().getAttribute("companyId");
         int i = 0;
        try {
            Connection connection = connectionProvidertoDb.getConnectionObject().getConnection("E:\\ExavaluProject\\WebApplication1\\config\\dbParams.properties");
            PreparedStatement stmt = connection.prepareStatement("DELETE customer, address,contactaddress FROM customer INNER JOIN address INNER JOIN contactaddress where  customer.customer_id=contactaddress.customer_id and customer.customer_id=address.customer_id and customer.company_id=contactaddress.company_id and customer.company_id=address.company_id and customer.customer_id=? and  customer.company_id=?  ");
            stmt.setInt(1, id);
             stmt.setInt(2, ids);
            i = stmt.executeUpdate(); 
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return i;

    }
        
    
    
        
    }

