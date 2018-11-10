﻿<%@ page language="java" session="false" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh" class="no-js">
<head>
    <meta charset="utf-8"/>
    <c:set var="webs" value="${init.webSite}" scope="request"></c:set>
    <title><c:if test="${not empty requestScope.log.title}">${requestScope.log.title} - </c:if>${webs.title}
        - ${webs.second_title}</title>
    <link rel="shortcut icon" type="image/x-icon" href="${rurl}favicon.ico"/>
    <meta name="description" content="${webs.description}"/>
    <c:choose>
        <c:when test="${empty requestScope.log or empty requestScope.log.keywords}">
            <meta name="keywords" content="${webs.keywords}"/>
        </c:when>
        <c:otherwise>
            <meta name="keywords" content="${requestScope.log.keywords}"/>
        </c:otherwise>
    </c:choose>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
    <link rel="shortcut icon" href="${rurl }/favicon.ico"/>
    <link rel="stylesheet" type="text/css" media="screen" href="${url}/css/common.css"/>
    <link rel="stylesheet" type="text/css" media="screen" href="${url}/css/editormd.css"/>
    <link rel="stylesheet" type="text/css" media="screen" href="${url}/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" media="screen" href="${url}/css/style.css"/>

    <script src="${url}/js/jquery-1.10.2.min.js"></script>
    <script src="${url}/js/bootstrap.min.js"></script>
    <style>
        .bg-light {
            font-size: 18px;
        }
        .nav-item {
            padding-right: 20px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="#" href="${rurl}"><c:if test="${not empty _res.navBarBrand}">
            <b>${_res.navBarBrand}</b>
        </c:if></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <c:forEach var="lognav" items="${init.logNavs}">
                    <c:choose>
                        <c:when test="${lognav.current}">
                            <li class="nav-item active">
                                <a class="nav-link" href="${lognav.url}">${lognav.navName} </a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item">
                                <a href="${lognav.url}" class="nav-link">${lognav.navName}</a>
                            </li>
                            <li></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </ul>
        </div>
    </div>
</nav>
<div class="main clearfloat" style="padding-top: 20px">
    <section>
        <jsp:include page="update_browser.jsp"/>
