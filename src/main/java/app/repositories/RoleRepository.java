package app.repositories;

import app.models.Role;

public interface RoleRepository {
    Role findRoleByName(String role);
}
