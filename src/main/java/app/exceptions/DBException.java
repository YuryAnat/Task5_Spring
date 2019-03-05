package app.exceptions;

public class DBException extends RuntimeException {
    public DBException(String massage){
        super(massage);
    }
    public DBException(String massage, Exception e){
        super(massage, e);
    }
}
