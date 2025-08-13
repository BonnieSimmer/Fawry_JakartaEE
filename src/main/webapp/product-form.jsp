<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  errorPage="error.jsp" %>
<html>
<head>
    <title>Add Product</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark"
             style="background-color: #cbccff">
            <div>
                <a href="index.jsp" class="navbar-brand">Product Management Web Application</a>
            </div>
            <ul class="navbar-nav">
                <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Products</a></li>
            </ul>
        </nav>
    </header>
    <br>
    <div class="container col-md-5">
        <div class="card">
            <div class="card-body">
                <c:if test="${product != null}">
                    <form action="edit" method="post">
                </c:if>
                <c:if test="${product == null}">
                    <form action="insert" method="post">
                </c:if>
                <caption>
                    <h2>
                        <c:if test="${product != null}">
                            Update Product
                        </c:if>
                        <c:if test="${product == null}">
                            Add Product
                        </c:if>
                    </h2>
                </caption>
                <c:if test="${product != null}">
                    <input type="hidden" name="id" value="${product.id}">
                </c:if>
                <fieldset class="form-group">
                    <label for="name">
                        Name
                        <input type="text" class="form-control" name="name" required="required" value="<c:out value='${product.name}' />">
                    </label>
                </fieldset>
                <fieldset class="form-group">
                    <label for="price">
                        Price
                        <input type="number" class="form-control" name="price" required="required" value="<c:out value="${product.price}" />">
                    </label>
                </fieldset>
                <fieldset class="form-group">
                   <label for="quantity">
                        Quantity
                        <input type="number" class="form-control" name="quantity" required="required" value="<c:out value="${product.quantity}" />">
                   </label>
                </fieldset>
                <button type="submit" class="btn btn-success">Submit</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
