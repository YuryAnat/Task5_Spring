<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Home page</title>
    <link rel='stylesheet' href='webjars/bootstrap/4.1.1/css/bootstrap.min.css'>
</head>
<body>
<%--<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">--%>
<%--<a class="navbar-brand text-white">Task5_Spring</a>--%>
<%--<form class="form-inline my-2 my-lg-0">--%>
<%--<button class="btn btn-secondary my-2 my-sm-0" onclick="location.href='/logout'">Logout</button>--%>
<%--</form>--%>
<%--</nav>--%>
<nav class="navbar navbar-dark bg-dark">
    <a class="navbar-brand text-white">Task5_Spring</a>
    <form class="form-inline my-2 my-lg-0">
        <%--<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">--%>
        <button class="btn btn-secondary my-2 my-sm-0" onclick="location.href='/logout'">Logout</button>
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
            <ul class="nav nav-tabs">
            <li class="active">
                <a href="#">Главная</a>
            </li>
            <li>
                <a href="#">Вопросы</a>
            </li>
            <li>
                <a href="#">Статьи</a>
            </li>
        </ul>
        </nav>
    </div>
</div>

<%--<div>--%>
    <%--<security:authorize access="!isAuthenticated()">--%>
        <%--<button onclick="location.href='/login'">Login</button>--%>
    <%--</security:authorize>--%>
    <%--<security:authorize url="/user">--%>
        <%--<button onclick="location.href='/user'">User info page</button>--%>
    <%--</security:authorize>--%>
    <%--<security:authorize url="/admin">--%>
        <%--<button onclick="location.href='/admin'">Admin page</button>--%>
    <%--</security:authorize>--%>
    <%--<security:authorize access="isAuthenticated()">--%>
        <%--<button onclick="location.href='/logout'">Logout</button>--%>
    <%--</security:authorize>--%>
<%--</div>--%>
</body>
</html>
