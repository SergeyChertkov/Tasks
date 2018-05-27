package driver.steps;

import cucumber.api.java.en.When;
import driver.driver.Drivers;
import lol.LOLSite;

import java.text.SimpleDateFormat;
import java.util.Date;

import static driver.steps.BrowserAction.setDriver;
import static driver.steps.Sites.lolSite;

public class SimpleAction {
    @When("^I open the \"([^\"]*)\"$")
    public static void iOpenThe(String pageName) {
        iOpenThe(Drivers.DEFAULT_DRIVER_NAME, pageName);
    }

    @When("^driver \"([^\"]*)\": I open the \"([^\"]*)\"$")
    public static void iOpenThe(String driverName, String pageName) {
        lolSite = new LOLSite(Drivers.get(driverName));
        lolSite.getPage(pageName).open();
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
}
