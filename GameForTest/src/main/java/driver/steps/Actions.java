package driver.steps;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import driver.driver.Drivers;
import driver.utils.User;
import lol.LOLSite;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static driver.steps.SimpleChecks.thePageShouldBe;
import static driver.steps.Sites.lolSite;

public class Actions {

    @Given("^the \"([^\"]*)\" browser is opened$")
    public static void theBrowserIsOpened(String browser) {
        theBrowserIsOpened(Drivers.DEFAULT_DRIVER_NAME, browser);
    }

    @Given("^driver \"([^\"]*)\": the \"([^\"]*)\" browser is opened$")
    public static void theBrowserIsOpened(String driverName, String browser) {
        Drivers.create(driverName, browser);
    }

    @When("^I open the \"([^\"]*)\"$")
    public static void iOpenThe(String pageName) {
        iOpenThe(Drivers.DEFAULT_DRIVER_NAME, pageName);
    }

    @When("^driver \"([^\"]*)\": I open the \"([^\"]*)\"$")
    public static void iOpenThe(String driverName, String pageName) {
        lolSite = new LOLSite(Drivers.get(driverName));
        lolSite.getPage(pageName).open();
    }

    @When("^login as \"([^\"]*)\"$")
    public static void loginAs(String userName) {
        loginAs(Drivers.DEFAULT_DRIVER_NAME, userName);
    }

    @When("^driver \"([^\"]*)\": login as \"([^\"]*)\"$")
    public static void loginAs(String driverName, String userName) {
        User user = new User(userName);
        lolSite.setDriver(Drivers.get(driverName));
        lolSite.login(user);
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
        lolSite.getCurrentPage().relaodPage();
    }


    @When("^I input \"([^\"]*)\" in \"([^\"]*)\"$")
    public static void iInputIn(String value, String element) {
        iInputIn(Drivers.DEFAULT_DRIVER_NAME, value, element);
    }

    @When("^^driver \"([^\"]*)\": I input \"([^\"]*)\" in \"([^\"]*)\"$")
    public static void iInputIn(String driverName, String value, String elementName) {
        setDriver(driverName);
        //add timestamp for case in test set <timestamp>
        value = value.replaceAll("<timestamp>",
                new SimpleDateFormat("yyMMddHHmmss").format(new Date()));
        lolSite.getCurrentPage().type(elementName, value);
    }

    @When("^I click on \"([^\"]*)\"$")
    public static void clickOn(String element) {
        clickOn(Drivers.DEFAULT_DRIVER_NAME, element);
    }

    @When("^driver \"([^\"]*)\": I click on \"([^\"]*)\"$")
    public static void clickOn(String driverName, String element) {
        setDriver(driverName);
        lolSite.getCurrentPage().clickOn(element);
    }

    private static void setDriver(String driverName) {
        lolSite.setDriver(Drivers.get(driverName));
    }

    @When("^execute javascript \"([^\"]*)\"$")
    public static void executeJavascript(String command) {
        executeJavascript(Drivers.DEFAULT_DRIVER_NAME, command);
    }

    @When("^driver \"([^\"]*)\": execute javascript \"([^\"]*)\"$")
    public static void executeJavascript(String driverName, String command) {
        lolSite.getCurrentPage().setDriver(Drivers.get(driverName));
        jsExecute(command);

    }

    private static void jsExecute(String command) {
        JavascriptExecutor js = (org.openqa.selenium.JavascriptExecutor) lolSite.getCurrentPage();
        js.executeScript(command);
    }

    @When("^I register the user \"([^\"]*)\"$")
    public static void iRegisterTheUser(String userEmail) throws InterruptedException {
        iRegisterTheUser(Drivers.DEFAULT_DRIVER_NAME, userEmail);
    }

    @When("^driver \"([^\"]*)\": I register the user \"([^\"]*)\"$")
    public static void iRegisterTheUser(String driverName, String userEmail) throws InterruptedException {
        iOpenThe(driverName, "Login Page");
        clickOn(driverName, "Link for registration");
        iInputIn(driverName, userEmail + "@mailinator.com", "User email registration");
        iInputIn(driverName, userEmail, "Username registration");
        iInputIn(driverName, userEmail, "User pass registration");
        iInputIn(driverName, "geii", "Summoner name registration");
        clickOn(driverName, "SignUp button");
        waitSec(10);
        thePageShouldBe(driverName, "Welcome Page");
    }

    @When("^I switch to frame \"([^\"]*)\"$")
    public void iSwitchToFrame(String frameId) {
        iSwitchToFrame(Drivers.DEFAULT_DRIVER_NAME, frameId);
    }

    @When("^driver \"([^\"]*)\": I switch to frame \"([^\"]*)\"$")
    private void iSwitchToFrame(String driverName, String frameId) {
        lolSite.setDriver(Drivers.get(driverName));
        lolSite.getCurrentPage().switchToFrame(frameId);
    }

    @When("^I switch to tab \"(\\d+)\"$")
    public void iSwitchToFrame(int tabIndex) {
        iSwitchToFrame(Drivers.DEFAULT_DRIVER_NAME, tabIndex);
    }

    @When("^driver \"([^\"]*)\": I switch to tab \"([^\"]*)\"$")
    private void iSwitchToFrame(String driverName, int tabIndex) {
        lolSite.setDriver(Drivers.get(driverName));
        lolSite.getCurrentPage().switchToTab(tabIndex);
    }

    @Then("^login as new user \"([^\"]*)\"$")
    public void loginAsNewUser(String userName) {
        loginAsNewUser(Drivers.DEFAULT_DRIVER_NAME, userName);
    }

    @Then("^driver \"([^\"]*)\": login as new user \"([^\"]*)\"$")
    public void loginAsNewUser(String driverName, String userName) {
        User user = new User(userName + "@mailinator.com", userName);
        lolSite.setDriver(Drivers.get(driverName));
        lolSite.login(user);
    }
}
