/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package exavalueBeans;

/**
 *
 * @author Thomas
 */
public class Company {
    private int company_id;
   
    private String companyAddress;
    private String companyNummber;
    private CompanyLogin companyLogin;
    /**
     * @return the companyId
     */

    
    

    /**
     * @return the companyAddress
     */
    public String getCompanyAddress() {
        return companyAddress;
    }

    /**
     * @param companyAddress the companyAddress to set
     */
    public void setCompanyAddress(String companyAddress) {
        this.companyAddress = companyAddress;
    }

    /**
     * @return the companyNummber
     */
    public String getCompanyNummber() {
        return companyNummber;
    }

    /**
     * @param companyNummber the companyNummber to set
     */
    public void setCompanyNummber(String companyNummber) {
        this.companyNummber = companyNummber;
    }

    /**
     * @return the companyEmail
     */

    /**
     * @return the companyLogin
     */
    public CompanyLogin getCompanyLogin() {
        return companyLogin;
    }

    /**
     * @param companyLogin the companyLogin to set
     */
    public void setCompanyLogin(CompanyLogin companyLogin) {
        this.companyLogin = companyLogin;
    }

    /**
     * @return the company_id
     */
    public int getCompany_id() {
        return company_id;
    }

    /**
     * @param company_id the company_id to set
     */
    public void setCompany_id(int company_id) {
        this.company_id = company_id;
    }
    
}
