package test;

public class TestMyException {

    public void test(int num) throws MyException{

        if(num <0){//手动抛出异常
            throw new MyException("自定义异常",num);
        }


    }

    public void manget(){
        try {
            test(-1);
        } catch (MyException e) {
            e.printStackTrace();
            e.getId();
        }
    }

    public static void main(String[] args){
        TestMyException exception = new TestMyException();
        exception.manget();
    }
}
