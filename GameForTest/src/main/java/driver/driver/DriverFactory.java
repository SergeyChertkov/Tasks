package driver.driver;

import driver.utils.Property;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxOptions;
import org.openqa.selenium.firefox.FirefoxProfile;
import org.openqa.selenium.remote.CapabilityType;
import org.openqa.selenium.remote.DesiredCapabilities;

import java.util.Objects;

public class DriverFactory {
    private static final String CHROME_DRIVER = "chrome";
    private static final String FIREFOX_DRIVER = "firefox";
    private static final String IE_DRIVER = "ie";

    private DriverFactory() {
    }

    public static WebDriver create(String browserName) {
        WebDriver driver;
        switch (browserName.toLowerCase()) {
            case CHROME_DRIVER:
                driver = getChromeDriver();
                break;
            case FIREFOX_DRIVER:
                driver = getFirefoxDriver();
                break;
            case IE_DRIVER:
                driver = getIEDriver();
                break;
            default:
                throw new DriverException("No found driver for browser '" + browserName + "'.");
        }
        return driver;
    }

    private static String getPathToDriver(String browser) {
        return Objects.requireNonNull(Property.get(browser + "_driver_path"));
    }

    private static WebDriver getIEDriver() {
        DesiredCapabilities capabilities;
        WebDriver driver;
        System.setProperty("webdriver.ie.driver", getPathToDriver(IE_DRIVER));
        capabilities = DesiredCapabilities.internetExplorer();
        capabilities.setCapability(CapabilityType.ForSeleniumServer.ENSURING_CLEAN_SESSION, true);
        //noinspection deprecation
        driver = new org.openqa.selenium.ie.InternetExplorerDriver(capabilities);
        driver.manage().deleteAllCookies();
        return driver;
    }

    private static WebDriver getFirefoxDriver() {
        WebDriver driver;
        System.setProperty("webdriver.gecko.driver", getPathToDriver(FIREFOX_DRIVER));
        FirefoxProfile profile = new FirefoxProfile();
        profile.setAcceptUntrustedCertificates(true);
        FirefoxOptions firefoxOptions = new FirefoxOptions();
        firefoxOptions.setCapability(FirefoxDriver.PROFILE, profile);
        firefoxOptions.setCapability("marionette", true);

        driver = new FirefoxDriver(firefoxOptions);

        return driver;
    }

    private static WebDriver getChromeDriver() {
        WebDriver driver;
        System.setProperty("webdriver.chrome.driver", getPathToDriver(CHROME_DRIVER));
        driver = new ChromeDriver();
        driver.manage().deleteAllCookies();
        return driver;
    }
}
