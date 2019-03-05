package app.repositories;

import app.connections.HibernateSessionFactory;
import app.exceptions.DBException;
import app.models.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class UserRepositoryImpl implements UserRepository {

    private final SessionFactory sessionFactory;

    @Autowired
    public UserRepositoryImpl(HibernateSessionFactory hibernateSessionFactory) {
        this.sessionFactory = hibernateSessionFactory.getSessionFactory();
    }


    @Override
    public boolean addUser(User user) {
        Session session = sessionFactory.openSession();
        int result = (Integer) session.save(user);
        session.close();
        return result > 0;
    }

    @Override
    public boolean updateUser(User user) {
        Session session = sessionFactory.openSession();
        Transaction transaction = null;
        int result;
        try {
            transaction = session.beginTransaction();
            result = session.createQuery("update User set login = :login , password = :password, name = :name," +
                    " email = :email , role = :role where id = :id")
                    .setParameter("login", user.getLogin())
                    .setParameter("password", user.getPassword())
                    .setParameter("name", user.getName())
                    .setParameter("email", user.getEmail())
                    .setParameter("role", user.getRole())
                    .setParameter("id", user.getId())
                    .executeUpdate();
            session.getTransaction().commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            throw new DBException("Don't update user: " + user.getLogin(), e);
        } finally {
            session.close();
        }
        return result > 0;
    }

    @Override
    public boolean deleteUser(int id) {
        Session session = sessionFactory.openSession();
        Transaction transaction = null;
        int result;
        try {
            transaction = session.beginTransaction();
            result = session.createQuery("delete User where id = :id").setParameter("id", id).executeUpdate();
            session.getTransaction().commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            throw new DBException("Don't delete user by id: " + id, e);
        } finally {
            session.close();
        }
        return result > 0;
    }

    @Override
    public User getUserById(int id) {
        Session session = sessionFactory.openSession();
        Transaction transaction = null;
        User user;
        try {
            transaction = session.beginTransaction();
            user = session.createQuery("from User where id = :id", User.class).setParameter("id", id).uniqueResult();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            throw new DBException("User not found by id: " + id, e);
        } finally {
            session.close();
        }
        return user;
    }

    @Override
    public User getUserByName(String login) {
        Session session = sessionFactory.openSession();
        Transaction transaction = null;
        User user;
        try {
            transaction = session.beginTransaction();
            user = session.createQuery("from User where login = :login", User.class).setParameter("login", login).uniqueResult();
            transaction.commit();
        }catch (Exception e){
            if (transaction != null) transaction.rollback();
            throw new DBException("User not found by login: " + login, e);
        }finally {
            session.close();
        }
        return user;
    }

    @Override
    public List<User> getAllUsers() {
        Session session = sessionFactory.openSession();
        Transaction transaction = null;
        List<User> list = null;
        try {
            transaction = session.beginTransaction();
            list = session.createQuery("from User", User.class).list();
            transaction.commit();
        }catch (Exception e){
            if (transaction != null)transaction.rollback();
            throw new DBException("No users found.. check connection", e);
        }finally {
            session.close();
        }
        return list;
    }
}
