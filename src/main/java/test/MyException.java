package test;

public class MyException extends Exception {
    private int id;

    public MyException(String msg,int id){
        super(msg);
        this.id = id;
    }

    public int getId() {
        return id;
    }
}
