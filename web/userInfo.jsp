<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <sec:authentication property="principal.authorities" var="authorities" />
    <sec:authentication property="principal.username" var="user" />
    <title>Information</title>
</head>
<body>
    <button onclick="location.href='/logout'">Logout</button>
    <br>
    User: <c:out value="${user}"></c:out>
    <br>
    Session id: <c:out value="${pageContext.session.id}"></c:out>
    <br>
    User role:
    <c:forEach items="${authorities}" var="authority">
        ${authority.authority}
    </c:forEach>
</body>
</html>
