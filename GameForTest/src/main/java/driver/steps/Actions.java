package driver.steps;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import driver.driver.Drivers;
import driver.utils.User;
import lol.LOLSite;
import org.openqa.selenium.JavascriptExecutor;

import java.text.SimpleDateFormat;
import java.util.Date;

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
        Drivers.get(driverName).close();
        Drivers.put(driverName, null);
    }

    @When("^wait (\\d+) sec$")
    public static void waitSec(int time) throws InterruptedException {
        Thread.sleep(time * 1000L);
    }

    @When("^I reload the page$")
    public static void reloadThePage() throws InterruptedException {
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
                new SimpleDateFormat("YYMMddHHmmss").format(new Date()));
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
        executeJavascriptWithDriver(Drivers.DEFAULT_DRIVER_NAME, command);
    }

    @When("^driver \"([^\"]*)\": execute javascript \"([^\"]*)\"$")
    public static void executeJavascriptWithDriver(String driverName, String command) {
        jsExecute(command);

    }

    public static void jsExecute(String command) {
        JavascriptExecutor js = (org.openqa.selenium.JavascriptExecutor) lolSite.getCurrentPage() ;
        js.executeScript(command);
    }



}
