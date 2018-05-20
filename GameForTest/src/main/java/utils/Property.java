package utils;

import java.io.FileInputStream;
import java.io.IOException;

public class Property {
    private static final String PATH_TO_RESOURCES = "src/main/resources/";
    private static final String PATH_TO_PROPERTIES = PATH_TO_RESOURCES + "config.ini";

    private Property() {
    }

    public static String get(String propertyName) {
        return get(PATH_TO_PROPERTIES, propertyName);
    }

    public static String getFromRes(String path, String propertyName) {
        return get(PATH_TO_RESOURCES + path, propertyName);
    }

    public static String get(String path, String propertyName) {
        FileInputStream fileInputStream;
        java.util.Properties prop = new java.util.Properties();
        String name = propertyName.replaceAll(" ","_");
        try {
            fileInputStream = new FileInputStream(path);
            prop.load(fileInputStream);
            return prop.getProperty(name);
        } catch (IOException e) {
            String errorMessage = "Can not find property name '" + propertyName + "'. Check it please.\n";
            throw new UtilException(errorMessage + e);
        }
    }
}
