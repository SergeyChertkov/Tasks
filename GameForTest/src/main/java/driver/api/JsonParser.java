package driver.api;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.collect.Lists;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;

/**
 * element1.element2.element3 - return "value"
 * this is example how to get value from element
 *  {
 *      "element1":{
 *          "element2":{
 *              "element3":"value"
 *          }
 *      }
 *  }
 *
 * element1.[element2=value1].element3 - return "value4"
 * this is example to get value from element when json have a few the same elements
 *  {
 *      "element1":{
 *          "element2":"value1",
 *          "element3":"value2"
 *      },
 *      "element1":{
 *          "element2":"value3",
 *          "element3":"value4"
 *      }
 *  }
 *
 * element.[2].child - return "value6"
 * this is example to get value from element when json have an array of elements
 *  {
 *      "element":[
 *      {
 *          "element":"value1",
 *          "child":"value2"
 *      },
 *      {
 *          "element":"value3",
 *          "child":"value4"
 *      }
 *      {
 *          "element":"value5",
 *          "child":"value6"
 *      }
 *      ]
 *  }
 *
 * child_count() - return count of child elements
 */
public class JsonParser {
    private JsonNode json;

    private final String name;
    private JsonParser parent;
    private List<JsonParser> childs;
    private static ObjectMapper mapper = new ObjectMapper();


    JsonParser(String str) {
        name = "body";
        try {
            json = mapper.readTree(str);
            getChilds();
        } catch (IOException e) {
            throw new ApiException(e);
        }
    }

    private JsonParser(JsonParser parent, String name, JsonNode json) {
        this.parent = parent;
        this.name = name;
        this.json = json;
        getChilds();
    }

    @SuppressWarnings("unused")
    boolean isElementPresent(String name) {
        return !json.findValues(name).isEmpty();
    }

    private boolean hasChilds() {
        return childs != null && !childs.isEmpty();
    }

    private List<JsonParser> getChilds() {
        if (childs == null) {
            List<JsonParser> result = new ArrayList<>(json.size());
            Iterator<JsonNode> items = json.elements();
            Iterator<String> fieldNames = json.fieldNames();
            int i = 0;
            while (items.hasNext()) {
                String fieldName = "[" + i++ + "]";
                if (fieldNames.hasNext()) {
                    fieldName = fieldNames.next();
                }
                result.add(new JsonParser(this, fieldName, items.next()));
            }
            childs = result;
            return result;
        }
        return childs;
    }

    @SuppressWarnings("unused")
    public JsonParser getChild(int index) {
        return getChilds().get(index);
    }

    private JsonParser getChild(String name) {
        if (name.contains("=")) {
            String attribute = name.substring(1).split("=")[0];
            String value = name.split("=")[1];
            value = value.substring(0, value.length() - 1);
            List<JsonParser> result = getChilds();
            for (JsonParser res :
                    result) {
                JsonParser child = res.getChild(attribute);
                //noinspection ConstantConditions
                if (child != null && res.getChild(attribute).getValue().equals(value)) {
                    return res;
                }
            }
            return null;
        } else {
            JsonParser result = getChilds().stream().filter(c -> name.equals(c.getName())).findFirst().orElse(null);
            if (result == null && !getChilds().isEmpty()) {
                result = getChilds().get(0).getChild(name);
            }
            return result;
        }
    }

    private List<JsonParser> getChilds(String name) {
        List<JsonParser> result = Lists.newArrayList();
        for (JsonParser child :
                getChilds()) {
            if (child.getName().equals(name))
                result.add(child);
        }
        for (JsonParser child :
                getChilds()) {
            result.addAll(child.getChilds(name));
        }
        return result;
    }

    @SuppressWarnings("unused")
    public JsonParser getElementWithChild(String name, String value) {
        return Objects.requireNonNull(
                getChilds(name).stream()
                        .filter(p -> Objects.equals(p.getValue(), value))
                        .findFirst().orElse(null))
                .getParent();
    }

    private JsonParser getParent() {
        return parent;
    }

    public String getName() {
        return name;
    }

    private String getValue() {
        if (!hasChilds())
            return json.asText();
        return "";
    }

    public String getValueByPath(String path) {
        String[] parts = path.split("\\.");
        JsonParser result = this;
        for (String part : parts) {
            if ("child_count()".equals(part)) {
                return result.childCount();
            } else {
                result = result.getChild(part);
                if (result == null)
                    return null;
            }
        }
        if ("".equals(result.getValue())) {
            if (result.getChilds().isEmpty()) {
                return "empty";
            } else {
                return "array";
            }
        }
        return result.getValue();
    }

    private String childCount() {
        return String.valueOf(getChilds().size());
    }

    public List<String> getValuesByName(String name) {
        List<String> result = Lists.newArrayList();
        json.findValues(name).forEach(p -> result.add(p.asText()));
        return result;
    }

    @SuppressWarnings("unused")
    public JsonNode getJsonNode() {
        return json;
    }

    @SuppressWarnings("unused")
    private JsonParser getFirst() {
        if (isFirst())
            return this;
        return getParent().getFirst();
    }

    private boolean isFirst() {
        return parent == null;
    }

}
