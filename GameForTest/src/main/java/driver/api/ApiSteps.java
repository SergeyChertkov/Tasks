package driver.api;


import com.jayway.restassured.response.Response;
import cucumber.api.DataTable;
import cucumber.api.Scenario;
import cucumber.api.java.Before;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import driver.utils.FileUtil;
import org.apache.log4j.Logger;
import org.assertj.core.api.SoftAssertions;

import java.text.SimpleDateFormat;
import java.util.*;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

@SuppressWarnings("unused")
public class ApiSteps {
    private static final Logger log = Logger.getLogger(ApiSteps.class);
    private static final String GET = "get";
    private static final String POST = "post";
    private static final String PUT = "put";
    private static final String DELETE = "delete";
    public static final String APPLICATION_JSON = "application/json";
    private static final String PRESENT = "present";
    private static final String NOT_PRESENT = "not present";
    public static final String AUTHORIZATION_BEARER = "Authorization:bearer ";


    private boolean printEnabled = true;
    private Response response;
    private Map<String, Response> responses = new HashMap<>();
    private Scenario scenario;

    @Before
    public void before(Scenario scenario) {
        this.scenario = scenario;
    }

    @When("^I sent ([^\"]*) request$")
    public void sentRequest(String method, DataTable dataTable) {
        Settings settings = new Settings(dataTable.raw());
        print("request: " + settings.getUrl());
        sentRequest(method, settings);
    }

    @When("^save response as file \"([^\"]*)\"$")
    public void saveResponseAsFile(String fileName) {
        FileUtil.createFile(fileName);
        FileUtil.saveInputStreamToFile(fileName, response.asInputStream());
    }

    @When("^save response as file \"([^\"]*)\" + time$")
    public void saveResponseAsFilePlusTime(String fileName) {
        SimpleDateFormat format = new SimpleDateFormat("_yyyy.MM.dd_HH:mm:ss");
        FileUtil.createFile(fileName + format.format(new Date()));
        FileUtil.saveInputStreamToFile(fileName, response.asInputStream());
    }

    @Then("^save response as \"([^\"]*)\"$")
    public void saveResponseAs(String name) {
        responses.put(name, response);
    }

    @SuppressWarnings("WeakerAccess")
    @Then("^response should have following elements$")
    public void responseShouldHaveFollowingElements(DataTable dataTable) {
        List<List<String>> data = dataTable.raw();
        JsonParser resp = new JsonParser(response.asString());
        for (List<String> param :
                data) {
            String actual = resp.getValueByPath(param.get(0));
            String expected = param.get(1);
            if (actual == null)
                actual = NOT_PRESENT;
            else if (PRESENT.equals(expected) || NOT_PRESENT.equals(expected))
                actual = PRESENT;
            assertEquals("please check the element " + param.get(0), expected, actual);
        }
    }

    @Then("^\"([^\"]*)\" response should have following elements$")
    public void responseShouldHaveFollowingElements(String responceName, DataTable dataTable) {
        response = responses.get(responceName);
        responseShouldHaveFollowingElements(dataTable);
    }

    @Then("^response should NOT have following elements$")
    public void responseShouldNOTHaveFollowingElements(List<String> list) {
        SoftAssertions softAssertions = new SoftAssertions();
        String responseString = response.asString();
        list.forEach(item -> softAssertions.assertThat(responseString)
                .as("Actual response %s contains", responseString).doesNotContain(list));
        softAssertions.assertAll();
    }

    @Then("^responses should have following elements$")
    public void responsesShouldHaveFollowingElements(DataTable dataTable) {
        List<List<String>> data = dataTable.raw();
        String urlName;
        JsonParser resp;
        for (List<String> row :
                data) {
            urlName = row.get(0);
            resp = new JsonParser(responses.get(urlName).asString());
            for (int i = 1; i < row.size(); i += 2) {
                String actual = resp.getValueByPath(row.get(i));
                String expected = row.get(i + 1);
                if (actual == null)
                    actual = NOT_PRESENT;
                else if (expected.equals(PRESENT) || expected.equals(NOT_PRESENT))
                    actual = PRESENT;
                assertEquals("please check the element " + row.get(i), expected, actual);
            }
        }

    }

    @Then("^responses should not have duplicated elements \"([^\"]*)\"$")
    public void responsesShouldNotHaveDuplicatedElements(String elementName, DataTable dataTable) {
        List<List<String>> data = dataTable.raw();
        List<String> elements = new ArrayList<>();
        JsonParser resp;

        for (String urlName :
                data.get(0)) {
            resp = new JsonParser(responses.get(urlName).asString());
            elements.addAll(resp.getValuesByName(elementName));
        }
        Set<String> set = new HashSet<>(elements);
        assertTrue("responses have a duplicated elements", set.size() == elements.size());
    }

    @Then("^response should have status \"([^\"]*)\"$")
    public void responseShouldHaveStatus(String status) {
        response.then().statusCode(Integer.parseInt(status));
    }

    public void sentRequest(String method, Settings settings) {
        switch (method) {
            case GET:
                response = Utils.requestSpecification(settings).get(settings.getUrl());
                break;
            case POST:
                response = Utils.requestSpecification(settings).post(settings.getUrl());
                break;
            case PUT:
                response = Utils.requestSpecification(settings).put(settings.getUrl());
                break;
            case DELETE:
                response = Utils.requestSpecification(settings).delete(settings.getUrl());
                break;
            default:
                response = null;
        }
        if (response != null) {
            print("response: " + response.asString());
        } else {
            print("response is null");
        }
    }

    private void print(String message) {
        if (printEnabled) {
            log.info(message);
            scenario.write(message);
        }
    }

    public void enablePrint() {
        printEnabled = true;
    }

    public void disablePrint() {
        printEnabled = false;
    }

    public String getElementValueFromResponse(String path) {
        JsonParser resp = new JsonParser(response.asString());
        return resp.getValueByPath(path);
    }

}
