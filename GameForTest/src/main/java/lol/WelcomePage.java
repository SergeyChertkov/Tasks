package lol;

import driver.framework.AbstractPage;
import driver.framework.IHaveAnXPath;
import org.openqa.selenium.WebDriver;

public class WelcomePage extends AbstractPage {
    public static final String URL = "https://app.mobalytics.gg/welcome";

    public WelcomePage(WebDriver driver) {
        super(driver);
    }

    @Override
    public IHaveAnXPath getEntryForElementName(String fieldNameToFind) {
        return null;
    }

    @Override
    public String getUrl() {
        return URL;
    }

    @Override
    public String getPageName() {
        String[] splittingClassName = this.getClass().toString().split("\\.");
        return splittingClassName[splittingClassName.length-1];
    }
}