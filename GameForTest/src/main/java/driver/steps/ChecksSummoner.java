package driver.steps;

import cucumber.api.java.en.Given;

import cucumber.api.Scenario;

import driver.utils.CurrentSummoner;



public class ChecksSummoner {

    private static Scenario scenario;

    @Given("^I gathering data about summoner with name \"([^\"]*)\" from platform \"([^\"]*)\" as \"([^\"]*)\" user$")
    public static void gatheringDataAboutSummonerWithName(String summonerName, String platformName, String userName) {
        //CurrentSummoner summoner = new CurrentSummoner (summonerName, platformName, userName);

    }

}
