package driver.steps;

import cucumber.api.DataTable;
import cucumber.api.java.en.Then;
import driver.driver.Drivers;

import java.util.List;

import static driver.steps.SimpleChecks.elementShouldBe;

public class Checks {

    @Then("^the following elements should be$")
    public static void followingElementsShouldBe(DataTable dataTable) {
        followingElementsShouldBe(Drivers.DEFAULT_DRIVER_NAME, dataTable);
    }

    @Then("^driver \"([^\"]*)\": following elements should be$")
    public static void followingElementsShouldBe(String driverName, DataTable dataTable) {
        List<List<String>> data = dataTable.raw();
        String elementName;
        String expected;
        for (int i = 1; i < data.size(); i++) {
            List<String> raw = data.get(i);
            elementName = raw.get(0);
            expected = raw.get(1);
            elementShouldBe(driverName, elementName, expected);
        }
    }
}
