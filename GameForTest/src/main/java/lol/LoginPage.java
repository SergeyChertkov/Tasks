package lol;

import driver.framework.AbstractPage;
import driver.framework.ElementsUtil;
import driver.framework.IHaveAnXPath;
import org.openqa.selenium.WebDriver;

import java.util.HashMap;
import java.util.Map;

public class LoginPage extends AbstractPage {
    public static final String URL = "https://app.mobalytics.gg";
    public static final String URL2 = "https://accounts.mobalytics.gg/auth";

    private static Map<String, String> ELEMENTS = new HashMap<String, String>() {
        {
            put("User name input", "//*[@id='email']");
            put("Pass input", "//*[@id='password']");
            put("Button Login", "//button[@type='submit']");
            put("Login header", "//*[contains(@class, 'authstyles__Header')]");
            put("Link for registration", "//*[contains(@class, 'authstyles__NavigationLink')]");
            put("Link for forgot-password", "//*[contains(@class, 'authstyles__ForgotPassword')]");
            put("Error message", "//*[contains(@class, 'authstyles__Error')]");
            put("Error message for Password", "//*[@id='password']/../..//span[2]");
            put("Error message for User name", "//*[@id='email']/../..//span[2]");

            put("User email registration", "//*[@id='email']");
            put("Username registration", "//*[@id='name']");
            put("User pass registration", "//*[@id='password']");
            put("Summoner name registration", "//*[@id='summoner']");
            put("User region registration", "//*[@id='region']");
            put("SignUp button", "//button[@type='submit']");

        }
    };

    public LoginPage(WebDriver driver) {
        super(driver);
    }

    public AbstractPage loginAs(String name, String pass) {
        type("User name input", name);
        type("Pass input", pass);
        clickOn("Button Login");
        return this;
    }


    @Override
    public IHaveAnXPath getEntryForElementName(String fieldNameToFind) {
        return ElementsUtil.getEntryForElementName(ELEMENTS, fieldNameToFind);
    }

    @Override
    public String getPageName() {
        String[] splittingClassName = this.getClass().toString().split("\\.");
        return splittingClassName[splittingClassName.length-1].toLowerCase();
    }

    @Override
    public String getUrl() {
        return URL;
    }

    @Override
    public AbstractPage open() {
        super.open();
//        super.driver.switchTo().frame("moba-auth");
        return this;
    }
}
