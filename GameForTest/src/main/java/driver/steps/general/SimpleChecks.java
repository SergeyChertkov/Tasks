package driver.steps.general;

import cucumber.api.DataTable;
import cucumber.api.java.en.Then;
import driver.driver.Drivers;
import driver.framework.AbstractPage;
import driver.framework.Variables;

import java.util.List;

import static driver.steps.Sites.getCurrentSite;
import static driver.steps.general.BrowserAction.setDriver;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class SimpleChecks {

    @Then("^the page should be \"([^\"]*)\"$")
    public static void thePageShouldBe(String pageName) {
        thePageShouldBe(Drivers.DEFAULT_DRIVER_NAME, pageName);
    }

    @Then("^driver \"([^\"]*)\": the page should be \"([^\"]*)\"$")
    public static void thePageShouldBe(String driverName, String pageName) {
        setDriver(driverName);
        AbstractPage expected = getCurrentSite().getPage(pageName);
        AbstractPage actual = getCurrentSite().getCurrentPage();
        String message = "Expected page is '" + pageName + "', but actual is '" + actual.getPageName() + "'";
        assertEquals(message, expected, actual);
    }

    @Then("^element \"([^\"]*)\" should be \"([^\"]*)\"$")
    public static void elementShouldBe(String elementName, String expectedValue) {
        elementShouldBe(Drivers.DEFAULT_DRIVER_NAME, elementName, expectedValue);
    }

    @Then("^driver \"([^\"]*)\": element \"([^\"]*)\" should be \"([^\"]*)\"$")
    public static void elementShouldBe(String driverName, String elementName, String expectedValue) {
        setDriver(driverName);
        AbstractPage currentPage = getCurrentSite().getCurrentPage();
        expectedValue = Variables.replace(expectedValue);
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

    @Then("^I validate that count of element \"([^\"]*)\" equals \"([^\"]*)\"$")
    public static void validateCountOfElementEquals(String elementName, String expectedCountOfElement) {
        validateCountOfElementEquals(Drivers.DEFAULT_DRIVER_NAME, elementName, expectedCountOfElement);
    }

    @Then("^driver \"([^\"]*)\": I validate that count of element \"([^\"]*)\" equals \"([^\"]*)\"$")
    public static void validateCountOfElementEquals(String driverName, String elementName, String expectedCountOfElement) {
        setDriver(driverName);
        AbstractPage currentPage = getCurrentSite().getCurrentPage();
        expectedCountOfElement = Variables.replace(expectedCountOfElement);

        String actualResult = currentPage.getCountOfElements(elementName);

        String message = " ---- \n The number of elements 'elementName' with Xpath '"
                + currentPage.getElementByName(elementName) +"'\nExpected: " + expectedCountOfElement
                + "\nActual: " + actualResult;

        assertEquals(message, expectedCountOfElement, actualResult);
    }
}
