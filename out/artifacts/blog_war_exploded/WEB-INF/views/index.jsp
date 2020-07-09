<%--
  Created by IntelliJ IDEA.
  User: ZhongBin
  Date: 2020/6/21
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>DBXX.BLOG.COM博客主页</title><meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
    <style>
        html,
        body {
            background-color: rgb(245, 246, 247);
        }

        .centent-head {
            width: 1200px;
            height: 80px;
            margin: 0 auto;
            background: rgb(50, 50, 50);
        }

        .centent-body {
            width: 1200px;
            margin: 10px auto;
            padding: 0;
            vertical-align: top;
        }

        .left-nav {
            width: 10%;
            margin-left: 0;
            margin-top: 0;
            background-color: #fff;
            display: inline-block;
            vertical-align: top;
        }

        .nav-pills .active a {
            border-radius: 0;
            background-color: rgb(20, 20, 20);
        }

        .nav-pills>li.active>a,
        .nav-pills>li.active>a:focus,
        .nav-pills>li.active>a:hover {
            border-radius: 0;
            background-color: rgb(20, 20, 20);
            color: #fff;
        }

        .nav-stacked>li+li {
            margin-top: 0;
        }

        .nav-pills li {
            margin: 0;
            padding: 0;
            text-align: center;
        }

        .nav-pills li a {
            margin: 0;
            color: rgb(20, 20, 20);
            text-align: center;
        }

        .nav-pills li a:hover,
        .nav-pills li a:focus {
            border-radius: 0;
            background-color: rgb(20, 20, 20);
            color: #fff;
        }

        .center-nav {
            width: 74%;
            display: inline-block;
            background-color: rgb(250, 250, 250);
            height: auto;
            border: 1px solid rgb(245,246,247);
            vertical-align: top;
        }
        .center-nav .category-items-list {
            width: 90%;
            margin: 20px auto;
        }
        .center-nav .category-items-list h3{
            display: block;
            width: 100%;
            height: 50px;
            line-height: 50px;
            color: #222;
            padding-left: 40px;
            background-color: #fff;
            border:1px solid rgb(245,246,247);
            border-left: 8px solid #333;
            margin:20px 0;
            border-radius: 0 5px 5px 0;
        }
        .center-nav .category-items-list ul li {
            display: block;
            list-style: none;
            color:#666;
            background-color: #fff;
            padding-left: 40px;
        }
        .center-nav .category-items-list ul li+li{
            border-top:1px solid rgb(245,246,247) ;
        }
        .center-nav .category-items-list ul li:hover{
            background-color: rgb(240,241,242);
        }
        .center-nav .category-items-list ul li .category-items-title {
            display: block;
            height:40px;
            line-height: 40px;
            width: 100%;
        }

        .center-nav .category-items-list ul li .category-items-title a {
            color: #333;
            font-size: 20px;
            font-weight: bold;
        }
        .center-nav .category-items-list ul li .category-items-title a:hover,
        .center-nav .category-items-list ul li .category-items-title a:active{
            text-decoration: none;
        }
        .right-nav {
            width: 15%;
            display: inline-block;
            background-color: #fff;
            height: 1000px;
            border: 1px solid rgb(245,246,247);
            vertical-align: top;
        }
    </style>
</head>

<body>
<%--<div class="centent-head"></div>--%>
<div class="centent-body">
    <div class="left-nav">
        <ul class="nav nav-pills nav-stacked">
            <li><a href='#'>推荐</a></li>
            <c:forEach items="${categoryList}" var="category">
                <li><a href='#go<c:out value="${category.id}"></c:out>'><c:out value="${category.name}"></c:out></a></li>
            </c:forEach>
        </ul>
    </div>
    <div class="center-nav">
        <div id="firstlist" class="category-items-list">
            <h3>推荐</h3>
            <ul>
                <li>
                    <span class="category-items-title"><a href="#">没有内容</a></span>
                    <span>发布时间：2020-01-01 08:05</span>
                    <span>浏览量：0</span>
                </li>
            </ul>
        </div>
        <c:forEach items="${categoryList}" var="category">
            <div id='go<c:out value="${category.id}"></c:out>' class="category-items-list">
                <h3><c:out value="${category.name}"></c:out></h3>
                <ul>
                    <c:forEach items="${articleList}" var="article">

                        <c:if test="${category.id == article.categoryid}">
                            <li>
                                <a href='articledetail?id=<c:out value="${article.id}"></c:out>'></a>
                                <span class="category-items-title">
                                    <a href='articledetail?id=<c:out value="${article.id}"></c:out>'><c:out value="${article.title}"></c:out></a>
                                </span>
                                <span style="display: inline-block;margin-right: 40px;">发布时间：<c:out value="${article.creattime}"></c:out></span>
                                <span style="display: inline-block;margin-right: 40px;">浏览量：<c:out value="${article.looktimes}"></c:out></span>
                             </li>
                        </c:if>

                    </c:forEach>
                </ul>
            </div>
        </c:forEach>
    </div>
    <div class="right-nav">

    </div>
</div>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
</body>
</html>
