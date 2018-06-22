//
//import net.rithms.riot.api.endpoints.league.dto.LeaguePosition;
//import net.rithms.riot.api.endpoints.match.dto.MatchList;
//import net.rithms.riot.api.endpoints.match.dto.MatchPosition;
//import net.rithms.riot.api.endpoints.match.dto.MatchReference;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

//import net.rithms.riot.api.ApiConfig;
//import net.rithms.riot.api.RiotApi;
//import net.rithms.riot.api.RiotApiException;
//import net.rithms.riot.api.endpoints.summoner.dto.Summoner;
//import net.rithms.riot.constant.Platform;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;


public class sumonerTest {
//
//    String PERSONAL_KEY = "RGAPI-c7758423-bd64-40d5-bf2d-1d14c19c903a";
//    String SUMMONER_NAME = "54b0mb99";
//    Platform  PLATFORM = Platform.NA;
//
//    public sumonerTest() {
//    }
//
//    @Before
//    public void precondition() {
//
//    }
//
//    @After
//    public void postcondition() {
//
//    }
//
//    @Test
//    public void firstTest()  throws RiotApiException {
//        ApiConfig config = new ApiConfig().setKey(PERSONAL_KEY);
//        RiotApi api = new RiotApi(config);
//
//        Summoner summoner = api.getSummonerByName(PLATFORM, SUMMONER_NAME);
//        System.out.println("Name: " + summoner.getName());
//        System.out.println("Summoner ID: " + summoner.getId());
//        System.out.println("Account ID: " + summoner.getAccountId());
//        System.out.println("Summoner Level: " + summoner.getSummonerLevel());
//        System.out.println("Profile Icon ID: " + summoner.getProfileIconId());
//    }
//
//    @Test
//    public void secondTest()  throws RiotApiException {
//        ApiConfig config = new ApiConfig().setKey(PERSONAL_KEY);
//        RiotApi api = new RiotApi(config);
//
//        // First we need to request the summoner because we will need it's account ID
//        Summoner summoner = api.getSummonerByName(PLATFORM, SUMMONER_NAME);
//
//        // Then we can use the account ID to request the summoner's match list
//        MatchList matchList = api.getMatchListByAccountId(PLATFORM, summoner.getAccountId());
//
//        System.out.println("Total Games in requested match list: " + matchList.getTotalGames());
//
//        Map<Integer,Integer> counterOfQueue = new HashMap<>();
//
//        // We can now iterate over the match list to access the data
//        if (matchList.getMatches() != null) {
//            for (MatchReference match : matchList.getMatches()) {
//                //System.out.println(" GameID:" + match.getQueue()
//                //        +" Role: " + match.getRole()
//                //        );
//                if ( counterOfQueue.containsKey(match.getQueue()) ) {
//                    int currentValue = counterOfQueue.get(match.getQueue());
//                    counterOfQueue.replace(match.getQueue(), ++currentValue);
//                }else {
//                    counterOfQueue.put(match.getQueue(), 1);
//                }
//
//            }
//        }
//
//        // Display content using Iterator*/
//        Set set = counterOfQueue.entrySet();
//        Iterator iterator = set.iterator();
//        while(iterator.hasNext()) {
//            Map.Entry mentry = (Map.Entry)iterator.next();
//            System.out.print("key is: "+ mentry.getKey() + " & Value is: ");
//            System.out.println(mentry.getValue());
//        }
//
//        Set<LeaguePosition> matchPositionList =  api.getLeaguePositionsBySummonerId(PLATFORM, summoner.getId());
//        // We can now iterate over the match list to access the data
//        for (LeaguePosition leaguePosition: matchPositionList
//             ) {
//            System.out.println("------");
//            System.out.println("leaguePosition.getLeaguePoints() - " + leaguePosition.getLeaguePoints());
//            System.out.println("leaguePosition.getLosses() - " + leaguePosition.getLosses());
//
//        }
//        System.out.println("matchPosition ---  " + api.getLeaguePositionsBySummonerId(PLATFORM, summoner.getId()).toString());
//    }


}
