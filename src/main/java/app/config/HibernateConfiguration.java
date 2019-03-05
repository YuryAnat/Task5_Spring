package app.config;

import app.models.User;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.Scope;
import org.springframework.core.env.Environment;

@Configuration
@PropertySource("classpath:config.properties")
public class HibernateConfiguration {

    @Autowired
    private Environment env;

    @Bean
    @Scope("singleton")
    public SessionFactory getSessionFactory(){
        System.err.println(env.getProperty("host"));
        org.hibernate.cfg.Configuration configuration = new org.hibernate.cfg.Configuration();
        configuration.setProperty("hibernate.dialect", env.getProperty("dialect"));
        configuration.setProperty("hibernate.connection.driver_class", env.getProperty("driver"));
        configuration.setProperty("hibernate.connection.url",env.getProperty("url") + env.getProperty("host") + ":" + env.getProperty("port") + "/" + env.getProperty("base"));
        configuration.setProperty("hibernate.connection.username", env.getProperty("user"));
        configuration.setProperty("hibernate.connection.password", env.getProperty("password"));
        configuration.setProperty("hibernate.show_sql", env.getProperty("show_sql"));
        configuration.setProperty("hibernate.hbm2ddl.auto", env.getProperty("hbm2ddl"));
        configuration.addAnnotatedClass(User.class);
        return configuration.buildSessionFactory();
    }
}
