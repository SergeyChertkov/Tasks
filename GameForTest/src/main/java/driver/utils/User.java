package driver.utils;

public class User {
    private String login;
    private String password;

    public User(String name) {
        String[] data = Property.get(name).split(" {2}");
        login = data[0];
        password = data[1];
    }

    public String getLogin() {
        return login;
    }

    public String getPassword() {
        return password;
    }
}
