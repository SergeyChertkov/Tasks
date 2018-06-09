package driver.utils;


import driver.api.ApiSteps;
import driver.framework.Variables;
import driver.steps.ApiActions;
import driver.steps.general.SimpleAction;
import net.rithms.riot.api.ApiConfig;
import net.rithms.riot.api.RiotApi;
import net.rithms.riot.api.RiotApiException;
import net.rithms.riot.api.endpoints.league.dto.LeaguePosition;
import net.rithms.riot.constant.Platform;
import net.rithms.riot.api.endpoints.summoner.dto.Summoner;

import java.util.Set;

public class CurrentSummoner {

    String PERSONAL_KEY = "RGAPI-c7758423-bd64-40d5-bf2d-1d14c19c903a";
    String SUMMONER_NAME = "54b0mb99";
    String PLATFORM_NAME = "NA";
    String USER_NAME = "test_user_1";
    Platform PLATFORM = Platform.NA;



    public CurrentSummoner(String summonerName, String platformName, String userName) {

        PERSONAL_KEY = new User(userName).getRiotToken();
        SUMMONER_NAME = summonerName;
        PLATFORM_NAME = platformName;
        USER_NAME = userName;
        //TODO: we need to match the Platform and the platform Name that we got from attributes

        getSummonerBaseDataFromTheRIOTapi();
        getSummonerPositionDataFromTheRIOTapi();
        //getSummonerBaseDataFromTheLibraryForRIOTapi();
        //getSummonerPositionDataFromTheLibraryForRIOTapi();

    }

    public void getSummonerBaseDataFromTheRIOTapi() {
        //https://na1.api.riotgames.com/lol/summoner/v3/summoners/by-name/${SUMMONER_NAME}?api_key=${PERSONAL_KEY}
        String endPointBefore = "riot_api_host_na1/lol/summoner/v3/summoners/by-name/" + SUMMONER_NAME;
        String user = Variables.replace(USER_NAME);
        String endpoint = Variables.replace(endPointBefore);
        ApiSteps api = ApiActions.getApiData(user, endpoint);

        Variables.put("summoner.id", ApiActions.replaceElementsNamesOnApiValues(api,"#{id}" ));
        Variables.put("summoner.name", ApiActions.replaceElementsNamesOnApiValues(api,"#{name}" ));
        Variables.put("summoner.accountId", ApiActions.replaceElementsNamesOnApiValues(api,"#{accountId}" ));

        SimpleAction.printValueOfVariable("summoner.id");
        SimpleAction.printValueOfVariable("summoner.name");
        SimpleAction.printValueOfVariable("summoner.accountId");
    }

