package driver.steps;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import driver.driver.Drivers;
import driver.utils.User;
import lol.LOLSite;

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
        Sites.lolSite = new LOLSite(Drivers.get(driverName));
        switch (pageName.toLowerCase()) {
            case "login page":
                Sites.lolSite.loginPage.open();
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
        Sites.lolSite.login(user);
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
        try {
            Thread.sleep(time * 1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    @When("^I input \"([^\"]*)\" in \"([^\"]*)\"$")
    public void iInputIn(String value, String element) {
        iInputIn(Drivers.DEFAULT_DRIVER_NAME, value, element);
    }

    @When("^^driver \"([^\"]*)\": I input \"([^\"]*)\" in \"([^\"]*)\"$")
    public void iInputIn(String driverName, String value, String element) {
        //TODO with using driver
        Sites.lolSite.getCurrentPage().type(element, value);
    }

    @When("^I click on \"([^\"]*)\"$")
    public static void clickOn(String element) {
        clickOn(Drivers.DEFAULT_DRIVER_NAME, element);
    }
    @When("^driver \"([^\"]*)\": I click on \"([^\"]*)\"$")
    public static void clickOn(String driverName, String element) {
        //TODO with using driver
        Sites.lolSite.getCurrentPage().clickOn(element);
    }
}
