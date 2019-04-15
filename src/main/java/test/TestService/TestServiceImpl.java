package test.TestService;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import test.TestDao.TestDao;

@Service
public class TestServiceImpl implements TestService {

    @Autowired
    private TestDao testDao;

//    private TestServiceImpl(TestDao testDao){
//        this.testDao = testDao;
//    }


    //设置注入
//    @Autowired
    public void setTestDao(TestDao testDao) {
        this.testDao = testDao;
    }

    @Override
    public int add() {
        System.out.println("当前对象"+this.hashCode());
      return   testDao.add(3,5);
    }

    @Override
    public void getSource() {
        this.testDao.getResource();
    }

    public void start(){
        System.out.println("初始化");
    }
    public void clear(){
        System.out.println("销毁");
    }

//    @Override
//    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
//
//    }
}
