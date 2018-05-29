package driver.framework.elements;

import java.util.Map;

public class ElementsUtil {
    private ElementsUtil() {

    }

    public static DynamicXpath getEntryForElementName(Map<String, String> elements, String fieldNameToFind) {
        PrepareXpath prepareXpath = new PrepareXpath(fieldNameToFind);
        String xpath = elements.get(prepareXpath.getName());
        if (xpath == null) {
            throw new ElementException("Cannot find entry for fieldName: '" + fieldNameToFind + "'");
        }
        if (prepareXpath.getInserts().length > 0)
            return new DynamicXpath(String.format(xpath, (Object[]) prepareXpath.getInserts()));
        return new DynamicXpath(xpath);
    }
}
