package driverFramework;

public class PrepareXpath {
    private String name;
    private String[] inserts;

    public PrepareXpath(String fieldNameToFind) {
        name = fieldNameToFind;
        String insertStart = "<";
        String insertEnd = ">";
        int countOfInserts = name.split(insertStart).length - 1;
        inserts = new String[countOfInserts];
        for (int i = 0; i < countOfInserts; i++) {
            inserts[i] = name.substring(name.indexOf(insertStart) + 1, name.indexOf(insertEnd));
            name = name.substring(0, name.indexOf(insertStart)) + name.substring(name.indexOf(insertEnd) + 1, name.length());
        }    }

    public String getName() {
        return name;
    }

    public String[] getInserts() {
        return inserts;
    }
}
