<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Home page</title>
    <security:authentication property="principal.authorities" var="authorities" />
    <security:authentication property="principal.username" var="user" />
    <link rel='stylesheet' href='webjars/bootstrap/4.3.1/css/bootstrap.min.css'>
</head>
<body>
<nav class="navbar navbar-dark bg-dark">
    <a class="navbar-brand text-white">Task5_Spring</a>
    <form class="form-inline my-2 my-lg-0">
        <a href="<c:url value="/logout" />">Logout</a>
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
        <nav>
            <br>
            User: <c:out value="${user}"></c:out>
            <br>
            Session id: <c:out value="${pageContext.session.id}"></c:out>
            <br>
            User role:
            <c:forEach items="${authorities}" var="authority">
                ${authority.authority}
            </c:forEach>
        </nav>
    </div>
</div>
<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>