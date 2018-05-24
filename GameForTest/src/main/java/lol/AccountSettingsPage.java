package lol;

import driver.framework.AbstractPage;
import driver.framework.ElementsUtil;
import driver.framework.IHaveAnXPath;
import org.openqa.selenium.WebDriver;

import java.util.HashMap;
import java.util.Map;

public class AccountSettingsPage extends AbstractPage {
    public static final String URL = "https://app.mobalytics.gg/account-settings";
    private static Map<String, String> ELEMENTS = new HashMap<String, String>() {
        {
            putAll(LOLSite.ELEMENTS);
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
        return URL;
    }

    @Override
    public String getUrl() {
        return null;
    }
}