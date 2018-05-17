import driverFramework.Propert;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import LoL.LoginPage;

public class loginPage {
    private static WebDriver driver;

    public loginPage() {
    }

    @Before
    public void precondition() {
        System.setProperty("webdriver.chrome.driver", Propert.get("webdriver_path"));
        driver = new ChromeDriver();
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
    }
}
