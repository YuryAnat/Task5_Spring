package app.services;

import app.exceptions.DBException;
import app.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.stream.Collectors;

@Service
public class UserDetailServiceImpl implements UserDetailsService {
    private final UserService service;

    @Autowired
    public UserDetailServiceImpl(UserService service) {
        this.service = service;
    }

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        User findUser = service.getUserByLogin(s);
        if (findUser != null){
            return new org.springframework.security.core.userdetails.User(s,findUser.getPassword(),findUser.getRoles().stream()
                    .map(role -> new SimpleGrantedAuthority(role.getRole())).collect(Collectors.toSet()));
        }else {
            throw new DBException("User not found");
        }
    }
}
