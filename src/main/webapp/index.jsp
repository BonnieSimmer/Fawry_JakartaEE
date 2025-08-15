<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="error.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>User Management Application</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark"
             style="background-color: #9495ff">
            <div>
                <a href="<%=request.getContextPath()%>/" class="navbar-brand">Product Management Web Application</a>
            </div>
            <ul class="navbar-nav">
                <li><a href="<%=request.getContextPath()%>/" class="nav-link">Products</a></li>
            </ul>
        </nav>
    </header>
    <br>
    <div class="row">
    <div class="container">
        <h3 class="text-center">List of Products</h3>
        <hr>
        <div class="container d-flex justify-content-end">
            <a href="<%=request.getContextPath()%>/add" class="btn btn-success" style="background-color: #9495ff">Add Product</a>
        </div>
        <br>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <%--@elvariable id="products" type="com.fawry.StoreManager.Product"--%>
            <c:forEach var="product" items="${products}">

                <tr>
                    <td><c:out value="${product.id}" /></td>
                    <td><c:out value="${product.name}" /></td>
                    <td><c:out value="${product.price}" /></td>
                    <td><c:out value="${product.quantity}" /></td>
                    <td>
                        <a href="update?id=<c:out value='${product.id}' />">Update</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="delete?id=<c:out value='${product.id}' />">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>

        </table>
    </div>
</div>
</body>
</html>