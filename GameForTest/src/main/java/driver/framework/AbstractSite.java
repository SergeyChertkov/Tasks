package driver.framework;

import driver.utils.User;
import org.openqa.selenium.WebDriver;

import java.util.HashMap;
import java.util.Map;

public abstract class AbstractSite {
    protected WebDriver driver;
    private Map<String, AbstractPage> pages;

    public AbstractSite(WebDriver driver) {
        pages = new HashMap<>();
        this.driver = driver;
    }

    public AbstractSite setDriver(WebDriver driver) {
        this.driver = driver;
        return this;
    }

    @SuppressWarnings("UnusedReturnValue")
    public abstract AbstractSite login(User user);

    public abstract AbstractPage getCurrentPage();

    public AbstractPage getPage(String pageName) {
        AbstractPage page = pages.get(pageName.toLowerCase().replaceAll(" ", ""));
        if (page == null) {
            throw new PageException("Can not found page with name '" + pageName + "'.");
        }
        page.setDriver(driver);
        return page;
    }

    protected void putPage(AbstractPage page) {
        pages.put(page.getPageName(), page);
    }
}
