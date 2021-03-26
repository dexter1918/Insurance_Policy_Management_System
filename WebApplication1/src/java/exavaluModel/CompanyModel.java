/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package exavaluModel;

import exavaluUtilities.connectionProvidertoDb;
import exavalueBeans.Company;
import exavalueBeans.CompanyLogin;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

/**
 *
 * @author Thomas
 */
public class CompanyModel {
           public static int gen() {
    Random r = new Random( System.currentTimeMillis() );
    return ((1 + r.nextInt(2)) * 10000 + r.nextInt(10000));
}
   
    public static int addCompany(Company company) throws IOException, SQLException {
        int rand=gen();
        Connection connection = connectionProvidertoDb.getConnectionObject().getConnection("E:\\ExavaluProject\\WebApplication1\\config\\dbParams.properties");

        PreparedStatement pstmt = connection.prepareStatement("insert into company(company_id,address,phonenumber) values (?,?,?) ");
        pstmt.setInt(1, rand);
//        pstmt.setString(2, company.getCompanyName());
        pstmt.setString(2, company.getCompanyAddress());
        pstmt.setString(3, company.getCompanyNummber());

      int  status = pstmt.executeUpdate();
        pstmt = connection.prepareStatement("insert into companylogin(company_id,companyname,CompanyEmailAddress,CompanyPassword) values (?,?,?,?) ");
        pstmt.setInt(1, rand);
        pstmt.setString(2, company.getCompanyLogin().getCompanyName());
        pstmt.setString(3, company.getCompanyLogin().getCompanyEmail());
        pstmt.setString(4, company.getCompanyLogin().getPassword());
        status = pstmt.executeUpdate();

        return status;
    }

}
