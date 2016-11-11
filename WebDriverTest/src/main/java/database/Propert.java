package database;

import java.io.FileInputStream;
import java.io.IOException;

/**
 * Created by sergey on 11.11.2016.
 */
public class Propert {
    public static final String PATH_TO_PROPERTIES = "src/main/config.properties";

    public static String get(String propName){
        FileInputStream fileInputStream;
        java.util.Properties prop = new java.util.Properties();

        try {
            fileInputStream = new FileInputStream(PATH_TO_PROPERTIES);
            prop.load(fileInputStream);
            return prop.getProperty(propName);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
