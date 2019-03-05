package app.services;

import app.models.User;

import java.util.List;

public interface UserService {
    void addNewUser(User user);
    void updateUser(User user);
    void deleteUser(int id);
    List<User> getAllUsers();
    User getUserByID(int id);
    User getUserByLogin(String login);
}
