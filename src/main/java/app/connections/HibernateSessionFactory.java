package app.connections;

import app.models.User;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

@Service
@Scope("singleton")
public class HibernateSessionFactory {
    private String host = "localhost";
    private String port = "5432";
    private String base = "crud";
    private String user = "postgres";
    private String password = "1234";
    private String url = "jdbc:postgresql://";
    private String driver = "org.postgresql.Driver";
    private String dialect = "org.hibernate.dialect.PostgreSQL94Dialect";
    private String show_sql = "true";
    private String hbm2ddl = "update";

    private SessionFactory sessionFactory;

    public HibernateSessionFactory(){
        Configuration configuration = getConfiguration();
        sessionFactory =configuration.buildSessionFactory();
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    private String getUrlConnection() {
        return url + host + port + "/" + base;
    }

    public Configuration getConfiguration() {
        Configuration configuration = new Configuration();
        configuration.setProperty("hibernate.dialect", dialect);
        configuration.setProperty("hibernate.connection.driver_class", driver);
        configuration.setProperty("hibernate.connection.url", getUrlConnection());
        configuration.setProperty("hibernate.connection.username", user);
        configuration.setProperty("hibernate.connection.password", password);
        configuration.setProperty("hibernate.show_sql", show_sql);
        configuration.setProperty("hibernate.hbm2ddl.auto", hbm2ddl);
        configuration.addAnnotatedClass(User.class);
        return configuration;
    }


}
