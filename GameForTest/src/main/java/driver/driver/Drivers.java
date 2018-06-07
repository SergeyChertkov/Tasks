package driver.driver;

import org.openqa.selenium.WebDriver;

import java.util.HashMap;
import java.util.Map;

public class Drivers {
    static final String CHROME_DRIVER = "chrome";
    static final String FIREFOX_DRIVER = "firefox";
    static final String IE_DRIVER = "ie";

    public static final String DEFAULT_DRIVER_NAME = "default";
    private static Map<String, WebDriver> driversPool = new HashMap<>();

    private Drivers() {
    }

    public static void put(String name, WebDriver driver) {
        driversPool.put(name, driver);
    }

    public static void create(String name, String browser) {
        if (get(name) != null) {
            throw new DriverException("Can not create browser. Browser with name '" + name + "' is already exist.");
        }
        WebDriver driver = DriverFactory.create(browser);
        put(name, driver);
    }

    public static WebDriver get(String name) {
        return driversPool.get(name);
    }
}
