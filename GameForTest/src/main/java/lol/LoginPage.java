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
            put("user name", "//*[@id='email']");
            put("pass", "//*[@id='password']");
            put("forgot password", "//*[@class='login__forgot-password']");
            put("login button", "//button[@type='submit']");
        }
    };

    public LoginPage(WebDriver driver) {
        super(driver);
    }

    public AbstractPage loginAs(String name, String pass) {
        type("user name", name);
        type("pass", pass);
        clickOn("login button");
        return this;
    }


    @Override
    public IHaveAnXPath getEntryForElementName(String fieldNameToFind) {
        return ElementsUtil.getEntryForElementName(ELEMENTS, fieldNameToFind);
    }

    @Override
    public String getPageName() {
        String[] splittingClassName = this.getClass().toString().split("\\.");
        return splittingClassName[splittingClassName.length-1];
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
