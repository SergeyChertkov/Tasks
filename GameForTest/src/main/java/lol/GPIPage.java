package lol;

import driver.framework.AbstractPage;
import driver.framework.ElementsUtil;
import driver.framework.IHaveAnXPath;
import org.openqa.selenium.WebDriver;

import java.util.HashMap;
import java.util.Map;

public class GPIPage extends AbstractPage {
    public static final String URL = "https://app.mobalytics.gg/gpi";
    private static Map<String, String> ELEMENTS = new HashMap<String, String>() {
        {
            putAll(LOLSite.ELEMENTS);

            put("character name", "//*[@data-reactid='177']");
        }
    };

    GPIPage(WebDriver driver) {
        super(driver);
    }

    @Override
    public IHaveAnXPath getEntryForElementName(String fieldNameToFind) {
        return ElementsUtil.getEntryForElementName(ELEMENTS, fieldNameToFind);
    }

    @Override
    public String getUrl() {
        return URL;
    }

    @Override
    public String getPageName() {
        String[] splittingClassName = this.getClass().toString().split("\\.");
        return splittingClassName[splittingClassName.length - 1].toLowerCase();
    }
}
