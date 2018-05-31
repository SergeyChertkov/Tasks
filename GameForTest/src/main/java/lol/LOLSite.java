package lol;

import cucumber.api.java.en_old.Ac;
import driver.framework.AbstractPage;
import driver.framework.AbstractSite;
import driver.utils.User;
import org.openqa.selenium.WebDriver;

import java.util.HashMap;
import java.util.Map;

public class LOLSite extends AbstractSite {
    private LoginPage loginPage;
    private WelcomePage welcomePage;
    private GPIPage gpiPage;
    private SearchPage searchPage;
    private PreGamePage preGamePage;
    private PostGamePage postGamePage;
    private DashboardPage dashboardPage;
    private ReferralPage referralPage;
    private AccountSettingsPage accountSettingsPage;
    private MailinatorPage mailinatorPage;
    private ByeByePage byeByePage;

    static Map<String, String> ELEMENTS = new HashMap<String, String>() {
        {
            put("search link", "//*[@data-reactid='110']");
            put("gpi link", "//*[@data-reactid='114']");
            put("pre game link", "//*[@data-reactid='120']");
            put("post game link", "//*[@data-reactid='126']");
            put("dashboard link", "//*[@data-reactid='134']");

            put("info menu link","//*[@data-reactid='144']");
            put("referral link", "//*[@data-reactid='147']");
            put("account settings link", "//*[@data-reactid='135']");//
            put("logout link", "//*[@data-reactid='140']");//
        }
    };

    public LOLSite(WebDriver driver) {
        super(driver);
        loginPage = new LoginPage(driver);
        putPage(loginPage);
        welcomePage = new WelcomePage(driver);
        putPage(welcomePage);
        gpiPage = new GPIPage(driver);
        putPage(gpiPage);
        searchPage = new SearchPage(driver);
        putPage(searchPage);
        preGamePage = new PreGamePage(driver);
        putPage(preGamePage);
        postGamePage = new PostGamePage(driver);
        putPage(postGamePage);
        dashboardPage = new DashboardPage(driver);
        putPage(dashboardPage);
        referralPage = new ReferralPage(driver);
        putPage(referralPage);
        accountSettingsPage = new AccountSettingsPage(driver);
        putPage(accountSettingsPage);
        byeByePage = new ByeByePage(driver);
        putPage(byeByePage);
        mailinatorPage = new MailinatorPage(driver);
        putPage(mailinatorPage);
    }

    public LOLSite login(User user) {
        loginPage.setDriver(driver);
        loginPage.loginAs(user.getLogin(), user.getPassword()).and().wait(10);
        return this;
    }

    @Override
    public AbstractPage getCurrentPage() {
        switch (driver.getCurrentUrl().split("\\?")[0]) {
            case LoginPage.URL:
            case LoginPage.URL2:
                loginPage.setDriver(driver);
                return loginPage;
            case WelcomePage.URL:
                welcomePage.setDriver(driver);
                return welcomePage;
            case GPIPage.URL:
                gpiPage.setDriver(driver);
                return gpiPage;
            case SearchPage.URL:
                searchPage.setDriver(driver);
                return searchPage;
            case PreGamePage.URL:
                preGamePage.setDriver(driver);
                return preGamePage;
            case PostGamePage.URL:
                postGamePage.setDriver(driver);
                return postGamePage;
            case DashboardPage.URL:
                dashboardPage.setDriver(driver);
                return dashboardPage;
            case ReferralPage.URL:
                referralPage.setDriver(driver);
                return referralPage;
            case AccountSettingsPage.URL:
                accountSettingsPage.setDriver(driver);
                return accountSettingsPage;
            case ByeByePage.URL:
                byeByePage.setDriver(driver);
                return byeByePage;
            case MailinatorPage.URL:
            case MailinatorPage.URL2:
                mailinatorPage.setDriver(driver);
                return  mailinatorPage;
            default:
                return null;
        }
    }
}
