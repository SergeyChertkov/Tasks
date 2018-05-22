package driver.steps;

import cucumber.api.DataTable;
import cucumber.api.java.en.Then;
import driver.driver.Drivers;
import driver.framework.AbstractPage;

import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class SimpleChecks {


    @Then("^the following elements should be$")
    public void followingElementsShouldBe(DataTable dataTable) {
        followingElementsShouldBe(Drivers.DEFAULT_DRIVER_NAME, dataTable);
    }
    @Then("^driver \"([^\"]*)\": following elements should be$")
    public void followingElementsShouldBe(String driverName, DataTable dataTable) {
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

    @Then("^the page should be \"([^\"]*)\"$")
    public void thePageShouldBe(String pageName) {
        thePageShouldBe(Drivers.DEFAULT_DRIVER_NAME, pageName);
    }

    @Then("^driver \"([^\"]*)\": the page should be \"([^\"]*)\"$")
    public void thePageShouldBe(String driverName, String pageName) {
        String expected = pageName.replaceAll(" ", "").toLowerCase();
        String actual = Sites.lolSite.getCurrentPage().getPageName().toLowerCase();
        String message = "Expected page is '" + expected + "', but actual is '" + actual + "'";
        assertEquals(message, expected, actual);
    }

    @Then("^element \"([^\"]*)\" should be \"([^\"]*)\"$")
    public static void elementShouldBe(String elementName, String expectedValue) {
        elementShouldBe(Drivers.DEFAULT_DRIVER_NAME, elementName, expectedValue);
    }

    @Then("^driver \"([^\"]*)\": element \"([^\"]*)\" should be \"([^\"]*)\"$")
    public static void elementShouldBe(String driverName, String elementName, String expectedValue) {
        AbstractPage currentPage = Sites.lolSite.getCurrentPage();
        String message = " ---- \n The element with Xpath " + currentPage.getElementByName(elementName)
                + "\nElement '" + elementName;
        switch (expectedValue) {
            case "present":
                message += "' expected 'present', but actual is 'not present'";
                assertTrue(message, currentPage.isPresent(elementName));
                break;
            case "not present":
                message += "' expected 'not present', but actual is 'present'";
                assertTrue(message, !currentPage.isPresent(elementName));
                break;
            case "displayed":
                message += "' expected 'displayed', but actual is 'not displayed'";
                assertTrue(message, currentPage.isDisplayed(elementName));
                break;
            case "not displayed":
                message += "' expected 'not displayed', but actual is 'displayed'";
                assertTrue(message, !currentPage.isDisplayed(elementName));
                break;
            default:
                String actualResult = currentPage.getText(elementName);
                message += "' expected '" + expectedValue + "', but actual is '" + actualResult + "'";
                message += "\nActual: " + actualResult + ";\n" + "Expected: " + expectedValue + ";\n";
                if (expectedValue.equalsIgnoreCase("empty")) {
                    expectedValue = "";
                }
                assertEquals(message, expectedValue, actualResult);
        }
    }
}
