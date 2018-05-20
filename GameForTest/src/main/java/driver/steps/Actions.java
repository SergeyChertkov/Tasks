package driver.steps;

import cucumber.api.PendingException;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import driver.driver.Drivers;
import driver.utils.User;
import lol.LOLSite;
import lol.LoginPage;

import java.sql.Driver;

public class Actions {

    @Given("^the \"([^\"]*)\" browser is opened$")
    public void theBrowserIsOpened(String browser) {
        theBrowserIsOpened(Drivers.DEFAULT_DRIVER_NAME, browser);
    }

    @Given("^driver \"([^\"]*)\": the \"([^\"]*)\" browser is opened$")
    public void theBrowserIsOpened(String driverName, String browser) {
        Drivers.create(driverName, browser);
    }

    @When("^I open the \"([^\"]*)\"$")
    public void iOpenThe(String pageName) {
        iOpenThe(Drivers.DEFAULT_DRIVER_NAME, pageName);
    }

    @When("^driver \"([^\"]*)\": I open the \"([^\"]*)\"$")
    public void iOpenThe(String driverName, String pageName) {
        Drivers.setSite(driverName, new LOLSite(Drivers.get(driverName)));
        switch (pageName.toLowerCase()) {
            case LOLSite.LOGIN_PAGE:
                Drivers.getSite(driverName).addPage(pageName, new LoginPage(Drivers.get(driverName)));
                Drivers.getSite(driverName).page(pageName).open();
                break;
            default:
                throw new StepsException("Can not found page with name '" + pageName + "'.");
        }
    }

    @When("^login as \"([^\"]*)\"$")
    public void loginAs(String userName) {
        loginAs(Drivers.DEFAULT_DRIVER_NAME, userName);
    }

    @When("^driver \"([^\"]*)\": login as \"([^\"]*)\"$")
    public void loginAs(String driverName, String userName) {
        User user = new User(userName);
        Drivers.getSite(driverName).login(user);
    }

    @Then("^close browser$")
    public void closeBrowser() {
        closeBrowser(Drivers.DEFAULT_DRIVER_NAME);
    }

    @Then("^driver \"([^\"]*)\": close browser$")
    public void closeBrowser(String driverName) {
        Drivers.get(driverName).close();
        Drivers.put(driverName, null);
    }

    @When("^wait (\\d+) sec$")
    public static void waitSec(int time) {
        Drivers.getSite(Drivers.DEFAULT_DRIVER_NAME).getCurrentPage().wait(time);
    }

    @When("^I input \"([^\"]*)\" in \"([^\"]*)\"$")
    public void iInputIn(String arg0, String arg1) {
    }
}
