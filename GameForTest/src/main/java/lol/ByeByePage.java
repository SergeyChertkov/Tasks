package lol;

import driver.framework.AbstractPage;
import driver.framework.ElementsUtil;
import driver.framework.IHaveAnXPath;
import org.openqa.selenium.WebDriver;

import java.util.HashMap;
import java.util.Map;

public class ByeByePage extends AbstractPage {
    public static final String URL = "https://app.mobalytics.gg/bye-bye";
    private static Map<String, String> ELEMENTS = new HashMap<String, String>() {
        {
            put("Message: Your Mobalytics Account is closed!","//p[contains(.,'Your Mobalytics Account is closed!')]");
            put("Message: Thank you for giving us a try","//p[contains(.,'Thank you for giving us a try.')]");
            put("Message: Go back to Mobalytics.gg", "//p[contains(.,'Go back to Mobalytics.gg')]");
        }
    };

    ByeByePage(WebDriver driver) {
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