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
public class policy {
    private int pid;
    private String name;
    private String expiryDate;
    private String launchDate;
    private Double premimumAmmount;
    private Double coverageammount;
    private int minumumage;
    private  int maxage;

    /**
     * @return the pid
     */
    public int getPid() {
        return pid;
    }

    /**
     * @param pid the pid to set
     */
    public void setPid(int pid) {
        this.pid = pid;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the expiryDate
     */
    public String getExpiryDate() {
        return expiryDate;
    }

    /**
     * @param expiryDate the expiryDate to set
     */
    public void setExpiryDate(String expiryDate) {
        this.expiryDate = expiryDate;
    }

    /**
     * @return the launchDate
     */
    public String getLaunchDate() {
        return launchDate;
    }

    /**
     * @param launchDate the launchDate to set
     */
    public void setLaunchDate(String launchDate) {
        this.launchDate = launchDate;
    }

    /**
     * @return the premimumAmmount
     */
    public Double getPremimumAmmount() {
        return premimumAmmount;
    }

    /**
     * @param premimumAmmount the premimumAmmount to set
     */
    public void setPremimumAmmount(Double premimumAmmount) {
        this.premimumAmmount = premimumAmmount;
    }

    /**
     * @return the coverageammount
     */
    public Double getCoverageammount() {
        return coverageammount;
    }

    /**
     * @param coverageammount the coverageammount to set
     */
    public void setCoverageammount(Double coverageammount) {
        this.coverageammount = coverageammount;
    }

    /**
     * @return the minumumage
     */
    public int getMinumumage() {
        return minumumage;
    }

    /**
     * @param minumumage the minumumage to set
     */
    public void setMinumumage(int minumumage) {
        this.minumumage = minumumage;
    }

    /**
     * @return the maxage
     */
    public int getMaxage() {
        return maxage;
    }

    /**
     * @param maxage the maxage to set
     */
    public void setMaxage(int maxage) {
        this.maxage = maxage;
    }
    

    /**
     * @return the pid
     */
}