<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage = "true" %>
<html>
<head>
    <title>Error</title>
</head>
<body>
    <h1> Exception caught</h1>
    <h2>The exception is : <%= exception %></h2>
    <h3>Message : <%= exception.getMessage() %></h3>
</body>
</html>
