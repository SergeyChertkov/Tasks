package driver.framework;

import driver.framework.elements.IHaveAnXPath;
import org.openqa.selenium.*;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.util.ArrayList;
import java.util.List;

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
        text = Variables.replace(text);
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

    public AbstractPage maximizeTheWindow() {
        this.driver.manage().window().maximize();
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

    public String getValueOfTagForElement(String tagName, String elementName) {
        return getElementByName(elementName).getAttribute(tagName);
    }

    public String getCountOfElements(String name) {
        List<WebElement> allElements = getElementsByName(name);
        return String.valueOf(allElements.size());
    }

    public AbstractPage openNewTab() {
        ((JavascriptExecutor) driver).executeScript("window.open('about:blank', '-blank')");
        //driver.findElement(By.cssSelector("body")).sendKeys(Keys.CONTROL +"t");
        return this;
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
        String xpath = getEntryForElementName(name).getXPath();
        WebElement element = null;

        String xpathForSearch;
        int index;
        while (xpath.contains("[index=")) {
            int indexStart = xpath.indexOf("[index=") + 7;
            int indexEnd = indexStart + xpath.substring(indexStart).indexOf("]");
            xpathForSearch = xpath.substring(0, indexStart - 7);
            index = Integer.valueOf(xpath.substring(indexStart, indexEnd));
            if (element == null) {
                element = driver.findElements(By.xpath(xpathForSearch)).get(index - 1);
            } else {
                element = element.findElements(By.xpath(xpathForSearch)).get(index - 1);
            }
            xpath = xpath.substring(indexEnd+1);
            if(xpath.length()>0 && !xpath.contains("[index=")){
                element = element.findElements(By.xpath(xpath)).get(index - 1);
            }
        }
        if (element == null) {
            return webDreiverWait.until(ExpectedConditions.elementToBeClickable(By.xpath(getEntryForElementName(name).getXPath())));
        } else {
            return element;
        }
    }

    public List<WebElement> getElementsByName(String name) {
        return driver.findElements(By.xpath(getEntryForElementName(name).getXPath()));
    }

    public AbstractPage switchToFrame(String frameId) {
        if ("default".equalsIgnoreCase(frameId)) {
            driver.switchTo().defaultContent();
        } else {
            driver.switchTo().frame(frameId);
        }
        return this;
    }

    public AbstractPage switchToTab(int index) {
        List<String> tabs = new ArrayList<>(driver.getWindowHandles());
        driver.switchTo().window(tabs.get(index));
        return this;
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
