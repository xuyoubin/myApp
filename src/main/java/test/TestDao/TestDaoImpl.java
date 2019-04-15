package test.TestDao;


import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Repository;

import java.io.IOException;

@Repository
public class TestDaoImpl implements TestDao,ApplicationContextAware {

    @Autowired
    private ApplicationContext applicationContext ;

    @Override
    public int add(int a, int b) {
        return a+b;
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
    }

    public void getResource() {
        Resource resource = applicationContext.getResource("classpath:config.txt");
        System.out.println("文件名称"+resource.getFilename());
        try {
            System.out.println("文件名称"+resource.contentLength());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
