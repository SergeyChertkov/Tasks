package driver.api;

import com.jayway.restassured.specification.RequestSpecification;

import java.util.List;

import static com.jayway.restassured.RestAssured.given;

public class Utils {

    private Utils() {
    }

    public static RequestSpecification requestSpecification(String contentType, List<String> headers, String body, List<String> params) {
        RequestSpecification request = given();
        if (contentType != null && contentType.length() > 0)
            request = request.contentType(contentType);
        for (String header :
                headers) {
            header = header.replaceAll("\"", "");
            String name = header.split(":")[0];
            String value = header.split(":")[1];
            request = request.header(name, value);
        }
        for (String param :
                params) {
            param = param.replaceAll("\"", "");
            String name = param.split(":")[0];
            String value = param.split(":")[1];
            request = request.param(name, value);
        }
        if (body != null && body.length() > 0)
            request = request.body(body);

        return request;
    }

    public static RequestSpecification requestSpecification(String contentType, List<String> headers, String body, List<String> params, String cookie) {
        RequestSpecification request = requestSpecification(contentType, headers, body, params);
        if (cookie != null && cookie.length() > 0) {
            request = request.cookie(cookie);
        }
        return request;
    }

    public static RequestSpecification requestSpecification(Settings settings) {
        return requestSpecification(settings.getContentType(), settings.getHeaders(), settings.getBody(), settings.getParams(), settings.getCookie());
    }

    public static String removeAllTags(String text) {
        String result = text;
        result = result.replaceAll("\r", "");
        result = result.replaceAll("<br/>", "\n");
        result = result.replaceAll("<br />", "\n");
        while (result.contains("<")) {
            result = result.substring(0, result.indexOf('<')) + result.substring(result.indexOf('>') + 1);
        }
        return result;
    }

    public static String removeFirstAndLastSpaces(String text) {
        String result = text;
        result = result.replaceAll(Character.toString((char) 13), "");
        result = result.replaceAll(Character.toString((char) 160), " ");
        while (result.contains("  ")) {
            result = result.replaceAll(" {2}", " ");
        }
        while (result.startsWith(" ")) {
            result = result.substring(1);
        }
        while (result.endsWith(" ")) {
            result = result.substring(0, result.length() - 1);
        }
        while (result.contains("\n\n")) {
            result = result.replaceAll("\n\n", "\n");
        }
        while (result.startsWith("\n")) {
            result = result.substring(1);
        }
        while (result.endsWith("\n")) {
            result = result.substring(0, result.length() - 1);
        }
        return result;
    }
}
