package test.TestDao;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.context.annotation.Scope;

@Configuration
//@ImportResource("classpath:jdbc.properties")
//@ImportResource(locations={"classpath:jdbc.properties"})
public class StropConfig {

//    @Value("${jdbc.url}")
//    private String url;
//    @Value("${jdbc.username}")
//    private String name;
//    @Value("${jdbc.password}")
//    private String pwd;

//    @Bean(name = "strop",initMethod = "init",destroyMethod = "destroy")
//    public Strop stropImpl(){
//        return new StropImpl();
//    }
        @Bean
        public MyDriverManager myDriverManager(){
            return new MyDriverManager("","","");
        }

        @Bean
        @Scope(value = "prototype")
        public Strop stropImpl(){
            return new StropImpl();
        }
}
