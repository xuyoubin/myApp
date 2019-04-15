package test;


import org.apache.commons.lang.StringUtils;
import org.apache.poi.ss.formula.functions.T;
import org.junit.After;
import org.junit.Before;
import org.junit.BeforeClass;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class UnitTextBase {
    private   String StringXmlPath = null;
    private  ApplicationContext context = null;

    public UnitTextBase(){}

    public UnitTextBase(String StringXmlPath){
        this.StringXmlPath = StringXmlPath;
    }
    @Before
    public  void before(){
        System.out.println("测试开始begin");

        if(StringUtils.isEmpty(StringXmlPath)){
            StringXmlPath = "classpath*:spring-bean.xml";
        }
        try {
            context = new ClassPathXmlApplicationContext(StringXmlPath.split("[,\\s]+"));
//            context.start();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @After
    public void after(){
        System.out.println("测试结束after");
//        if(context != null)
//        context.destroy();
    }
    //通过路径
    public <T extends Object> T getBean(String beanid){
        return (T) context.getBean(beanid);
    }
    //通过类文件
    protected <T extends Object> T getBean(Class<T> clazz){
        return context.getBean(clazz);
    }
}
