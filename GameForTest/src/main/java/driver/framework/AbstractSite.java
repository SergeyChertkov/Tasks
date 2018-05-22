package driver.framework;

import driver.utils.User;
import org.openqa.selenium.WebDriver;

import java.util.HashMap;
import java.util.Map;

public abstract class AbstractSite {
    protected WebDriver driver;
    Map<String, AbstractPage> pages;

    public AbstractSite(WebDriver driver) {
        pages = new HashMap<>();
        this.driver = driver;
    }

    public AbstractSite setDriver(WebDriver driver) {
        this.driver = driver;
        return this;
    }

    public abstract AbstractSite login(User user);

    public abstract AbstractPage getCurrentPage();

    public AbstractPage getPage(String pageName) {
        return pages.get(pageName);
    }

    protected void putPage(AbstractPage page) {
        pages.put(page.getPageName(), page);
    }

}
