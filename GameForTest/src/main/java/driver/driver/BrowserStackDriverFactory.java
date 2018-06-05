package driver.driver;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;

import java.net.MalformedURLException;
import java.net.URL;

import static driver.driver.Drivers.CHROME_DRIVER;
import static driver.driver.Drivers.FIREFOX_DRIVER;
import static driver.driver.Drivers.IE_DRIVER;

public class BrowserStackDriverFactory {
    private static final String USERNAME = "nikolaylobanov3";
    private static final String AUTOMATE_KEY = "HymjXbrhN6ySwoywsDri";
    private static final String URL = "https://" + USERNAME + ":" + AUTOMATE_KEY + "@hub-cloud.browserstack.com/wd/hub";

    private BrowserStackDriverFactory() {
    }

    public static WebDriver create(String browserName) {
        WebDriver driver;
        switch (browserName.toLowerCase()) {
            case CHROME_DRIVER:
                driver = BrowserStackDriverFactory.generateWindows10Chrome62res1280x1024();
                break;
            case FIREFOX_DRIVER:
                driver = BrowserStackDriverFactory.generateWindows10Firefox60res1280x1024();
                break;
            case IE_DRIVER:
                driver = BrowserStackDriverFactory.generateWindows10Firefox60res1280x1024();
                break;
            default:
                throw new DriverException("No found driver for browser '" + browserName + "'.");
        }
        return driver;
    }

    static WebDriver generateIPhone7() {
        DesiredCapabilities caps = new DesiredCapabilities();
        caps.setCapability("browserName", "iPhone");
        caps.setCapability("device", "iPhone 7");
        caps.setCapability("realMobile", "true");
        caps.setCapability("os_version", "10.3");
        return generateDriverWithCapabilities(caps);
    }


    static WebDriver generateSamsungGalaxyS7() {
        DesiredCapabilities caps = new DesiredCapabilities();
        caps.setCapability("browserName", "android");
        caps.setCapability("device", "Samsung Galaxy S7");
        caps.setCapability("realMobile", "true");
        caps.setCapability("os_version", "6.0");
        return generateDriverWithCapabilities(caps);
    }

    static WebDriver generateIPad5th() {
        DesiredCapabilities caps = new DesiredCapabilities();
        caps.setCapability("browserName", "iPad");
        caps.setCapability("device", "iPad 5th");
        caps.setCapability("realMobile", "true");
        caps.setCapability("os_version", "11.0");
        return generateDriverWithCapabilities(caps);
    }

    static WebDriver generateSamsungGalaxyTab4() {
        DesiredCapabilities caps = new DesiredCapabilities();
        caps.setCapability("browserName", "android");
        caps.setCapability("device", "Samsung Galaxy Tab 4");
        caps.setCapability("realMobile", "true");
        caps.setCapability("os_version", "4.4");
        return generateDriverWithCapabilities(caps);
    }

    static WebDriver generateWindows10Chrome62res1280x1024() {
        DesiredCapabilities caps = new DesiredCapabilities();
        caps.setCapability("browser", "Chrome");
        caps.setCapability("browser_version", "62.0");
        caps.setCapability("os", "Windows");
        caps.setCapability("os_version", "10");
        caps.setCapability("resolution", "1280x1024");
        return generateDriverWithCapabilities(caps);
    }

    static WebDriver generateWindows10Firefox60res1280x1024() {
        DesiredCapabilities caps = new DesiredCapabilities();
        caps.setCapability("browser", "Firefox");
        caps.setCapability("browser_version", "60.0");
        caps.setCapability("os", "Windows");
        caps.setCapability("os_version", "10");
        caps.setCapability("resolution", "1280x1024");
        return generateDriverWithCapabilities(caps);
    }

    static WebDriver generateWindows10IE11res1280x1024() {
        DesiredCapabilities caps = new DesiredCapabilities();
        caps.setCapability("browser", "IE");
        caps.setCapability("browser_version", "11.0");
        caps.setCapability("os", "Windows");
        caps.setCapability("os_version", "10");
        caps.setCapability("resolution", "1280x1024");
        return generateDriverWithCapabilities(caps);
    }

    static WebDriver generateWindows10Edge17res1280x1024() {
        DesiredCapabilities caps = new DesiredCapabilities();
        caps.setCapability("browser", "Edge");
        caps.setCapability("browser_version", "17.0");
        caps.setCapability("os", "Windows");
        caps.setCapability("os_version", "10");
        caps.setCapability("resolution", "1280x1024");
        return generateDriverWithCapabilities(caps);
    }

    static WebDriver generateOSXHighSierraSafari11res1280x1024() {
        DesiredCapabilities caps = new DesiredCapabilities();
        caps.setCapability("browser", "Safari");
        caps.setCapability("browser_version", "11.0");
        caps.setCapability("os", "OS X");
        caps.setCapability("os_version", "High Sierra");
        caps.setCapability("resolution", "1024x768");
        return generateDriverWithCapabilities(caps);
    }


    private static WebDriver generateDriverWithCapabilities(DesiredCapabilities caps) {
        try {
            return new RemoteWebDriver(new URL(URL), caps);
        } catch (MalformedURLException e) {
            throw new DriverException(e);
        }
    }
}
