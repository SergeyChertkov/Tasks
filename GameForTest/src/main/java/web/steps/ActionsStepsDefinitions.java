package web.steps;

import LoL.HomePage;
import LoL.LoginPage;
import cucumber.api.DataTable;
import cucumber.api.PendingException;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import driverFramework.AbstractPage;
import driverFramework.Propert;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

import java.util.concurrent.TimeUnit;

public class ActionsStepsDefinitions {

    static WebDriver driver;
    static AbstractPage abstractPage;


    @When("^login as \"([^\"]*)\"$")
    public void login_as(String arg1) throws Throwable {
        LoginPage loginPage = (LoginPage) abstractPage;
        loginPage.loginAs("klym@mobalyticshq.com", "Password123");
        loginPage.clickOn("login button");
        loginPage.wait(20);
    }

    @When("^I input \"([^\"]*)\" in \"([^\"]*)\"$")
    public void i_input_in(String arg1, String arg2) throws Throwable {

    }


//TODO: Transfer into Validation steps
    @Then("^the page should be \"([^\"]*)\"$")
    public void the_page_should_be(String arg1) throws Throwable {

    }

    @Then("^the following attributes of elements should be$")
    public void the_following_attributes_of_elemetns_should_be(DataTable arg1) throws Throwable {

    }

    @Then("^the following elements should be$")
    public void the_following_elements_should_be(DataTable arg1) throws Throwable {

    }

    @Then("^the url of current page is \"([^\"]*)\"$")
    public void the_url_of_current_page_is(String arg1) throws Throwable {

    }

    @Then("^the following elements should contains$")
    public void the_following_elements_should_contains(DataTable arg1) throws Throwable {

    }


    //TODO Transfer into Browser steps
@Given("^the \"([^\"]*)\" browser is opened$")
public void the_browser_is_opened(String arg1) throws Throwable {
    System.setProperty("webdriver.chrome.driver", Propert.get("webdriver_path"));
    driver = new ChromeDriver();
    driver.manage().timeouts().pageLoadTimeout(60, TimeUnit.SECONDS);
    driver.manage().timeouts().setScriptTimeout(60, TimeUnit.SECONDS);
}



    @Then("^close browser$")
    public void close_browser() throws Throwable {
        driver.close();
    }


    @When("^I open the \"([^\"]*)\"$")
    public void i_open_the(String pageName) throws Throwable {
        abstractPage = new LoginPage(driver);
        abstractPage.open();
//TODO: ??? Can't switch. I don't know why...
      /*  switch (pageName) {
            case "Login Page":
                LoginPage loginPage = new LoginPage(driver);
                loginPage.open();
                break;
            case "Home page":
                HomePage homePage = new HomePage(driver);
                homePage.open();
                break;
            default:
                break;
        }*/




    }


    @When("^wait (\\d+) sec$")
    public static void waitSec(int time) {
        pause(time);
    }

    public static void pause(int seconds) {
        try {
            Thread.sleep(seconds * 1000L);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }


}
