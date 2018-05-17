package driverFramework;

import org.openqa.selenium.WebDriver;

import java.util.HashMap;
import java.util.Map;

public class AbstractSite {
    WebDriver driver;
    Map<String, AbstractPage> pages = new HashMap<>();

    public AbstractSite(WebDriver driver) {
        this.driver = driver;
    }

    protected AbstractSite addPage(String name, AbstractPage page) {
        pages.put(name, page);
        return this;
    }

    public AbstractPage page(String name) {
        return pages.get(name);
    }
}
