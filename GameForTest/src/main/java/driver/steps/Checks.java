package driver.steps;

import cucumber.api.DataTable;
import cucumber.api.java.en.Then;

public class Checks {
    @Then("^the url of current page is \"([^\"]*)\"$")
    public void theUrlOfCurrentPageIs(String arg0) {
    }

    @Then("^the following elements should be$")
    public void theFollowingElementsShouldBe(DataTable dataTable)  {
    }

    @Then("^the following attributes of elements should be$")
    public void theFollowingAttributesOfElemetnsShouldBe(DataTable dataTable) {
    }

    @Then("^the following elements should contains$")
    public void theFollowingElementsShouldContains(DataTable dataTable) {
    }
}
