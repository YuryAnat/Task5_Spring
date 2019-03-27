<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel='stylesheet' href='webjars/bootstrap/4.3.1/css/bootstrap.min.css'>
</head>
<body style="background: ghostwhite">

<div class="container">
    <div class="row justify-content-center">
        <div class="col-4">
            <br><br><br>
            <h3 class="form-text">Please sign in</h3>
            <form method="post">
                <input name="username" class="form-control input-group-lg text" type="text" placeholder="Login">
                <input name="password" class="form-control input-group-lg password-field" type="password" placeholder="Password">
                <button type="submit" name="login" class="btn-primary btn btn-block btn-lg">Log-in</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>