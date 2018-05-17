package LoL;

import driverFramework.AbstractPage;
import driverFramework.IHaveAnXPath;
import org.openqa.selenium.WebDriver;

public class HomePage extends AbstractPage {
    public HomePage(WebDriver driver) {
        super(driver);
    }

    @Override
    public IHaveAnXPath getEntryForElementName(String fieldNameToFind) {
        return null;
    }

    @Override
    public String getUrl() {
        return null;
    }
}
