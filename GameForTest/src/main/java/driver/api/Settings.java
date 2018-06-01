package driver.api;


import driver.utils.Property;
import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("SameParameterValue")
public class Settings {
    private String url;
    private String contentType;
    private String body;
    private List<String> headers;
    private List<String> params;
    private String cookie;

    public Settings() {
        this.url = null;
        this.contentType = null;
        this.body = null;
        headers = new ArrayList<>();
        params = new ArrayList<>();
    }

    Settings(List<List<String>> data) {
        this.setUrl(getValue(data, "url"));
        this.contentType = getValue(data, "content-type");
        this.body = getValue(data, "body");
        this.headers = getElements(data, "header");
        this.params = getElements(data, "param");
    }

    private String getValue(List<List<String>> data, String name) {
        for (List<String> element :
                data) {
            if (element.get(0).equals(name))
                return element.get(1);
        }
        return null;
    }

    private List<String> getElements(List<List<String>> data, String name) {
        List<String> elements = new ArrayList<>();
        for (List<String> element :
                data) {
            if (element.get(0).equals(name))
                elements.add(element.get(1));
        }
        return elements;
    }

    public void setUrl(String url) {
        if (!url.startsWith("http")) {
            this.url = Property.get(url.substring(0, url.indexOf('/')))
                    + url.substring(url.indexOf('/'), url.length());
        } else this.url = url;
    }

    @SuppressWarnings("unused")
    public void setContentType(String contentType) {
        this.contentType = contentType;
    }

    @SuppressWarnings("unused")
    public void setBody(String body) {
        this.body = body;
    }

    public String getUrl() {
        return url;
    }

    String getContentType() {
        return contentType;
    }

    String getBody() {
        return body;
    }

    List<String> getHeaders() {
        return headers;
    }

    @SuppressWarnings("unused")
    public void addHeader(String header) {
        this.headers.add(header);
    }

    List<String> getParams() {
        return params;
    }

    public String getCookie() {
        return cookie;
    }

    @SuppressWarnings("unused")
    public void setCookie(String cookie) {
        this.cookie = cookie;
    }
}
