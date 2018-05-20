import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        tags = {"@smoke", "~@disabled"},
        format = {"pretty", "html:target/cucumber", "json:target/cucumber-report.json"},
        features = {"src/test/features"},
        glue = {"web.steps"}
)
public class WebPageRunner {
}
