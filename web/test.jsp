<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <title>Bootstrap, from Twitter</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <!-- Le styles -->
    <link rel='stylesheet' href='webjars/bootstrap/4.3.1/css/bootstrap.min.css'>

    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">--%>
    <style>
    </style>
</head>

<body>
<div class="container">


    <div id="content">
        <ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
            <li class="active"><a href="#red" data-toggle="tab">Red</a>
            </li>
            <li><a href="#orange" data-toggle="tab">Orange</a>
            </li>
            <li><a href="#yellow" data-toggle="tab">Yellow</a>
            </li>
            <li><a href="#green" data-toggle="tab">Green</a>
            </li>
            <li><a href="#blue" data-toggle="tab">Blue</a>
            </li>
        </ul>
    </div>
    <div id="my-tab-content" class="tab-content">
        <div class="tab-pane active" id="red">
            <h1>Red</h1>
            <p>red red red red red red</p>
        </div>
        <div class="tab-pane" id="orange">
            <h1>Orange</h1>
            <p>orange orange orange orange orange</p>
        </div>
        <div class="tab-pane" id="yellow">
            <h1>Yellow</h1>
            <p>yellow yellow yellow yellow yellow</p>
        </div>
        <div class="tab-pane" id="green">
            <h1>Green</h1>
            <p>green green green green green</p>
        </div>
        <div class="tab-pane" id="blue">
            <h1>Blue</h1>
            <p>blue blue blue blue blue</p>
        </div>
    </div>
</div>

<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<%--<script src="webjars/jquery/3.3.1/jquery.js"></script>--%>
<%--<script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>--%>

</body>

</html>