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
}
