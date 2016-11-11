package pages;

import org.openqa.selenium.WebDriver;

/**
 * Created by Sergii_Chertkov on 11/10/2016.
 */
public class MainPage extends Page {

    public MainPage(WebDriver driver) {
        super(driver);
        url = "http://rozetka.com.ua/";
    }

    public Page clickOnPhoneTVElectricCategry(){
        clickOn("Phone TV Electric Link");
        return new TelefonyTViElektronikaPage(driver);
    }
}
