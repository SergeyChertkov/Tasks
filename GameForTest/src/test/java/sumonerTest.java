
import net.rithms.riot.api.endpoints.match.dto.MatchList;
import net.rithms.riot.api.endpoints.match.dto.MatchReference;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import net.rithms.riot.api.ApiConfig;
import net.rithms.riot.api.RiotApi;
import net.rithms.riot.api.RiotApiException;
import net.rithms.riot.api.endpoints.summoner.dto.Summoner;
import net.rithms.riot.constant.Platform;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;


public class sumonerTest {

    String PERSONAL_KEY = "RGAPI-7d903f2e-a342-470b-9887-6f3ae1372ddb";
    String SUMMONER_NAME = "geei";

    public sumonerTest() {
    }

    @Before
    public void precondition() {

    }

    @After
    public void postcondition() {

    }

    @Test
    public void firstTest()  throws RiotApiException {
        ApiConfig config = new ApiConfig().setKey(PERSONAL_KEY);
        RiotApi api = new RiotApi(config);

        Summoner summoner = api.getSummonerByName(Platform.NA, SUMMONER_NAME);
        System.out.println("Name: " + summoner.getName());
        System.out.println("Summoner ID: " + summoner.getId());
        System.out.println("Account ID: " + summoner.getAccountId());
        System.out.println("Summoner Level: " + summoner.getSummonerLevel());
        System.out.println("Profile Icon ID: " + summoner.getProfileIconId());
    }

    @Test
    public void secondTest()  throws RiotApiException {
        ApiConfig config = new ApiConfig().setKey(PERSONAL_KEY);
        RiotApi api = new RiotApi(config);

        // First we need to request the summoner because we will need it's account ID
        Summoner summoner = api.getSummonerByName(Platform.NA, SUMMONER_NAME);

        // Then we can use the account ID to request the summoner's match list
        MatchList matchList = api.getMatchListByAccountId(Platform.NA, summoner.getAccountId());

        System.out.println("Total Games in requested match list: " + matchList.getTotalGames());

        Map<Integer,Integer> counterOfQueue = new HashMap<>();

        // We can now iterate over the match list to access the data
        if (matchList.getMatches() != null) {
            for (MatchReference match : matchList.getMatches()) {
                System.out.println(" GameID:" + match.getQueue()
                        //+" Role: " + match.getRole()
                        );
                if ( counterOfQueue.containsKey(match.getQueue()) ) {
                    int currentValue = counterOfQueue.get(match.getQueue());
                    counterOfQueue.replace(match.getQueue(), ++currentValue);
                }else {
                    counterOfQueue.put(match.getQueue(), 1);
                }

            }
        }

        // Display content using Iterator*/
        Set set = counterOfQueue.entrySet();
        Iterator iterator = set.iterator();
        while(iterator.hasNext()) {
            Map.Entry mentry = (Map.Entry)iterator.next();
            System.out.print("key is: "+ mentry.getKey() + " & Value is: ");
            System.out.println(mentry.getValue());
        }
    }


}
