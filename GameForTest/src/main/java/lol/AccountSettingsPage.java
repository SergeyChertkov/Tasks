package lol;

import driver.framework.AbstractPage;
import driver.framework.elements.ElementsUtil;
import driver.framework.elements.IHaveAnXPath;
import org.openqa.selenium.WebDriver;

import java.util.HashMap;
import java.util.Map;

public class AccountSettingsPage extends AbstractPage {
    public static final String URL = "https://app.mobalytics.gg/account-settings";
    private static Map<String, String> ELEMENTS = new HashMap<String, String>() {
        {
            putAll(LOLSite.ELEMENTS);

            put("Link Delete my account","//p[contains(.,'Delete my account')]");
            put("TextArea Leave comment","//textarea[@placeholder='Leave comment ...']");
            put("Button Delete", "//button[@type='submit']//p[contains(.,'Delete')]");

            put("Input Old password", "//*[@id='oldPassword']");
            put("Input New password", "//*[@id='newPassword']");
            put("Input Repeat password", "//*[@id='repeatPassword']");
            put("Button change password","//button[contains(@class,'change-password')]");
        }
    };

    AccountSettingsPage(WebDriver driver) {
        super(driver);
    }

    @Override
    public IHaveAnXPath getEntryForElementName(String fieldNameToFind) {
        return ElementsUtil.getEntryForElementName(ELEMENTS, fieldNameToFind);
    }

    @Override
    public String getPageName() {
        String[] splittingClassName = this.getClass().toString().split("\\.");
        return splittingClassName[splittingClassName.length - 1].toLowerCase();
    }

    @Override
    public String getUrl() {
        return URL;
    }
}