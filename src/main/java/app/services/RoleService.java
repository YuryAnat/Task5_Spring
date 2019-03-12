package app.services;

import app.models.Role;

public interface RoleService {
    Role findRoleByName(String role);
}
