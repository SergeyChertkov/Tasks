package utils;

class UtilException extends RuntimeException {
    UtilException(String message) {
        super(message);
    }

    UtilException(Exception e) {
        super(e);
    }
}
