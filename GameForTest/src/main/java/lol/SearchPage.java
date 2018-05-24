package lol;

import driver.framework.AbstractPage;
import driver.framework.ElementsUtil;
import driver.framework.IHaveAnXPath;
import org.openqa.selenium.WebDriver;

import java.util.HashMap;
import java.util.Map;

public class SearchPage extends AbstractPage {
    public static final String URL = "https://app.mobalytics.gg/search";
    private static Map<String, String> ELEMENTS = new HashMap<String, String>() {
        {
            putAll(LOLSite.ELEMENTS);
        }
    };

    SearchPage(WebDriver driver) {
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
