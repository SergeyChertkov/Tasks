package driver.steps;

import cucumber.api.java.en.Then;
import driver.driver.Drivers;
import driver.framework.AbstractPage;
import driver.framework.Variables;

import static driver.steps.BrowserAction.setDriver;
import static driver.steps.Sites.lolSite;
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
        AbstractPage expected = lolSite.getPage(pageName);
        AbstractPage actual = lolSite.getCurrentPage();
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
        AbstractPage currentPage = lolSite.getCurrentPage();
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
}
