package driver.api;

class ApiException extends RuntimeException {
    ApiException(Exception e) {
        super(e);
    }
}
