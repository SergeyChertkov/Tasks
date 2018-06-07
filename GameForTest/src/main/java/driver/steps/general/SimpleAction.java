package driver.steps.general;

import cucumber.api.DataTable;
import cucumber.api.Scenario;
import cucumber.api.java.Before;
import cucumber.api.java.en.When;
import driver.driver.Drivers;
import driver.framework.Variables;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import static driver.steps.Sites.getCurrentSite;
import static driver.steps.general.BrowserAction.setDriver;

public class SimpleAction {
    private static Scenario scenario;

    @Before
    public static void before(Scenario scenario) {
        SimpleAction.scenario = scenario;
    }

    public static void printToReport(String text) {
        scenario.write(text);
    }

    @When("^print value of variable \"([^\"]*)\"$")
    public static void printValueOfVariable(String variableName) {
        scenario.write(variableName + " = " + Variables.get(variableName));
        System.out.println(variableName + " = " + Variables.get(variableName));
    }

    @When("^print values of variables$")
    public static void printValuesOfVariables(DataTable dataTable) {
        List<List<String>> data = dataTable.raw();
        for (int i = 1; i < data.size(); i++) {
            printValueOfVariable(data.get(i).get(0));
        }
    }


    @When("^generate variable \"([^\"]*)\" with value \"([^\"]*)\"$")
    public static void generateVariableWithValue(String variableName, String value) {
        if(value.contains("TIMESTAMP")){
            value = value.replaceAll("TIMESTAMP",
                    new SimpleDateFormat("yyMMddHHmmss").format(new Date()));
        }
        Variables.put(variableName,value);
        printValueOfVariable(variableName);
    }

    @When("^generate variables with values$")
    public static void generateVariablesWithValues(DataTable dataTable) {
        List<List<String>> data = dataTable.raw();
        String variableName;
        String value;
        for (int i = 1; i < data.size(); i++) {
            List<String> raw = data.get(i);
            variableName = raw.get(0);
            value = raw.get(1);
            generateVariableWithValue(variableName, value);
        }
    }

    @When("^I open the \"([^\"]*)\"$")
    public static void iOpenThe(String pageName) {
        iOpenThe(Drivers.DEFAULT_DRIVER_NAME, pageName);
    }

    @When("^I open new tab$")
    public static void iOpenNewTab() {
        iOpenNewTab(Drivers.DEFAULT_DRIVER_NAME);
    }

    @When("^driver \"([^\"]*)\":I open new tab$")
    public static void iOpenNewTab(String driverName) {
        getCurrentSite().setDriver(Drivers.get(driverName));
        getCurrentSite().getCurrentPage().openNewTab();
    }


    @When("^driver \"([^\"]*)\": I open the \"([^\"]*)\"$")
    public static void iOpenThe(String driverName, String pageName) {
        getCurrentSite().setDriver(Drivers.get(driverName));
        getCurrentSite().getPage(pageName).open();
    }

    @When("^I input \"([^\"]*)\" in \"([^\"]*)\"$")
    public static void iInputIn(String value, String element) {
        iInputIn(Drivers.DEFAULT_DRIVER_NAME, value, element);
    }

    @When("^^driver \"([^\"]*)\": I input \"([^\"]*)\" in \"([^\"]*)\"$")
    public static void iInputIn(String driverName, String value, String elementName) {
        setDriver(driverName);
         getCurrentSite().getCurrentPage().type(elementName, value);
    }

    @When("^I click on \"([^\"]*)\"$")
    public static void clickOn(String element) {
        clickOn(Drivers.DEFAULT_DRIVER_NAME, element);
    }

    @When("^driver \"([^\"]*)\": I click on \"([^\"]*)\"$")
    public static void clickOn(String driverName, String element) {
        setDriver(driverName);
        getCurrentSite().getCurrentPage().clickOn(element);
    }

    @When("^I save value \"([^\"]*)\" to variable \"([^\"]*)\"$")
    public static void iSaveValueToVariable(String value, String variableName) {
        Variables.put(variableName, value);
    }

    @When("^I save values \"([^\"]*)\" to variables \"([^\"]*)\"$")
    public static void iSaveValuesToVariables(DataTable dataTable) {
        List<List<String>> data = dataTable.raw();
        String value;
        String variableName;
        for (int i = 1; i < data.size(); i++) {
            variableName = data.get(i).get(0);
            value = data.get(i).get(1);
            Variables.put(variableName, value);
        }
    }
}
