<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
    <title>List users</title>
</head>
<body>
<div>
    <button onclick="location.href='/admin/add'">Add user</button>
</div>

<div>
    <c:if test="${not empty status}">
        <c:out value="${status}"/>
        <br>
    </c:if>
</div>
<div>
    <table>
        <tr>
            <th>id</th>
            <th>login</th>
            <th>name</th>
            <th>email</th>
            <th>role</th>
        </tr>
        <c:forEach items="${users}" var="user">
            <tr>
                <td>${user.id}</td>
                <td>${user.login}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>
                    <c:forEach items="${user.role}" var="role">
                        ${role.toString()}
                    </c:forEach>
                </td>
                <td>
                    <button onclick="location.href='/admin/edit?id=${user.id}'">Edit user</button>
                </td>
                <td>
                    <button onclick="location.href='/admin/delete?id=${user.id}'">Delete user</button>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