    public void getSummonerPositionDataFromTheRIOTapi(){
        //https://na1.api.riotgames.com/lol/league/v3/positions/by-summoner/${"riot"."getData"."/summoners/by-name"."response"."body"."id"}?api_key=${PERSONAL_KEY}
        String endPointBefore = "riot_api_host_na1" + "/lol/league/v3/positions/by-summoner/" + "${summoner.id}";
        String user = Variables.replace(USER_NAME);
        String endpoint = Variables.replace(endPointBefore);
        ApiSteps api = ApiActions.getApiData(user, endpoint);


        Variables.put("0.league.leagueName", ApiActions.replaceElementsNamesOnApiValues(api,"#{[0].leagueId}" ));
        Variables.put("0.league.tier", ApiActions.replaceElementsNamesOnApiValues(api,"#{[0].leagueName} " ));
        Variables.put("0.league.queueType", ApiActions.replaceElementsNamesOnApiValues(api,"#{[0].tier}" ));
        Variables.put("0.league.queueType", ApiActions.replaceElementsNamesOnApiValues(api,"#{[0].queueType}" ));
        Variables.put("0.league.rank", ApiActions.replaceElementsNamesOnApiValues(api,"#{[0].rank}" ));
        Variables.put("0.league.playerOrTeamId", ApiActions.replaceElementsNamesOnApiValues(api,"#{[0].playerOrTeamId}" ));
        Variables.put("0.league.playerOrTeamName", ApiActions.replaceElementsNamesOnApiValues(api,"#{[0].playerOrTeamName}" ));
        Variables.put("0.league.leaguePoints", ApiActions.replaceElementsNamesOnApiValues(api,"#{[0].leaguePoints}" ));
        Variables.put("0.league.wins", ApiActions.replaceElementsNamesOnApiValues(api,"#{[0].wins}" ));
        Variables.put("0.league.losses", ApiActions.replaceElementsNamesOnApiValues(api,"#{[0].losses}" ));
        Variables.put("0.league.veteran", ApiActions.replaceElementsNamesOnApiValues(api,"#{[0].veteran}" ));
        Variables.put("0.league.inactive", ApiActions.replaceElementsNamesOnApiValues(api,"#{[0].inactive}" ));
        Variables.put("0.league.freshBlood", ApiActions.replaceElementsNamesOnApiValues(api,"#{[0].freshBlood}" ));
        Variables.put("0.league.hotStreak", ApiActions.replaceElementsNamesOnApiValues(api,"#{[0].hotStreak}" ));
        /*
        SimpleAction.printValueOfVariable("0.league.leagueName");
        SimpleAction.printValueOfVariable("0.league.tier");
        SimpleAction.printValueOfVariable("0.league.queueType");
        SimpleAction.printValueOfVariable("0.league.queueType");
        SimpleAction.printValueOfVariable("0.league.rank");
        SimpleAction.printValueOfVariable("0.league.playerOrTeamId");
        SimpleAction.printValueOfVariable("0.league.playerOrTeamName");
        SimpleAction.printValueOfVariable("0.league.leaguePoints");
        SimpleAction.printValueOfVariable("0.league.wins");
        SimpleAction.printValueOfVariable("0.league.losses");
        SimpleAction.printValueOfVariable("0.league.veteran");
        SimpleAction.printValueOfVariable("0.league.inactive");
        SimpleAction.printValueOfVariable("0.league.freshBlood");
        SimpleAction.printValueOfVariable("0.league.hotStreak");
        */
        Variables.put("1.league.leagueName", ApiActions.replaceElementsNamesOnApiValues(api,"#{[1].leagueId}" ));
        Variables.put("1.league.tier", ApiActions.replaceElementsNamesOnApiValues(api,"#{[1].leagueName} " ));
        Variables.put("1.league.queueType", ApiActions.replaceElementsNamesOnApiValues(api,"#{[1].tier}" ));
        Variables.put("1.league.queueType", ApiActions.replaceElementsNamesOnApiValues(api,"#{[1].queueType}" ));
        Variables.put("1.league.rank", ApiActions.replaceElementsNamesOnApiValues(api,"#{[1].rank}" ));
        Variables.put("1.league.playerOrTeamId", ApiActions.replaceElementsNamesOnApiValues(api,"#{[1].playerOrTeamId}" ));
        Variables.put("1.league.playerOrTeamName", ApiActions.replaceElementsNamesOnApiValues(api,"#{[1].playerOrTeamName}" ));
        Variables.put("1.league.leaguePoints", ApiActions.replaceElementsNamesOnApiValues(api,"#{[1].leaguePoints}" ));
        Variables.put("1.league.wins", ApiActions.replaceElementsNamesOnApiValues(api,"#{[1].wins}" ));
        Variables.put("1.league.losses", ApiActions.replaceElementsNamesOnApiValues(api,"#{[1].losses}" ));
        Variables.put("1.league.veteran", ApiActions.replaceElementsNamesOnApiValues(api,"#{[1].veteran}" ));
        Variables.put("1.league.inactive", ApiActions.replaceElementsNamesOnApiValues(api,"#{[1].inactive}" ));
        Variables.put("1.league.freshBlood", ApiActions.replaceElementsNamesOnApiValues(api,"#{[1].freshBlood}" ));
        Variables.put("1.league.hotStreak", ApiActions.replaceElementsNamesOnApiValues(api,"#{[1].hotStreak}" ));
        /*
        SimpleAction.printValueOfVariable("1.league.leagueName");
        SimpleAction.printValueOfVariable("1.league.tier");
        SimpleAction.printValueOfVariable("1.league.queueType");
        SimpleAction.printValueOfVariable("1.league.queueType");
        SimpleAction.printValueOfVariable("1.league.rank");
        SimpleAction.printValueOfVariable("1.league.playerOrTeamId");
        SimpleAction.printValueOfVariable("1.league.playerOrTeamName");
        SimpleAction.printValueOfVariable("1.league.leaguePoints");
        SimpleAction.printValueOfVariable("1.league.wins");
        SimpleAction.printValueOfVariable("1.league.losses");
        SimpleAction.printValueOfVariable("1.league.veteran");
        SimpleAction.printValueOfVariable("1.league.inactive");
        SimpleAction.printValueOfVariable("1.league.freshBlood");
        SimpleAction.printValueOfVariable("1.league.hotStreak");
        */
    }

