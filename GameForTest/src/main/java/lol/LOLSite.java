package lol;

import driver.framework.AbstractPage;
import driver.framework.AbstractSite;
import driver.utils.User;
import org.openqa.selenium.WebDriver;

public class LOLSite extends AbstractSite {
    private LoginPage loginPage;
    private HomePage homePage;
    private WelcomePage welcomePage;

    public LOLSite(WebDriver driver) {
        super(driver);
        loginPage = new LoginPage(driver);
        putPage(loginPage);
        homePage = new HomePage(driver);
        putPage(homePage);
        welcomePage = new WelcomePage(driver);
        putPage(welcomePage);
    }

    public LOLSite login(User user) {
        loginPage.loginAs(user.getLogin(), user.getPassword()).and().wait(10);
        return this;
    }

    @Override
    public AbstractPage getCurrentPage() {
        switch (driver.getCurrentUrl().split("\\?")[0]) {
            case LoginPage.URL:
            case LoginPage.URL2:
                return loginPage;
            case HomePage.URL:
                return homePage;
            case WelcomePage.URL:
                return welcomePage;
            default:
                return null;
        }
    }
}
