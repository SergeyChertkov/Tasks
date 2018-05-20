package driver.framework;

import driver.utils.User;
import org.openqa.selenium.WebDriver;

import java.util.HashMap;
import java.util.Map;

public abstract class AbstractSite {
    protected WebDriver driver;
    Map<String, AbstractPage> pages = new HashMap<>();
    protected String currentPage;

    public AbstractSite(WebDriver driver) {
        this.driver = driver;
    }

    public AbstractSite addPage(String name, AbstractPage page) {
        pages.put(name, page);
        return this;
    }

    public AbstractPage page(String name) {
        return pages.get(name);
    }

    public abstract AbstractSite login(User user);

    public abstract AbstractPage getCurrentPage();

}
