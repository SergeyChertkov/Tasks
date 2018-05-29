package lol;

import driver.framework.AbstractPage;
import driver.framework.elements.ElementsUtil;
import driver.framework.elements.IHaveAnXPath;
import org.openqa.selenium.WebDriver;

import java.util.HashMap;
import java.util.Map;

public class DashboardPage extends AbstractPage {
    public static final String URL = "https://app.mobalytics.gg/dashboard";
    private static Map<String, String> ELEMENTS = new HashMap<String, String>() {
        {
            putAll(LOLSite.ELEMENTS);
        }
    };

    DashboardPage(WebDriver driver) {
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
