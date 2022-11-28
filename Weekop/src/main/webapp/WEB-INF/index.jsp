<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Weekop</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/styles.css" type="text/css" rel="stylesheet">
</head>

<body>

<nav class = "navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <a href="#" class="navbar-brand">Weekop</a>

        <button class="navbar-toggle" data-toggle="collapse" data-target=".navHeaderCollapse">
            <span class="glyphicon glyphicon-list"></span>
        </button>

        <div class="collapse navbar-collapse navHeaderCollapse">
            <ul class="nav navbar-nav navbar-right">
                <li class="active"><a href="#">Główna</a></li>
                <li><a href="${pageContext.request.contextPath}/add">Dodaj</a></li>
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <li><a href="${pageContext.request.contextPath}/logout">Wyloguj się</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="${pageContext.request.contextPath}/login">Zaloguj się</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>

    </div>
</nav>

<c:if test="${not empty requestScope.discoveries}">
    <c:forEach var="discovery" items="${requestScope.discoveries}">
        <div class="container">
            <div class="row bs-callout bs-callout-primary">
                <div class="col col-md-1 col-sm-2">
                    <a href="${pageContext.request.contextPath}/vote?discovery_id=${discovery.id}&vote=VOTE_UP" class="btn btn-block btn-primary btn-success">
                        <span class="glyphicon glyphicon-arrow-up"></span>  </a>
                    <div class="well well-sm centered"><c:out value="${discovery.upVote - discovery.downVote}" /></div>
                    <a href="${pageContext.request.contextPath}/vote?discovery_id=${discovery.id}&vote=VOTE_DOWN" class="btn btn-block btn-primary btn-warning">
                        <span class="glyphicon glyphicon-arrow-down"></span>  </a>
                </div>
                <div class="col col-md-11 col-sm-10">
                    <h3 class="centered"><a href="<c:out value="${discovery.url}" />"><c:out value="${discovery.name}" /></a></h3>
                    <h6><small>Dodane przez: <c:out value="${discovery.user.username}" />,
                        Dnia: <fmt:formatDate value="${discovery.timestamp}" pattern="dd/MM/YYYY"/></small></h6>
                    <p><c:out value="${discovery.description}" /></p>
                    <a href="<c:out value="${discovery.url}" />" class="btn btn-default btn-xs">Przejdź do strony</a>
                </div>
            </div>
        </div>
    </c:forEach>
</c:if>

<footer class="footer">
    <div class="container">
        <p class="navbar-text">Weekop - developed by <a href="http://javastart.pl">JavaStart.pl</a></p>
    </div>
</footer>

<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="../resources/js/bootstrap.js"></script>
</body>
</html>