package lol;

import driver.framework.AbstractPage;
import driver.framework.AbstractSite;
import driver.utils.User;
import org.openqa.selenium.WebDriver;

public class LOLSite extends AbstractSite {
    public static final String LOGIN_PAGE = "login page";
    public static final String HOME_PAGE = "home page";

    public LOLSite(WebDriver driver) {
        super(driver);
        super.addPage(LOGIN_PAGE, new LoginPage(driver));
        super.addPage(HOME_PAGE, new HomePage(driver));
    }

    public LOLSite login(User user) {
        LoginPage loginpage = (LoginPage) page(LOGIN_PAGE);
        loginpage.loginAs(user.getLogin(), user.getPassword()).and().wait(10);
        return this;
    }

    @Override
    public AbstractPage getCurrentPage() {
        switch (driver.getCurrentUrl().split("\\?")[0]) {
            case LoginPage.URL:
                return page(LOGIN_PAGE);
            case LoginPage.URL2:
                return page(LOGIN_PAGE);
            case HomePage.URL:
                return page(HOME_PAGE);
        }
        return null;
    }

}
