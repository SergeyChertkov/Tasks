package driverFramework;

public class DynamicXpath implements IHaveAnXPath {
    private String xpath;

    public DynamicXpath(String xpath) {
        this.xpath = xpath;
    }

    @Override
    public String getXPath() {
        return this.xpath;
    }

}
