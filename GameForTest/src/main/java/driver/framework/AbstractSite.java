package driver.framework;

import driver.utils.User;
import org.openqa.selenium.WebDriver;

import java.util.HashMap;
import java.util.Map;

public abstract class AbstractSite {
    protected WebDriver driver;

    public AbstractSite(WebDriver driver) {
        this.driver = driver;
    }

    public abstract AbstractSite login(User user);

    public abstract AbstractPage getCurrentPage();

}
