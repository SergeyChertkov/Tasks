package driver.api;

public class ApiException extends RuntimeException {
    ApiException(Exception e) {
        super(e);
    }
}
