package test.TestDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public class BeanInvoker {

    @Autowired
    private List<BeanInterface> list;

    @Autowired
    private Map<String,BeanInterface> map;

    @Autowired
    @Qualifier(value = "beanInterfaceImpl2")
    private BeanInterface beanInterface;

    public void Say(){
        System.out.println("list^^^^^");
        if(list != null){
            for(BeanInterface b:list){
                System.out.println(b.getClass().getName());
            }
        }else{
            System.out.println("list is null");
        }

        System.out.println("map^^^^^^^^^^^^^");
        if(map !=null && map.size()>0){
            for(Map.Entry<String,BeanInterface> entity:map.entrySet()){
                System.out.println(entity.getKey()+":"+entity.getValue().getClass().getName());
            }
        }

        System.out.println("^^^^^^^^^^^^^");
        if(null != beanInterface){
            System.out.println(beanInterface.getClass().getName());
        }else{
            System.out.println("beanInterface is null");
        }


    }
}
