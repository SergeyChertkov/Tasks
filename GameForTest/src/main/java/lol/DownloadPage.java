package lol;

import driver.framework.AbstractPage;
import driver.framework.elements.ElementsUtil;
import driver.framework.elements.IHaveAnXPath;
import org.openqa.selenium.WebDriver;

import java.util.HashMap;
import java.util.Map;

public class DownloadPage extends AbstractPage {
    public static final String URL = "https://mobalytics.gg/download/";
    private static Map<String, String> ELEMENTS = new HashMap<String, String>() {
        {
            putAll(LOLSite.ELEMENTS);
        }
    };

    DownloadPage(WebDriver driver) {
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
