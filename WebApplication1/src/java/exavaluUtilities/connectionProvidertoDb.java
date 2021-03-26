/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package exavaluUtilities;

import java.awt.PageAttributes;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.*;

/**
 *
 * @author Thomas
 */
public class connectionProvidertoDb {
    private static connectionProvidertoDb connectionProvidertoDb=null; 
    public static connectionProvidertoDb getConnectionObject()
    {
        if(connectionProvidertoDb==null)
        {
            connectionProvidertoDb=new connectionProvidertoDb();
        }
        
        
        return connectionProvidertoDb;
    }
    private connectionProvidertoDb()
    {
        
    }
    public Connection getConnection(String filePath) throws IOException {

        Connection connection = null;

 

        try {

            dbparamProvider dbparamProvider = propertiesReader.readPropertise(filePath);

 

            Class.forName(dbparamProvider.getDriver());

            

            connection = DriverManager.getConnection(dbparamProvider.getDbUrl() + dbparamProvider.getDbName(), dbparamProvider.getUserName(), dbparamProvider.getPassword());

 

        } catch (ClassNotFoundException | SQLException ex) {

            System.err.println(ex.getMessage());

        }

       

        return connection;

 

    }

   

    
}
