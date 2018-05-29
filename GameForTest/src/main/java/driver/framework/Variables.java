package driver.framework;

import java.util.HashMap;
import java.util.Map;

public class Variables {
    private Variables() {
    }

    private static Map<String, String> vars = new HashMap<>();

    public static String get(String name) {
        return vars.get(name);
    }

    public static void put(String name, String value) {
        vars.put(name, value);
    }

    public static String replace(String text){
        String result = text;
        while (result.contains("${")) {
            int start = result.indexOf("${");
            int end = result.indexOf('}');
            if (start >= 0 && end > start) {
                result = result.substring(0, start)
                        + Variables.get(result.substring(start + 2, end))
                        + result.substring(end + 1);
            }
        }
        return result;
    }
}
