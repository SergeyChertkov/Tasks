package pages;

import org.openqa.selenium.WebDriver;

/**
 * Created by sergey on 11.11.2016.
 */
public class TelefonyPage extends Page{
    public TelefonyPage(WebDriver driver) {
        super(driver);
        url = "http://rozetka.com.ua/telefony/c4627900/";
    }
}
