package app.controllers;

import app.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import app.services.UserService;

@Controller
public class UserController {
    private final UserService service;

    @Autowired
    public UserController(UserService service) {
        this.service = service;
    }

    @GetMapping(value = {"/admin", ""})
    public String viewAllUsersPage(Model model) {
        model.addAttribute("users", service.getAllUsers());
        return "listUsers";
    }

    @GetMapping(value = "/admin/delete", params = {"id"})
    public String deleteUser(@RequestParam String id, Model model) {
        service.deleteUser(Integer.parseInt(id));
        model.addAttribute("status", "User: " + id + " deleted");
        return "redirect:/admin";
    }

    @GetMapping("/admin/add")
    public String viewAddUserForm(Model model) {
        model.addAttribute("user", new User());
        return "addUser";
    }

    @PostMapping(value = {"/admin/add"}, params = {"login", "password", "name", "email", "role"})
    public String uddUser(@RequestParam("login") String login, @RequestParam("password") String password, @RequestParam("name") String name,
                          @RequestParam("email") String email, @RequestParam("role") String role, Model model){
        User user = new User(login,password,name,email,role);
        if (service.getUserByLogin(login) == null){
            service.addNewUser(user);
            return "redirect:/admin";
        }else {
            model.addAttribute("status", "Login name is use");
            return "addUser";
        }
    }

    @GetMapping(value = "/admin/edit", params = {"id"})
    public String viewEditUserForm(@RequestParam String id, Model model) {
        User editUser = service.getUserByID(Integer.parseInt(id));
        model.addAttribute("user", editUser);
        return "editUser";
    }

    @PostMapping(value = {"/admin/edit"},  params = {"id", "login", "password", "name", "email", "role"})
    public String editUser(@RequestParam("id") String id, @RequestParam("login") String login, @RequestParam("password") String password, @RequestParam("name") String name,
        @RequestParam("email") String email, @RequestParam("role") String role, Model model){
        User editUser = service.getUserByID(Integer.parseInt(id));
        User editedUser = new User(Integer.parseInt(id),login,password,name,email,role);
        if (editUser != null && service.getUserByLogin(login) == null){
            service.updateUser(editedUser);
            model.addAttribute("status", "User edited");
            return "redirect:/admin";
        }else {
            model.addAttribute("status", "Login name is used");
            model.addAttribute("user", editedUser);
            return "editUser";
        }
    }
}
