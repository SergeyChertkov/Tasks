package driver.steps;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import driver.driver.Drivers;
import driver.utils.User;
import lol.LOLSite;

import java.text.SimpleDateFormat;
import java.util.Date;

import static driver.steps.BrowserAction.setDriver;
import static driver.steps.BrowserAction.waitSec;
import static driver.steps.SimpleChecks.thePageShouldBe;
import static driver.steps.Sites.lolSite;

public class Actions {

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
