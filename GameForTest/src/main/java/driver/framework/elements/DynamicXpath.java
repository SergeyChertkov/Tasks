package driver.framework.elements;

public class DynamicXpath implements IHaveAnXPath {
    private String xpath;

    DynamicXpath(String xpath) {
        this.xpath = xpath;
    }

    @Override
    public String getXPath() {
        return this.xpath;
    }
}
