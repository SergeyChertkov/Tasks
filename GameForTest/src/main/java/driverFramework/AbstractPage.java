package driverFramework;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

public abstract class AbstractPage {
    WebDriver driver;

    public AbstractPage(WebDriver driver) {
        this.driver = driver;
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

    public AbstractPage open() {
        driver.get(getUrl());
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
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
        return driver.findElement(By.xpath(getEntryForElementName(name).getXPath()));
    }

    public abstract IHaveAnXPath getEntryForElementName(String fieldNameToFind);

    public String getPageName() {
        return "UndefinedPage";
    }

    public AbstractPage isPage(String pageName) {
        if (getPageName().equals(pageName)) {
            return this;
        }
        //TODO: Exception
        return null;
    }

    public abstract String getUrl();

    public AbstractPage wait(int time){
        pause(time);
        return this;
    }

    public static void pause(int time){
        try {
            Thread.sleep(time*1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
