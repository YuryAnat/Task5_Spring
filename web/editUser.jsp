<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Edit user</title>
</head>
<body>
<div>
    <c:if test="${not empty status}">
        <c:out value="${status}"/>
        <br>
    </c:if>
</div>
<div>
    <form method="post">
            <br>
            <label>Login name</label>
            <input name="login" value="${user.login}" type="text">
            <br>
            <label>Password</label>
            <input name="password" value="${user.password}" type="password">
            <br>
            <label>Confirm password</label>
            <input name="confPassword" value="${user.password}" type="password">
            <br>
            <label>Nick name</label>
            <input name="name" value="${user.name}" type="text">
            <br>
            <label>eMail</label>
            <input name="email" value="${user.email}" type="email">
            <br>
            <label>Role</label>
            <select name="role">
                <option selected value ="user">user</option>
                <option value="admin">admin</option>
            </select>
            <br>
        <div>
            <button type="submit" name="edit">Edit user</button>
        </div>
        <div>
            <button onclick="location.href='/admin'">Cancel</button>
        </div>
    </form>
</div>
</body>
</html>
