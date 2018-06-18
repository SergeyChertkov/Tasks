package lol;

import driver.framework.AbstractPage;
import driver.framework.elements.ElementsUtil;
import driver.framework.elements.IHaveAnXPath;
import org.openqa.selenium.WebDriver;

import java.util.HashMap;
import java.util.Map;

public class StatsMobaPage extends AbstractPage {
    public static final String URL = "https://stats.moba.live/";
    private static Map<String, String> ELEMENTS = new HashMap<String, String>() {
        {
            putAll(StatsMobaElements.HOME_PAGE);
            putAll(StatsMobaElements.NAVBAR);
            putAll(StatsMobaElements.SIGN_IN_POPUP);
            putAll(StatsMobaElements.SEARCH_POPUP);
            putAll(StatsMobaElements.PROFILE);
            putAll(StatsMobaElements.CHAMPION_STATISTICS);
            putAll(StatsMobaElements.MATCH_HISTORY);
            putAll(StatsMobaElements.GPI);
            putAll(StatsMobaElements.TIER);

            put("Summoner Name", "//p[@class='profilestyles__SummonerNameStyled-s16k19pv-8 Ccbde']");

            put("All games block", "//div[contains(@class, 'gamestyles__GameBody')]");
            put("TIER STATS: number of wins", "//div[contains(@class, 'game-typestyles')]//p[2]");
            put("TIER STATS: number of loses", "//div[contains(@class, 'game-typestyles')]//p[3]");
        }
    };

    StatsMobaPage(WebDriver driver) {
        super(driver);
    }

    @Override
    public IHaveAnXPath getEntryForElementName(String fieldNameToFind) {
        return ElementsUtil.getEntryForElementName(ELEMENTS, fieldNameToFind);
    }

    @Override
    public String getPageName() {
        String[] splittingClassName = this.getClass().toString().split("\\.");
        return splittingClassName[splittingClassName.length - 1].toLowerCase();
    }

    @Override
    public String getUrl() {
        return URL;
    }
}