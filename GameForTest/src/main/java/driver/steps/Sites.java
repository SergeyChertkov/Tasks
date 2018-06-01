package driver.steps;

import driver.framework.AbstractSite;
import lol.LOLSite;

public class Sites {
    private Sites() {
    }

    static LOLSite lolSite = new LOLSite(null);

    public static AbstractSite getCurrentSite(){
        return lolSite;
    }
}
