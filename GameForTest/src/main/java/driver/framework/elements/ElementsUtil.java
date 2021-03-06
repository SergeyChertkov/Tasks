package driver.framework.elements;

import driver.framework.Variables;

import java.util.Map;

public class ElementsUtil {
    private ElementsUtil() {

    }

    public static DynamicXpath getEntryForElementName(Map<String, String> elements, String fieldNameToFind) {
        String fieldNameToFindWithReplacedVariables = Variables.replace(fieldNameToFind);
        PrepareXpath prepareXpath = new PrepareXpath(fieldNameToFindWithReplacedVariables);
        String xpath = elements.get(prepareXpath.getName());
        if (xpath == null) {
            throw new ElementException("Cannot find entry for fieldName: '" + fieldNameToFindWithReplacedVariables + "'");
        }
        if (prepareXpath.getInserts().length > 0) {
            xpath = String.format(xpath, (Object[]) prepareXpath.getInserts());
        }
        for (int i = 0; prepareXpath.getIndexes().length > i; i++) {
            xpath = xpath.replaceFirst("\\[index]", "[index=" + prepareXpath.getIndexes()[i] + "]");
        }
        return new DynamicXpath(xpath);
    }
}
