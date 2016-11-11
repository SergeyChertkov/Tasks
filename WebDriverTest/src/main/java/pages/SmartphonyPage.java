package pages;

import org.openqa.selenium.WebDriver;

/**
 * Created by Sergii_Chertkov on 11/10/2016.
 */
public class SmartphonyPage extends ProductCatalogPage {

    public SmartphonyPage(WebDriver driver) {
        super(driver);
        url = "http://rozetka.com.ua/mobile-phones/c80003/filter/preset=smartfon/";
    }
}
