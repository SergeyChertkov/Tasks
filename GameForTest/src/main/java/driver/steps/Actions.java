package driver.steps;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import driver.driver.Drivers;
import driver.utils.User;
import lol.MailinatorPage;

import static driver.steps.BrowserAction.setDriver;
import static driver.steps.BrowserAction.waitSec;
import static driver.steps.SimpleAction.*;
import static driver.steps.SimpleChecks.thePageShouldBe;
import static driver.steps.Sites.lolSite;

public class Actions {


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


    @When("^I delete user who have been sign in$")
    public static void iDeleteUserWhoSignIn() throws InterruptedException {
        iDeleteUserWhoSignIn(Drivers.DEFAULT_DRIVER_NAME);
    }

    @When("^driver \"([^\"]*)\": I delete user who have been sign in$")
    public static void iDeleteUserWhoSignIn(String driverName) throws InterruptedException {
        BrowserAction.theMaximizeTheWindow(driverName);
        waitSec(2);
        clickOn(driverName,"account settings link");
        waitSec(2);
        clickOn(driverName,"Link Delete my account");
        iInputIn(driverName,"This's an automated test", "TextArea Leave comment");
        clickOn(driverName,"Button Delete");
        waitSec(2);
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
        iInputIn(driverName, "geei", "Summoner name registration");
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


    @When("^I login on mailinator as \"([^\"]*)\"$")
    public void iLoginOnMailinatorAs(String mailinatorName) {
        iLoginOnMailinatorAs(Drivers.DEFAULT_DRIVER_NAME, mailinatorName);
    }

    @When("^driver \"([^\"]*)\": I login on mailinator as \"([^\"]*)\"$")
    public void iLoginOnMailinatorAs(String driverName, String mailinatorName) {
        setDriver(driverName);
        MailinatorPage mailinator = (MailinatorPage) lolSite.getPage("mailinatorPage");
        mailinator.loginAs(mailinatorName);
    }

    @When("^I open mail by title \"([^\"]*)\"$")
    public void iOpenMailByTitle(String mailTitle) {
        iOpenMailByTitle(Drivers.DEFAULT_DRIVER_NAME, mailTitle);
    }

    @When("^driver \"([^\"]*)\": I open mail by title \"([^\"]*)\"$")
    public void iOpenMailByTitle(String driverName, String mailTitle) {
        setDriver(driverName);
        MailinatorPage mailinator = (MailinatorPage) lolSite.getPage("mailinatorPage");
        mailinator.openInboxMailByTitle(mailTitle);
    }
}
