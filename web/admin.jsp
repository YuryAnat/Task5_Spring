<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Home page</title>
    <link rel='stylesheet' href='webjars/bootstrap/4.3.1/css/bootstrap.min.css'>
    <script src="http://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="resource/js/editModal.js"></script>
    <%--<script src="webjars/bootstrap/4.3.1/js/bootstrap.js"></script>--%>
    <%--<script src="webjars/jquery/3.3.1/jquery.js"></script>--%>
    <%--<script src="webjars/popper.js/1.14.1/popper.js"></script>--%>
</head>
<body>
<nav class="navbar navbar-dark bg-dark">
    <a class="navbar-brand text-white">Task5_Spring</a>
    <form class="form-inline my-2 my-lg-0">
        <a style="color: white" href="<c:url value="/logout" />">Logout</a>
    </form>
</nav>
<br>
<div class="container-fluid">
    <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
            <div class="sidebar-sticky">
                <ul class="nav flex-column">
                    <security:authorize url="/admin">
                        <li class="nav-item">
                            <a class="nav-link active" href="/admin">
                                <span data-feather="home"></span>
                                Admin <span class="sr-only">(current)</span>
                            </a>
                        </li>
                    </security:authorize>
                    <security:authorize url="/user">
                        <li class="nav-item">
                            <a class="nav-link active" href="/user">
                                <span data-feather="home"></span>
                                User <span class="sr-only">(current)</span>
                            </a>
                        </li>
                    </security:authorize>
                </ul>
            </div>
        </nav>

        <nav class="col">
            <ul class="nav nav-tabs" id="tabs" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="listUser" data-toggle="tab" href="#list" role="tab"
                       aria-controls="list" aria-selected="true">List users</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="addUser" data-toggle="tab" href="#add" role="tab" aria-controls="list"
                       aria-selected="false">Add user</a>
                </li>
            </ul>
            <div class="tab-content" id="tabContent">
                <div class="tab-pane fade show active" id="list" role="tabpanel" aria-labelledby="listUsers">
                    <table class="table table-striped">
                        <tr>
                            <th class="col-*">Id</th>
                            <th class="col-*">Login</th>
                            <th class="col-*">Name</th>
                            <th class="col-*">Email</th>
                            <th class="col-*">Roles</th>
                            <th class="col-*">Edit</th>
                            <th class="col-*">Delete</th>
                        </tr>
                        <c:forEach items="${users}" var="user">
                            <tr>
                                <td>${user.id}</td>
                                <td>${user.login}</td>
                                <td>${user.name}</td>
                                <td>${user.email}</td>

                                <td>
                                    <c:forEach items="${user.roles}" var="role">
                                        ${role.role}
                                    </c:forEach>
                                </td>
                                <td>
                                    <button class="btn-info btn btn-sm" type="button" data-toggle="modal"
                                            data-target="#editUser"
                                            data-id="${user.id}"
                                            data-login="${user.login}"
                                            data-name="${user.name}"
                                            data-email="${user.email}">Edit
                                    </button>
                                </td>
                                <td>
                                    <button class="btn-danger btn btn-sm"
                                            onclick="location.href='/admin/delete?id=${user.id}'">Delete
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <%--Add user--%>
                <div class="tab-pane fade" id="add" role="tabpanel" aria-labelledby="addUser">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col bg-light">
                                <h5>Add new user</h5>
                            </div>
                        </div>
                        <div class="row justify-content-center">
                            <div class="col-6">
                                <form method="post" action="/admin/add" class="form-group">
                                    <label>Login name</label>
                                    <input class="form-control" name="login" value="" type="text">
                                    <label>Password</label>
                                    <input class="form-control" name="password" value="" type="password">
                                    <label>Confirm password</label>
                                    <input class="form-control" name="confPassword" value="" type="password">
                                    <label>Nick name</label>
                                    <input class="form-control" name="name" value="" type="text">
                                    <label>eMail</label>
                                    <input class="form-control" name="email" value="" type="email">
                                    <label>Role</label>
                                    <input id="roleUser" type="checkbox" name="roles" value="USER" checked>USER
                                    <input id="roleAdmin" type="checkbox" name="roles" value="ADMIN">ADMIN<br>
                                    <div class="row justify-content-center">
                                        <div class="col-5">
                                            <button class="btn btn-success" type="submit" name="add">Add new user
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <%--Edit user modal--%>
                <div class="modal fade" id="editUser" tabindex="-1" role="dialog" aria-labelledby="editUser"
                     aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <form class="form-group" action="/admin/edit" method="post">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5>Edit user</h5>
                                </div>
                                <div class="modal-body">
                                    <div class="align-items-center align-content-center">
                                        <label class="form-text">Id</label>
                                    </div>
                                    <input id="id" name="id" value="" type="text"
                                           class="disabled form-control bg-light">
                                    <label class="form-text">Login name</label>
                                    <input id="login" name="login" value="" type="text" class="form-control">
                                    <label class="form-text">Password</label>
                                    <input name="password" value="" type="password" class="form-control">
                                    <label class="form-text">Confirm password</label>
                                    <input name="confPassword" value="" type="password" class="form-control">
                                    <label class="form-text">Nick name</label>
                                    <input id="name" name="name" value="" type="text" class="form-control">
                                    <label class="form-text">eMail</label>
                                    <input id="email" name="email" value="" type="email" class="form-control">
                                    <label class="form-text">Role</label>
                                    <div class="form-inline">
                                        <input type="checkbox" name="roles" value="USER" checked>USER
                                        <input type="checkbox" name="roles" value="ADMIN">ADMIN<br>
                                    </div>

                                    <br>
                                </div>
                                <div class="modal-footer">
                                    <button class="btn btn-success" type="submit" name="edit">Edit user</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </nav>
    </div>
</div>
</body>
</html>