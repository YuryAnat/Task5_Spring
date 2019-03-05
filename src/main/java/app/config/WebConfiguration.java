package app.config;

import app.models.User;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.*;
import org.springframework.core.env.Environment;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
@EnableWebMvc
@ComponentScan("app")
@PropertySource("classpath:config.properties")
public class WebConfiguration extends WebMvcConfigurerAdapter {
    @Autowired
    private Environment env;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/**")
                .addResourceLocations("/");
    }

    @Bean
    public InternalResourceViewResolver setupViewResolver(){
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/");
        resolver.setSuffix(".jsp");
        resolver.setViewClass(JstlView.class);
        return resolver;
    }

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
