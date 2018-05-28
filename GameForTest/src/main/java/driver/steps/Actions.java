package driver.steps;

import cucumber.api.DataTable;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import driver.api.steps.ApiSteps;
import driver.driver.Drivers;
import driver.utils.User;
import lol.MailinatorPage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static driver.steps.BrowserAction.setDriver;
import static driver.steps.BrowserAction.waitSec;
import static driver.steps.SimpleAction.*;
import static driver.steps.SimpleChecks.thePageShouldBe;
import static driver.steps.Sites.lolSite;

public class Actions {

    static Map<String, String> variables = new HashMap<>();

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

    @When("^I save values from the RAIN API$")
    public void iSaveValuesFromTheRAINapi(DataTable dataTable) {
        List<List<String>> data = dataTable.raw();
        String user = data.get(0).get(0);
        String endpoint = data.get(0).get(1);
        ApiSteps api = getApiData(user, endpoint);
        String value;
        String variableName;
        for (int i = 1; i < data.size(); i++) {
            variableName = data.get(i).get(0);
            value = replaceElementsNamesOnApiValues(api, data.get(i).get(1));
            variables.put(variableName, value);
        }
    }

    public static ApiSteps getApiData(String userName, String endpoint) {
        ApiSteps api = new ApiSteps();
        api.disablePrint();
        User user = new User(userName);
        api.saveToken(user.getRiotToken());
        api.sentEndpointWithToken("get", replaceElementsNamesOnSavedValues(endpoint));
        return api;
    }

    static String replaceElementsNamesOnSavedValues(String text) {
        String result = text;
        while (result.contains("<")) {
            int start = result.indexOf('<');
            int end = result.indexOf('>');
            if (start >= 0 && end > start) {
                result = result.substring(0, start)
                        + variables.get(result.substring(start + 1, end))
                        + result.substring(end + 1);
            }
        }
        return result;
    }

    static String replaceElementsNamesOnApiValues(ApiSteps api, String text) {
        String result = text;
        while (result.contains("{")) {
            int start = result.indexOf('{');
            int end = result.indexOf('}');
            if (start >= 0 && end > start) {
                result = result.substring(0, start)
                        + api.getElementValueFromResponse(result.substring(start + 1, end))
                        + result.substring(end + 1);
            }
        }
        return result;
    }
}
