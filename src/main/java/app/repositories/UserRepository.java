package app.repositories;

import app.models.User;

import java.util.List;

public interface UserRepository {
    boolean addUser(User user);
    boolean updateUser(User user);
    boolean deleteUser(int id);
    User getUserById(int id);
    User getUserByName(String name);
    List<User> getAllUsers();
}
