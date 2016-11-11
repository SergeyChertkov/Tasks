import database.DBResult;
import database.DataBase;
import database.Propert;
import org.junit.*;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.PageFactory;
import pages.*;

import java.util.concurrent.TimeUnit;

/**
 * Created by Sergii_Chertkov on 11/10/2016.
 */
public class TestCase {
    WebDriver driver;

    @BeforeClass
    public static void createTable(){
        DataBase.connect();
        DataBase.execute("drop table products");
        DataBase.execute("create table products (" +
                "  id int(10) unsigned NOT NULL auto_increment," +
                "  name varchar(200) NOT NULL," +
                "  price varchar(20) NOT NULL," +
                "  PRIMARY KEY  (id)" +
                ")");
        DataBase.close();
    }

    @AfterClass
    public static void checkTable(){
        DataBase.connect();
        DBResult result = new DBResult(DataBase.select("select * from products"));
        System.out.println("\n\n==========RESULT==========\n"
                + result + "====================");
        DataBase.close();
    }

    @Before
    public void init(){
        System.setProperty("webdriver.chrome.driver", Propert.get("webdriver_path"));
        driver = new ChromeDriver();
        driver.manage().timeouts().pageLoadTimeout(30, TimeUnit.SECONDS);
        driver.manage().timeouts().setScriptTimeout(30, TimeUnit.SECONDS);
    }

    @After
    public void end(){
        driver.close();
    }

    @Test
    public void testScenario(){
        MainPage mainPage = PageFactory.initElements(driver, MainPage.class);
        TelefonyTViElektronikaPage telefonyTViEhlektronikaPage = PageFactory.initElements(driver, TelefonyTViElektronikaPage.class);
        TelefonyPage telefonyPage = PageFactory.initElements(driver, TelefonyPage.class);
        SmartphonyPage smartphonyPage = PageFactory.initElements(driver, SmartphonyPage.class);

        mainPage.open().
                and().clickOn("telefony tv i elektronika link").
                then().clickOn("telefony tv i elektronika link").
                then().pageShouldBe(telefonyTViEhlektronikaPage).
                then().clickOn("telefony link").
                then().pageShouldBe(telefonyPage).
                then().clickOn("smartfony link").
                then().pageShouldBe(smartphonyPage);
        smartphonyPage.saveTopProductsFromPage().and().clickOn("page 2");
        smartphonyPage.saveTopProductsFromPage().and().clickOn("page 3");
        smartphonyPage.saveTopProductsFromPage();
    }
}
