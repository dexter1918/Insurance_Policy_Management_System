package exavaluUtilities;



import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Thomas
 */
public class propertiesReader {
    
       public static dbparamProvider readPropertise(String filePath) throws IOException {

        FileReader reader = null;
        dbparamProvider Db_params = new dbparamProvider();
        try {

            reader = new FileReader(filePath);
            Properties p = new Properties();
            p.load(reader);
            Db_params.setDriver(p.getProperty("driver"));
            Db_params.setDbUrl(p.getProperty("db_url"));
            Db_params.setDbName(p.getProperty("db_name"));
            Db_params.setUserName(p.getProperty("user_name"));
            Db_params.setPassword(p.getProperty("password"));

        } catch (FileNotFoundException ex) {
            Logger.getLogger(propertiesReader.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                reader.close();
            } catch (IOException ex) {
                Logger.getLogger(propertiesReader.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return Db_params;
    }

    
}
