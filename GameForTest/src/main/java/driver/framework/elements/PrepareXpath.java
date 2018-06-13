package driver.framework.elements;

public class PrepareXpath {
    private String name;
    private String[] inserts;
    private String[] indexes;

    PrepareXpath(String fieldNameToFind) {
        name = fieldNameToFind;
        String insertStart;
        String insertEnd;
        int countOfInserts;

        insertStart = "<";
        insertEnd = ">";
        countOfInserts = name.split(insertStart).length - 1;
        inserts = new String[countOfInserts];
        for (int i = 0; i < countOfInserts; i++) {
            inserts[i] = name.substring(name.indexOf(insertStart) + 1, name.indexOf(insertEnd));
            name = name.substring(0, name.indexOf(insertStart)) + name.substring(name.indexOf(insertEnd) + 1, name.length());
        }

        insertStart = "\\[";
        insertEnd = "]";
        String [] splittingName = name.split(insertStart);
        countOfInserts = splittingName.length - 1;
        indexes = new String[countOfInserts];
        for (int i = 0; i < countOfInserts; i++) {
            indexes[i] = splittingName[2*i+1].substring(0,splittingName[2*i+1].indexOf(insertEnd));
            name = splittingName[2*i]+splittingName[2*i+1].substring(splittingName[2*i+1].indexOf(insertEnd)+1);
        }
    }

    public String getName() {
        return name;
    }

    public String[] getIndexes() {
        return indexes;
    }

    public String[] getInserts() {
        return inserts;
    }
}
