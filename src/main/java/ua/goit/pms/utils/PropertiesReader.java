package ua.goit.pms.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Properties reader singleton class to get properties from file
 */
public class PropertiesReader {

    private final static String propertiesFile = "db.properties"; //file name at resources folder
    private final static Properties properties;

    static{
        properties = new Properties();
        try (InputStream inputStream = getInputStream()){
            properties.load(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * Main method to return property value
     * @param value string value of needed property
     * @return
     */
    public static String getProperty(String value){
        return properties.getProperty(value);
    }

    private static InputStream getInputStream(){
        return PropertiesReader.class.getClassLoader().getResourceAsStream(PropertiesReader.propertiesFile);
    }
}
