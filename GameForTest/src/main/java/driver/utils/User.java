package driver.utils;

public class User {
    private String login;
    private String password;
    private String riotToken;

    public User(String name) {
        String[] data = Property.get(name).split(" {2}");
        login = data[0];
        password = data[1];
        riotToken = data[2];
    }

    public User(String login, String password) {
        this.login = login;
        this.password = password;
    }

    public User(String login, String password, String riotToken) {
        this.login = login;
        this.password = password;
        this.riotToken = riotToken;
    }

    public String getLogin() {
        return login;
    }

    public String getPassword() {
        return password;
    }

    public String getRiotToken() {
        return riotToken;
    }
}
