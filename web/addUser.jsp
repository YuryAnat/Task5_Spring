<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Add new user</title>
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
            <label>Login name</label>
            <input name="login" value="" type="text">
        <br>
            <label>Password</label>
            <input name="password" value="" type="password">
        <br>
            <label>Confirm password</label>
            <input name="confPassword" value="" type="password">
        <br>
            <label>Nick name</label>
            <input name="name" value="" type="text">
        <br>
            <label>eMail</label>
            <input name="email" value="" type="email">
        <br>
            <label>Role</label>
            <select name="role">
                <option selected value="user">user</option>
                <option value="admin">admin</option>
            </select>
        <br>
        <div>
            <button type="submit" name="add">Add user</button>
        </div>
        <div>
            <button onclick="location.href='/admin'">Cancel</button>
        </div>
    </form>
</div>
</body>
</html>
