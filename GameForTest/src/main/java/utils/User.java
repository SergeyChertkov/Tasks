package utils;



public class User {
    private String login;
    private String mail;
    private String password;

    public User(String propertyName) {
        String[] property;
        String name = propertyName;

        property = Property.get(name).split(" {2}");
        login = property[0];
        mail = property[2];
        password = property[3];

    }

    public String getLogin() {
        return login;
    }


    public String getMail() {
        return mail;
    }

    public String getPassword() {
        return password;
    }


}
