package driver.steps;

import cucumber.api.DataTable;
import cucumber.api.java.en.When;
import driver.api.steps.ApiSteps;
import driver.framework.Variables;
import driver.utils.User;

import java.util.List;

public class ApiActions {
    @When("^I save values from the RAIT API$")
    public void iSaveValuesFromTheRAITapi(DataTable dataTable) {
        List<List<String>> data = dataTable.raw();
        String user = Variables.replace(data.get(0).get(0));
        String endpoint = Variables.replace(data.get(0).get(1));
        ApiSteps api = getApiData(user, endpoint);
        String value;
        String variableName;
        for (int i = 1; i < data.size(); i++) {
            variableName = data.get(i).get(0);
            value = replaceElementsNamesOnApiValues(api, data.get(i).get(1));
            Variables.put(variableName, value);
        }
    }

    private static ApiSteps getApiData(String userName, String endpoint) {
        ApiSteps api = new ApiSteps();
        api.disablePrint();
        User user = new User(userName);
        api.saveToken(user.getRiotToken());
        api.sentEndpointWithToken("get", Variables.replace(endpoint));
        return api;
    }

    static String replaceElementsNamesOnApiValues(ApiSteps api, String text) {
        String result = text;
        while (result.contains("#{")) {
            int start = result.indexOf("#{");
            int end = result.indexOf('}');
            if (start >= 0 && end > start) {
                result = result.substring(0, start)
                        + api.getElementValueFromResponse(result.substring(start + 2, end))
                        + result.substring(end + 1);
            }
        }
        return result;
    }
}
