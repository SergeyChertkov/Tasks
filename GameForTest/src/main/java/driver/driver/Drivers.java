package driver.driver;

import driver.framework.AbstractSite;
import org.openqa.selenium.WebDriver;

import java.util.HashMap;
import java.util.Map;

public class Drivers {
    public static final String DEFAULT_DRIVER_NAME = "default";
    private static Map<String, WebDriver> driversPool = new HashMap<>();
    private static Map<String, AbstractSite> sitesPool = new HashMap<>();

    private Drivers() {
    }

    public static void put(String name, WebDriver driver) {
        driversPool.put(name, driver);
    }

    public static WebDriver create(String name, String browser) {
        if(get(name)!=null){
            throw new DriverException ("Can not create browser. Browser with name '"+name+"' is already exist.");
        }
        WebDriver driver = DriverFactory.create(browser);
        put(name, driver);
        return driver;
    }

    public static void setSite(String name, AbstractSite site){
        sitesPool.put(name,site);
    }

    public static AbstractSite getSite(String name) {
        return sitesPool.get(name);
    }

    public static WebDriver get(String name) {
        return driversPool.get(name);
    }

}
