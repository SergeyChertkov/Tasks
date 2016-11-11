package pages;

import database.DataBase;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Sergii_Chertkov on 11/10/2016.
 */
public class ProductCatalogPage extends Page{

    public ProductCatalogPage(WebDriver driver) {
        super(driver);
    }

    public ProductCatalogPage saveTopProductsFromPage(){
        List<WebElement> topProductsNames = getElements("product name");
        List<WebElement> topProductsPrices = getElements("product price");

        DataBase.connect();
        for (int i=0; i<topProductsNames.size(); i++) {
            DataBase.execute("insert into products (name, price) values ('" +
                    topProductsNames.get(i).getText() + "', '" +
                    topProductsPrices.get(i).getText() + "')");
        }
        System.out.println("save top products to DB");
        DataBase.close();
        return this;
    }

}
