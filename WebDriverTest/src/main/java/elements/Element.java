package elements;

/**
 * Created by Sergii_Chertkov on 11/10/2016.
 */
public enum Element implements IHaveAnXPath {

    PAGE_TITLE("page title","//title"),
    TELEFONY_TV_I_ELECTRONIKA_LINK("telefony tv i elektronika link","//a[contains(@href,'telefony-tv-i-ehlektronika')]"),
    TELEFONY_LINK("telefony link", "//*[@class='pab-h3']//a[contains(@href,'telefony')]"),
    SMARTFONY_LINK("smartfony link","//*[@class='pab-h3']//a[contains(@href,'smartfon')]"),

    PRODUCT_NAME("product name", "//div[@class='g-i-tile-i-box-desc'][.//*[@class='g-tag g-tag-icon-middle-popularity sprite']]//*[@class='g-i-tile-i-title clearfix']/a"),
    PRODUCT_PRICE("product price", "//div[@class='g-i-tile-i-box-desc'][.//*[@class='g-tag g-tag-icon-middle-popularity sprite']]//*[@class='g-price g-price-cheaper' or @class='g-price']"),

    PRODUCT_PAGINATION_1("page 1","//*[@id='page1']"),
    PRODUCT_PAGINATION_2("page 2","//*[@id='page2']"),
    PRODUCT_PAGINATION_3("page 3","//*[@id='page3']")
    ;

    private final String name;
    private final String xpath;

    private Element(String name, String xpath) {
        this.name = name;
        this.xpath = xpath;
    }

    public String getXPath() {
        return xpath;
    }

    public static Element getEntryForElementName(String fieldNameToFind) {
        for (Element element : values()) {
            if (element.name.equals(fieldNameToFind)) {
                return element;
            }
        }
        throw new RuntimeException("Cannot find entry for fieldName: '" + fieldNameToFind + "'");
    }
}
