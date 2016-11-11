package pages;

import elements.Element;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;

import java.util.List;

/**
 * Created by Sergii_Chertkov on 11/10/2016.
 */
public class Page {
    protected String url = "";
    protected WebDriver driver;

    public Page(WebDriver driver){
        this.driver = driver;
    }

    public WebDriver getDriver(){
        return driver;
    }

    public String getUrl(){
        return url;
    }

    public Page open(){
        driver.get(url);
        System.out.println("open page " + url);
        return this;
    }

    public Page and(){
        return this;
    }

    public Page then(){
        return this;
    }

    public Page wait(int time){
        pause(time);
        return this;
    }

    public Page pageShouldBe(Page expectedPage){
        if (driver.getCurrentUrl().equals(expectedPage.getUrl())) {
            System.out.println("page " + expectedPage.getUrl() + " is load");
            return expectedPage;
        }
        throw new RuntimeException("Cannot load page " + expectedPage.getUrl());
    }

    public Page focusOn(String elementName){
        new Actions(driver).moveToElement(getElement(elementName)).perform();
        pause(1);
        System.out.println("focus on '" + elementName + "'");
        return this;
    }

    public Page clickOn(String elementName){
        getElement(elementName).click();
        pause(1);
        System.out.println("click on '" + elementName + "'");
        return this;
    }

    public String getText(String elementName){
        String result = getElement(elementName).getText();
        return result;
    }

    protected String getXPath(String elementName){
        return Element.getEntryForElementName(elementName).getXPath();
    }

    protected WebElement getElement(String elementName){
        return driver.findElement(By.xpath(getXPath(elementName)));
    }

    protected List<WebElement> getElements(String elementName){
        return driver.findElements(By.xpath(getXPath(elementName)));
    }

    public static void pause(int time){
        try {
            Thread.sleep(time*1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
