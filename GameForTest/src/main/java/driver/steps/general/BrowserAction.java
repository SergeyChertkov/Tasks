package driver.steps.general;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import driver.driver.Drivers;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;

import java.util.ArrayList;
import java.util.List;

import static driver.steps.Sites.getCurrentSite;

public class BrowserAction {

    @Given("^I maximize the window size$")
    public static void theMaximizeTheWindow() {
        theMaximizeTheWindow(Drivers.DEFAULT_DRIVER_NAME);
    }

    @Given("^driver \"([^\"]*)\": I maximize the window size$")
    public static void theMaximizeTheWindow(String driverName) {
        setDriver(driverName);
        getCurrentSite().getCurrentPage().maximizeTheWindow();
    }

    @Given("^the \"([^\"]*)\" browser is opened$")
    public static void theBrowserIsOpened(String browser) {
        theBrowserIsOpened(Drivers.DEFAULT_DRIVER_NAME, browser);
    }

    @Given("^driver \"([^\"]*)\": the \"([^\"]*)\" browser is opened$")
    public static void theBrowserIsOpened(String driverName, String browser) {
        Drivers.create(driverName, browser);
    }

    @Then("^close browser$")
    public static void closeBrowser() {
        closeBrowser(Drivers.DEFAULT_DRIVER_NAME);
    }

    @Then("^driver \"([^\"]*)\": close browser$")
    public static void closeBrowser(String driverName) {
        WebDriver driver = Drivers.get(driverName);
        List<String> tabs = new ArrayList<>(driver.getWindowHandles());
        for (String tab :
                tabs) {
            driver.switchTo().window(tab).close();
        }
        Drivers.put(driverName, null);
    }

    @When("^wait (\\d+) sec$")
    public static void waitSec(int time) throws InterruptedException {
        Thread.sleep(time * 1000L);
    }

    @When("^I reload the page$")
    public static void reloadThePage() {
        reloadThePage(Drivers.DEFAULT_DRIVER_NAME);
    }

    @When("^driver \"([^\"]*)\": I reload the page$")
    public static void reloadThePage(String driverName) {
        setDriver(driverName);
        getCurrentSite().getCurrentPage().relaodPage();
    }

    public static void setDriver(String driverName) {
        getCurrentSite().setDriver(Drivers.get(driverName));
    }

    @When("^execute javascript \"([^\"]*)\"$")
    public static void executeJavascript(String command) {
        executeJavascript(Drivers.DEFAULT_DRIVER_NAME, command);
    }

    @When("^driver \"([^\"]*)\": execute javascript \"([^\"]*)\"$")
    public static void executeJavascript(String driverName, String command) {
        getCurrentSite().getCurrentPage().setDriver(Drivers.get(driverName));
        jsExecute(command);

    }

    private static void jsExecute(String command) {
        JavascriptExecutor js = (org.openqa.selenium.JavascriptExecutor) getCurrentSite().getCurrentPage();
        js.executeScript(command);
    }

    @When("^I switch to frame \"([^\"]*)\"$")
    public static void iSwitchToFrame(String frameId) {
        iSwitchToFrame(Drivers.DEFAULT_DRIVER_NAME, frameId);
    }

    @When("^driver \"([^\"]*)\": I switch to frame \"([^\"]*)\"$")
    private static void iSwitchToFrame(String driverName, String frameId) {
        getCurrentSite().setDriver(Drivers.get(driverName));
        getCurrentSite().getCurrentPage().switchToFrame(frameId);
    }

    @When("^I switch to tab \"(\\d+)\"$")
    public static void iSwitchToFrame(int tabIndex) {
        iSwitchToFrame(Drivers.DEFAULT_DRIVER_NAME, tabIndex);
    }

    @When("^driver \"([^\"]*)\": I switch to tab \"([^\"]*)\"$")
    private static void iSwitchToFrame(String driverName, int tabIndex) {
        getCurrentSite().setDriver(Drivers.get(driverName));
        getCurrentSite().getCurrentPage().switchToTab(tabIndex);
    }
}
