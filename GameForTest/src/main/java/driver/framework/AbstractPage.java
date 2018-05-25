package driver.framework;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public abstract class AbstractPage {
    protected WebDriver driver;

    public AbstractPage(WebDriver driver) {
        this.driver = driver;
    }

    public AbstractPage setDriver(WebDriver driver) {
        this.driver = driver;
        return this;
    }

    public AbstractPage type(String name, String text) {
        getElementByName(name).clear();
        getElementByName(name).sendKeys(text);
        return this;
    }

    public AbstractPage clickOn(String name) {
        getElementByName(name).click();
        return this;
    }

    public AbstractPage relaodPage() {
        this.driver.navigate().refresh();
        return this;
    }

    public boolean isPresent(String name) {
        boolean result = false;
        try {
            if (getElementByName(name) != null) {
                result = true;
            }
        } finally {
            return result;
        }
    }

    public boolean isDisplayed(String name) {
        boolean result = false;
        try {
            if (getElementByName(name).isDisplayed()) {
                result = true;
            }
        } finally {
            return result;
        }
    }

    public String getText(String name) {
        return getElementByName(name).getText();
    }

    public AbstractPage open() {
        driver.get(getUrl());
        return this;
    }

    public AbstractPage and() {
        return this;
    }

    public AbstractPage when() {
        return this;
    }

    public AbstractPage than() {
        return this;
    }

    public WebElement getElementByName(String name) {
        WebDriverWait webDreiverWait = new WebDriverWait(driver, 30);
        return webDreiverWait.until(ExpectedConditions.elementToBeClickable(By.xpath(getEntryForElementName(name).getXPath())));
    }

    public abstract IHaveAnXPath getEntryForElementName(String fieldNameToFind);

    public abstract String getPageName();

    public AbstractPage isPage(String pageName) {
        if (pageName.equalsIgnoreCase(getPageName())) {
            return this;
        }
        throw new PageException("Current page '" + getPageName() + "' is not equals to expected page '" + pageName + "'");
    }

    public abstract String getUrl();

    public AbstractPage wait(int time) {
        pause(time);
        return this;
    }

    public static void pause(int time) {
        try {
            Thread.sleep(time * 1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
