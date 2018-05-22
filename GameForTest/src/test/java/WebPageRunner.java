import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        tags = {"@active",  "~@smoke", "~@disabled"},
        format = {"pretty", "html:target/cucumber", "json:target/cucumber-report.json"},
        features = {"src/test/features"},
        glue = "driver/steps"
)
public class WebPageRunner {
}
