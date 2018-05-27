package lol;

import driver.framework.AbstractPage;
import driver.framework.ElementsUtil;
import driver.framework.IHaveAnXPath;
import org.openqa.selenium.WebDriver;

import java.util.HashMap;
import java.util.Map;

public class MailinatorPage extends AbstractPage {
    public static final String URL = "https://www.mailinator.com/";
    public static final String URL2 = "https://www.mailinator.com/v2/inbox.jsp";
    private static Map<String, String> ELEMENTS = new HashMap<String, String>() {
        {
            put("first email - title", "//*[@class='all_message-min_autor ng-binding'][2]");
            put("input for email", "//*[@id='inboxfield']");
            put("go button", "//*[@class='btn btn-dark']");

            put("second email - name", "//*[@class='single_mail-body']//li[2]//div[@class='all_message-min_text all_message-min_text-3']]");

            put("link on inbox", "//*[@class='lb_all_item ng-scope'][1]//*[@class='lb_all_sub-item_text ng-binding']");

            put("email row", "//*[@class='single_mail-body']//li[%s]");
            put("first email line", "//*[@class='all_message-min_autor ng-binding'][2]");
            // f.e.: row<1> email - name
            put("row email - name", get("email row") + "//div[@class='all_message-min_text all_message-min_text-3']");

            put("email details header", "//*[@class='center']");

            put("email body: message", "//*[@class='module'][1]//div/div[2]");
            put("email body: verification button", "//*[contains(@class, 'button-')]//a");

            put("email - ", "//*[contains(text(), '%s')]");

        }
    };

    MailinatorPage(WebDriver driver) {
        super(driver);
    }

    @Override
    public IHaveAnXPath getEntryForElementName(String fieldNameToFind) {
        return ElementsUtil.getEntryForElementName(ELEMENTS, fieldNameToFind);
    }

    @Override
    public String getUrl() {
        return URL;
    }

    @Override
    public String getPageName() {
        String[] splittingClassName = this.getClass().toString().split("\\.");
        return splittingClassName[splittingClassName.length - 1].toLowerCase();
    }

    public MailinatorPage openInboxMailByTitle(String title) {
        clickOn("link on inbox").and().clickOn("email - <" + title + ">").than().wait(5);
        return this;
    }

    public MailinatorPage loginAs(String mail) {
        when().type("input for email", mail.split("@")[0]).and().clickOn("go button").than().wait(3);
        return this;
    }
}
