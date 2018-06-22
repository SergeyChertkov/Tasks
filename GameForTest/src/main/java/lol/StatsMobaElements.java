package lol;

import cucumber.api.java.it.Ma;

import java.util.HashMap;
import java.util.Map;

public class StatsMobaElements {
    static Map<String, String> HOME_PAGE = new HashMap<String, String>() {
        {
            put("Input Search", "//input");
            put("Selector for region", "//div[contains(@class, 'start-page-searchstyles__Region')]");
            put("Button Go", "//div[contains(@class, 'start-page-searchstyles__Region')]/../..//button");

            put("What we found", "//div[@class='start-page-searchstyles__SearchResultsPanelStyled-no1e4h-6 ektQeF']/div[1]//span");
            put("Recent", "//div[@class='start-page-searchstyles__SearchResultsPanelStyled-no1e4h-6 ektQeF']/div[2]//span");
        }
    };

    static Map<String, String> NAVBAR = new HashMap<String, String>() {
        {
            put("navbar homepage link", "//div[@class='header-gamesstyles__LogoStyled-s1lqa2u4-2 fPEpOj']/..");

            put("navbar Download link", "//nav[@class='menustyles__WrapperStyled-s1ta8imn-0 jZYnPU']//a[1]");
            put("navbar ProvingGround link", "//nav[@class='menustyles__WrapperStyled-s1ta8imn-0 jZYnPU']//a[2]");
            put("navbar Blog link", "//nav[@class='menustyles__WrapperStyled-s1ta8imn-0 jZYnPU']//a[3]");

            put("navbar Profile link", "//nav[@class='header-menustyles__MenuNavStyled-s584mex-3 eVRuTy']/div[1]//span");
            put("navbar GPI link", "//nav[@class='header-menustyles__MenuNavStyled-s584mex-3 eVRuTy']/div[2]//span");
            put("navbar PreGame link", "//nav[@class='header-menustyles__MenuNavStyled-s584mex-3 eVRuTy']/div[3]//span");
            put("navbar PostGame link", "//nav[@class='header-menustyles__MenuNavStyled-s584mex-3 eVRuTy']/div[4]//span");

            put("navbar search link", "//div[@class='header-menustyles__OtherLinksStyled-s584mex-9 dXnczM']/div");
            put("navbar login button", "//div[@class='header-menustyles__OtherLinksStyled-s584mex-9 dXnczM']/button");
        }
    };

    static Map<String, String> SIGN_IN_POPUP = new HashMap<String, String>() {
        {
            put("sign-in popup email", "//input[@id='email']");
            put("sign-in popup password", "//input[@id='password']");
            put("sign-in popup title", "//p[contains(@class, 'authstyles__HeaderTitle')]");
            //самый ужасный xpath!!!
            put("sign-in close", "//*[@version='1.1']");
        }
    };

    static Map<String, String> SEARCH_POPUP = new HashMap<String, String>() {
        {
            put("search popup message: What are you trying to find", "//*[text()='What are you trying to find?']");
        }
    };

    static Map<String, String> PROFILE = new HashMap<String, String>() {
        {
            put("profile summoner name", "//*[contains(@class, 'profilestyles__SummonerName')]");
            put("profile icon", "//*[contains(@class, 'profilestyles__SummonerIcon')]//img");
            put("profile button refresh", "//*[contains(@class, 'summoner-data-loaderstyles__RefreshButtonLabel')]");
            put("profile message data load", "//*[contains(@class, 'summoner-data-loaderstyles__MessageText')]");
        }
    };

    static Map<String, String> GPI = new HashMap<String, String>() {
        {
            put("gpi radar", "//*[contains(@class, 'gpi-radarstyles__GpiRadar')]");
            put("gpi link Learn more", "//*[contains(@class, 'gpi-radarstyles__GpiLinkLabel')]");
            put("gpi role", "//*[contains(@class, 'gpi-radarstyles__GpiRole')]");
        }
    };

    static Map<String, String> TIER = new HashMap<String, String>() {
        {
            put("tier chart", "//*[contains(@class, 'game-types-overview')]//*[@id='chart']");
            put("tier rank progress banner", "//*[contains(@class, 'game-types-overviewstyles__LadderRankProgressBanner')]");
        }
    };

    static Map<String, String> CHAMPION_STATISTICS = new HashMap<String, String>() {
        {
            put("champion stat Name", "//p[@class='s1negosu-0 gcfbKS'][index]");
            put("champion stat Games", "//p[@class='s1negosu-0 ldRMgo'][index]");
            put("champion stat Win Rate", "//p[contains(@class,'champions-statisticstyles__WinRateStyled-vz9d5e-5')][index]");
            put("champion stat KDA", "//p[@class='s1negosu-0 fxSMYG'][index]");

            put("recent records name", "//div[@class='recordsstyles__WrapperStyled-s10636z9-0 geOHFb']//div[@class='recordsstyles__RecordTextStyled-s10636z9-5 dvLTfU'][index]");

            put("most played name", "//div[@class='played-withstyles__WrapperStyled-zkur38-0 iaiQiJ']//p[@class='played-withstyles__ChampionNameStyled-zkur38-5 eQMiKq'][index]");
            put("most played win to lost", "//div[@class='played-withstyles__WrapperStyled-zkur38-0 iaiQiJ']//p[@class='played-withstyles__WinsLossesStyled-zkur38-6 hJbZf'][index]");
            put("most played win rate", "//div[@class='played-withstyles__WrapperStyled-zkur38-0 iaiQiJ']//p[contains(@class,'played-withstyles__WinRateStyled-zkur')][index]");
        }
    };

