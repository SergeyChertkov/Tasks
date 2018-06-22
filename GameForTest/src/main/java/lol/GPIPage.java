package lol;

import driver.framework.AbstractPage;
import driver.framework.elements.ElementsUtil;
import driver.framework.elements.IHaveAnXPath;
import org.openqa.selenium.WebDriver;

import java.util.HashMap;
import java.util.Map;

public class GPIPage extends AbstractPage {
    public static final String URL = "https://app.mobalytics.gg/gpi";
    private static Map<String, String> ELEMENTS = new HashMap<String, String>() {
        {
            putAll(LOLSite.ELEMENTS);

            put("character name", "//*[contains(@class, 'gpi-summonerstyles__SummonerName')]");
            put("number of wins", "//*[@data-reactid='174']");
            put("Link Skip tutorial","//p[contains(.,'Skip tutorial')]");
            put("Close the popup","//*[@class='_3huRp']");

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