    public void getSummonerBaseDataFromTheLibraryForRIOTapi() {

     ApiConfig config = new ApiConfig().setKey(PERSONAL_KEY);
        RiotApi api = new RiotApi(config);

        Summoner summoner = null;
        try {
            summoner = api.getSummonerByName(PLATFORM, SUMMONER_NAME);
        } catch (RiotApiException e) {
            e.printStackTrace();
        }

        Variables.put("summoner.id", String.valueOf(summoner.getId()));
        Variables.put("summoner.name", summoner.getName());
        Variables.put("summoner.accountId", String.valueOf(summoner.getAccountId()));

        SimpleAction.printValueOfVariable("summoner.id");
        SimpleAction.printValueOfVariable("summoner.name");
        SimpleAction.printValueOfVariable("summoner.accountId");

    }

    public void getSummonerPositionDataFromTheLibraryForRIOTapi() {
        ApiConfig config = new ApiConfig().setKey(PERSONAL_KEY);
        RiotApi api = new RiotApi(config);
        Summoner summoner = null;
        try {
            summoner = api.getSummonerByName(PLATFORM, SUMMONER_NAME);
        } catch (RiotApiException e) {
            e.printStackTrace();
        }

        Set<LeaguePosition> matchPositionList = null;
        try {
            matchPositionList = api.getLeaguePositionsBySummonerId(PLATFORM, summoner.getId());
        } catch (RiotApiException e) {
            e.printStackTrace();
        }

        int index = 0;
        for (LeaguePosition leaguePosition: matchPositionList) {

            Variables.put(index + ".league.leagueName", leaguePosition.getLeagueName());
            Variables.put(index + ".league.tier", leaguePosition.getTier());
            Variables.put(index + ".league.queueType", leaguePosition.getQueueType());
            Variables.put(index + ".league.rank", leaguePosition.getRank());
            Variables.put(index + ".league.playerOrTeamId", leaguePosition.getPlayerOrTeamId());
            Variables.put(index + ".league.playerOrTeamName", leaguePosition.getPlayerOrTeamName());
            Variables.put(index + ".league.leaguePoints", String.valueOf(leaguePosition.getLeaguePoints()));
            Variables.put(index + ".league.wins", String.valueOf(leaguePosition.getWins()));
            Variables.put(index + ".league.losses", String.valueOf(leaguePosition.getLosses()));
            Variables.put(index + ".league.veteran", String.valueOf(leaguePosition.isVeteran()));
            Variables.put(index + ".league.inactive", String.valueOf(leaguePosition.isInactive()));
            Variables.put(index + ".league.freshBlood", String.valueOf(leaguePosition.isFreshBlood()));
            Variables.put(index + ".league.hotStreak", String.valueOf(leaguePosition.isHotStreak()));

            SimpleAction.printValueOfVariable(index + ".league.leagueName");
            SimpleAction.printValueOfVariable(index + ".league.tier");
            SimpleAction.printValueOfVariable(index + ".league.queueType");
            SimpleAction.printValueOfVariable(index + ".league.queueType");
            SimpleAction.printValueOfVariable(index + ".league.rank");
            SimpleAction.printValueOfVariable(index + ".league.playerOrTeamId");
            SimpleAction.printValueOfVariable(index + ".league.playerOrTeamName");
            SimpleAction.printValueOfVariable(index + ".league.leaguePoints");
            SimpleAction.printValueOfVariable(index + ".league.wins");
            SimpleAction.printValueOfVariable(index + ".league.losses");
            SimpleAction.printValueOfVariable(index + ".league.veteran");
            SimpleAction.printValueOfVariable(index + ".league.inactive");
            SimpleAction.printValueOfVariable(index + ".league.freshBlood");
            SimpleAction.printValueOfVariable(index + ".league.hotStreak");

            System.out.println("+++++++++++++++++++++++++++");

            index++;
        }



    }
}