    static Map<String, String> MATCH_HISTORY = new HashMap<String, String>() {
        {
            put("overall wins", "//div[@class='stats-linestyles__SummaryStatsStyled-s1xf1032-18 fEfCFn']//span[@class='stats-linestyles__WinsStyled-s1xf1032-7 jLPUAy']");
            put("overall lost", "//div[@class='stats-linestyles__SummaryStatsStyled-s1xf1032-18 fEfCFn']//span[@class='stats-linestyles__LossesStyled-s1xf1032-9 hVJyQN']");
            put("overall win to lost", "//div[@class='stats-linestyles__SummaryStatsStyled-s1xf1032-18 fEfCFn']//span[@class='stats-linestyles__WhiteTextStyled-s1xf1032-10 digHQv']");
            put("overall KDA", "//div[@class='stats-linestyles__StatsLineRow-s1xf1032-1 gFIOZa']/div[3]//span[@class='stats-linestyles__WhiteTextStyled-s1xf1032-10 digHQv']");
            put("overall KDA KP", "//div[@class='stats-linestyles__StatsLineRow-s1xf1032-1 gFIOZa']/div[3]//span[@class='stats-linestyles__KdaKpStyled-s1xf1032-19 kfOTTO']");

            put("recent top", "//div[@class='stats-linestyles__StatsLineWrapperStyled-s1xf1032-0 edyqtO']");
            put("recent top role wins", "//div[@class='stats-linestyles__ChampionStatsWrapperStyled-s1xf1032-3 gdkWrX']//span[@class='stats-linestyles__WinsStyled-s1xf1032-7 jLPUAy'][index]");
            put("recent top role lost", "//div[@class='stats-linestyles__ChampionStatsWrapperStyled-s1xf1032-3 gdkWrX']//span[@class='stats-linestyles__LossesStyled-s1xf1032-9 hVJyQN'][index]");
            put("recent top role win to lost", "//div[@class='stats-linestyles__ChampionStatsWrapperStyled-s1xf1032-3 gdkWrX']//span[@class='stats-linestyles__WhiteTextStyled-s1xf1032-10 digHQv'][index]");
            put("recent top role KDA KP", "//div[@class='stats-linestyles__ChampionStatsWrapperStyled-s1xf1032-3 gdkWrX']//span[@class='stats-linestyles__KdaKpStyled-s1xf1032-19 kfOTTO'][index]");

            put("queue button", "//p[@class='games-overview-filtersstyles__ButtonTextStyled-s143pvsp-4 bniVzJ'][index]");
            put("queue dropdown menu", "//div[@class='header-game-type-selectstyles__HeaderWrapper-ilbmgp-1 fyJpgp']");
            put("queue button in dropdown menu", "//p[@class='option-game-type-selectstyles__OptionStyled-hu18j-0 bMxajh'][index]");

            put("champions table", "//div[contains(@class,'gamestyles__GameWrapperStyled-s8vmmnq-0')][index]");
            put("champions table queue type", "//div[contains(@class,'gamestyles__GameWrapperStyled-s8vmmnq-0')]//p[@class='gamestyles__GameTypeStyled-s8vmmnq-3 gQDtwr'][index]");
            put("champions table role", "//div[contains(@class,'gamestyles__GameWrapperStyled-s8vmmnq-0')]//span[@class='gamestyles__ChampionRoleNameStyled-s8vmmnq-11 kcfJzl'][index]");
            put("champions table win lost", "//div[contains(@class,'gamestyles__GameWrapperStyled-s8vmmnq-0')]//p[@class='kdastyles__FullKdaValueStyled-cu2d9x-2 cfYbcV'][index]");
            put("champions table KDA", "//div[contains(@class,'gamestyles__GameWrapperStyled-s8vmmnq-0')]//p[@class='kdastyles__ShortKdaValueStyled-cu2d9x-3 EaMnl'][index]");
            put("champions table CS", "//div[contains(@class,'gamestyles__GameWrapperStyled-s8vmmnq-0')]//p[@class='gamestyles__CreepScoreStyled-s8vmmnq-24 bUDwGK'][index]");
            put("champions table KP", "//div[contains(@class,'gamestyles__GameWrapperStyled-s8vmmnq-0')]//p[@class='gamestyles__KillParticipationStyled-s8vmmnq-25 cPUsui'][index]");
        }
    };

    private StatsMobaElements() {
    }
}
