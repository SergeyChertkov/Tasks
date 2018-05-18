package LoL;

import driverFramework.AbstractPage;
import driverFramework.ElementsUtil;
import driverFramework.IHaveAnXPath;
import org.openqa.selenium.WebDriver;

import java.util.HashMap;
import java.util.Map;

public class LoginPage extends AbstractPage {

    private static Map<String, String> ELEMENTS = new HashMap<String, String>() {
        {
            put("user name", "//*[@id='email']");
            put("pass", "//*[@id='password']");
            put("forgot password", "//*[@class='login__forgot-password']");
            put("login button", "//*[@class='login__button-text']");
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
    public String getPageName(){
        return "LoginPage";
    }

    @Override
    public String getUrl(){
        return "https://app.mobalytics.gg/";
    }
}
