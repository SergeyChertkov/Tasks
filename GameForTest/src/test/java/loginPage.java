import driver.utils.Property;
import lol.LoginPage;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

import java.util.concurrent.TimeUnit;

public class loginPage {
    private static WebDriver driver;

    public loginPage() {
    }

    @Before
    public void precondition() {
        System.setProperty("webdriver.chrome.driver", Property.get("chrome_driver_path"));
        driver = new ChromeDriver();

//        for FireFox
//        System.setProperty("webdriver.gecko.driver",Property.get("firefox_driver_path"));
//        driver = new FirefoxDriver();


        driver.manage().timeouts().pageLoadTimeout(60, TimeUnit.SECONDS);
        driver.manage().timeouts().setScriptTimeout(60, TimeUnit.SECONDS);
    }

    @After
    public void postcondition() {
        driver.close();
    }

    @Test
    public void firstTest() {
        LoginPage loginPage = new LoginPage(driver);
        loginPage.open();
        loginPage.loginAs("klym@mobalyticshq.com", "Password123");
        loginPage.clickOn("login button");
        loginPage.wait(50);
    }
}
