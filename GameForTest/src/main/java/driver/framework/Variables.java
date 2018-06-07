package driver.framework;

import driver.utils.Property;

import java.util.HashMap;
import java.util.Map;

public class Variables {
    private static final String START_OF_VARIABLE_NAME = "${";
    private static final String START_OF_CONFIG_NAME = "@{";
    private static final String END_OF_NAME = "}";

    private Variables() {
    }

    private static Map<String, String> vars = new HashMap<>();

    public static String get(String name) {
        return vars.get(name);
    }

    public static void put(String name, String value) {
        vars.put(name, value);
    }

    public static String replace(String text) {
        String result = replaceFromVariables(text);
        result = replaceFromConfig(result);
        return result;
    }

    private static String replaceFromVariables(String text) {
        String result = text;
        while (result.contains(START_OF_VARIABLE_NAME)) {
            int start = result.indexOf(START_OF_VARIABLE_NAME);
            int end = result.indexOf(END_OF_NAME);
            if (start >= 0 && end > start) {
                result = result.substring(0, start)
                        + Variables.get(result.substring(start + 2, end))
                        + result.substring(end + 1);
            }
        }
        return result;
    }

    private static String replaceFromConfig(String text) {
        String result = text;
        while (result.contains(START_OF_CONFIG_NAME)) {
            int start = result.indexOf(START_OF_CONFIG_NAME);
            int end = result.indexOf(END_OF_NAME);
            if (start >= 0 && end > start) {
                result = result.substring(0, start)
                        + Property.get(result.substring(start + 2, end))
                        + result.substring(end + 1);
            }
        }
        return result;
    }
}
