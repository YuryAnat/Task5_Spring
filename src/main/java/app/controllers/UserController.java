package app.controllers;

import app.models.Role;
import app.models.User;
import app.services.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import app.services.UserService;

import java.util.*;
import java.util.stream.Collectors;

@Controller
public class UserController {
    private final UserService userService;
    private final RoleService roleService;

    @Autowired
    public UserController(UserService userService, RoleService roleService) {
        this.userService = userService;
        this.roleService = roleService;
    }

    @GetMapping(value = {"/admin"})
    public String viewAllUsersPage(Model model) {
        model.addAttribute("users", userService.getAllUsers());
        return "listUsers";
    }

    @GetMapping(value = "/admin/delete", params = {"id"})
    public String deleteUser(@RequestParam String id, Model model) {
        userService.deleteUser(Integer.parseInt(id));
        model.addAttribute("status", "User: " + id + " deleted");
        return "redirect:/admin";
    }

    @GetMapping("/admin/add")
    public String viewAddUserForm(Model model) {
        model.addAttribute("user", new User());
        return "addUser";
    }

    @PostMapping(value = {"/admin/add"}, params = {"login", "password", "confPassword", "name", "email", "roles"})
    public String uddUser(@RequestParam("login") String login, @RequestParam("password") String password, @RequestParam("confPassword") String ConfPassword, @RequestParam("name") String name,
                          @RequestParam("email") String email, @RequestParam("roles") String[] role, Model model){
        User user = new User(login,password,name,email);
        Set<Role> roles = Arrays.stream(role).map(roleService::findRoleByName).collect(Collectors.toSet());
        user.setRoles(roles);
        if (userService.getUserByLogin(login) == null){
            userService.addNewUser(user);
            return "redirect:/admin";
        }else {
            model.addAttribute("status", "Login name is use");
            return "addUser";
        }
    }

    @GetMapping(value = "/admin/edit", params = {"id"})
    public String viewEditUserForm(@RequestParam String id, Model model) {
        User editUser = userService.getUserByID(Integer.parseInt(id));
        model.addAttribute("user", editUser);
        return "editUser";
    }

    @PostMapping(value = {"/admin/edit"},  params = {"id", "login", "password", "confPassword", "name", "email", "roles"})
    public String editUser(@RequestParam("id") String id, @RequestParam("login") String login, @RequestParam("password") String password, @RequestParam("confPassword") String ConfPassword,
                           @RequestParam("name") String name, @RequestParam("email") String email, @RequestParam("roles") String[] role, Model model){
        User editedUser = new User(Integer.parseInt(id),login,password,name,email);
        Set<Role> roles = Arrays.stream(role).map(roleService::findRoleByName).collect(Collectors.toSet());
        for (Role role1 : roles) {
            role1.addUser(editedUser);
        }
        editedUser.setRoles(roles);
        if (userService.getUserByID(Integer.parseInt(id)) != null){
            userService.updateUser(editedUser);
            model.addAttribute("status", "User edited");
            return "redirect:/admin";
        }else {
            model.addAttribute("status", "No user found by id " + id);
            model.addAttribute("user", editedUser);
            return "editUser";
        }
    }

    @GetMapping(value = {"/login"})
    public String loginPage(){
        return "login";
    }

    @GetMapping(value = "/user")
    public String userInfo(){
        return "userInfo";
    }

    @GetMapping("/")
    public String startPage(){
        return "index";
    }
}