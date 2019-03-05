package app.exceptions;

public class ReadPropertyException extends RuntimeException {
    public ReadPropertyException(String message){
        super(message);
    }
    public ReadPropertyException(String message, Throwable e){
        super(message, e);
    }
}
