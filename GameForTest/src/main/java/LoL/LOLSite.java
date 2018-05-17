package LoL;

import driverFramework.AbstractSite;
import org.openqa.selenium.WebDriver;

public class LOLSite extends AbstractSite {

    public LOLSite(WebDriver driver) {
        super(driver);
        super.addPage("loginPage", new LoginPage(driver));
    }

    public LOLSite login(){
        LoginPage loginpage = (LoginPage) page("loginPAge");
        loginpage.loginAs("klym@mobalyticshq.com","Password123");
        return this;
    }

}
