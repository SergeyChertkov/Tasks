package driver.driver;

class DriverException extends RuntimeException {
    DriverException(String message) {
        super(message);
    }

    DriverException(Exception exception) {
        super(exception);
    }
}
