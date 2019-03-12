package app.repositories;

import app.exceptions.DBException;
import app.models.Role;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.NoResultException;

@Repository
public class RoleRepositoryImpl implements RoleRepository {

    private final SessionFactory sessionFactory;
    @Autowired
    public RoleRepositoryImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public Role findRoleByName(String roleName) {
        Session session = sessionFactory.openSession();
        Role role = null;
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            role = session.createQuery("from Role where role = :role",Role.class).setParameter("role", roleName).getSingleResult();
            transaction.commit();
        }catch (NoResultException e){
            if (transaction != null){
                role = new Role(roleName);
                session.save(role);
                transaction.commit();
            }else {
                throw e;
            }
        }catch (Exception e){
            if (transaction != null) transaction.rollback();
            throw new DBException("Error found role " + roleName, e);
        }finally {
            session.close();
        }
        return role;
    }
}
