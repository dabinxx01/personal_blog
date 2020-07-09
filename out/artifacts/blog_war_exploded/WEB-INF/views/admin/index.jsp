<%--
  Created by IntelliJ IDEA.
  User: ZhongBin
  Date: 2020/6/17
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="https://www.layuicdn.com/layui-v2.5.6/css/layui.css">
    <script src="https://www.layuicdn.com/layui-v2.5.6/layui.js" charset="utf-8"></script>
    <style type="text/css">
        .kit-side-fold{
            text-align:center;
            padding: 10px;
        }
        .kit-side-fold:hover{
            background-color: rgb(78,84,101);
        }
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">后台管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="#">控制台</a></li>
            <li class="layui-nav-item"><a href="articlemanage" target="body-iframe">文章管理</a></li>
            <li class="layui-nav-item"><a href="usermanage" target="body-iframe">用户管理</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    root
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="adminlogin">退出系统</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <div title="菜单缩放" class="kit-side-fold"><i id="show-hide-btn" class="layui-icon layui-icon-shrink-right" aria-hidden="true"></i></div>
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;"><i class="layui-icon layui-icon-file-b"></i>&nbsp;&nbsp;我的博客</a>
                    <dl class="layui-nav-child">
                        <dd><a href="editArticle" target="body-iframe"><i class="layui-icon layui-icon-edit"></i>&nbsp;&nbsp;发布文章</a></dd>
                        <dd><a href="articlemanage" target="body-iframe"><i class="layui-icon layui-icon-table"></i>&nbsp;&nbsp;文章管理</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="categorymanage" target="body-iframe"><i class="layui-icon layui-icon-templeate-1"></i>&nbsp;&nbsp;类别管理</a></li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="layui-icon layui-icon-reply-fill"></i>&nbsp;&nbsp;用户评论</a>
                    <dl class="layui-nav-child">
<%--                        <dd><a href="javascript:;" target="body-iframe">最新评论</a></dd>--%>
                        <dd><a href="javascript:;" target="body-iframe"><i class="layui-icon layui-icon-table"></i>&nbsp;&nbsp;评论管理</a></dd>
<%--                        <dd><a href="javascript:;" target="body-iframe">评论审核</a></dd>--%>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="layui-icon layui-icon-user"></i>&nbsp;&nbsp;用户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="usermanage" target="body-iframe"><i class="layui-icon layui-icon-table"></i>&nbsp;&nbsp;我的用户</a></dd>
<%--                        <dd><a href="javascript:;" target="body-iframe">在线用户</a></dd>--%>
<%--                        <dd><a href="javascript:;" target="body-iframe">用户操作记录</a></dd>--%>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="layui-icon layui-icon-set"></i>&nbsp;&nbsp;系统管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="adminmanage" target="body-iframe"><i class="layui-icon layui-icon-user"></i>&nbsp;&nbsp;管理员管理</a></dd>
<%--                        <dd><a href="javascript:;" target="body-iframe">网站维护</a></dd>--%>
<%--                        <dd><a href="javascript:;" target="body-iframe">网站访问量报表</a></dd>--%>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="javascript:;" target="body-iframe"><i class="layui-icon layui-icon-picture"></i>&nbsp;&nbsp;头像管理</a></li>
                <li class="layui-nav-item"><a href="userindex"><i class="layui-icon layui-icon-layouts"></i>&nbsp;&nbsp;前台测试</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <iframe src="test" height="100%" width="100%" scrolling="auto" frameborder="0" name="body-iframe">内容主体区域</iframe>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        <div align="center">© blog.com - 底部固定区域</div>
    </div>
</div>
<script>
    var isShow = true;  //定义一个标志位
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
        var $=layui.$;
        $('.kit-side-fold').click(function(){
            //选择出所有的span，并判断是不是hidden
            $('.layui-nav-item span').each(function(){
                if($(this).is(':hidden')){
                    $(this).show();
                }else{
                    $(this).hide();
                }
            });
            //判断isshow的状态
            if(isShow){
                $('.layui-side.layui-bg-black').width(40); //设置宽度
                $('.kit-side-fold').width(40)
                //将footer和body的宽度修改
                $('.layui-body').css('left', 40+'px');
                $('.layui-footer').css('left', 40+'px');
                //将二级导航栏隐藏
                $('dd span').each(function(){
                    $(this).hide();
                });
                //修改标志位
                isShow =false;
                $("show-hide-btn").removeClass("ayui-icon-shrink-right");
                $("show-hide-btn").addClass("ayui-icon-shrink-left");
            }else{
                $('.layui-side.layui-bg-black').width(200);
                $('.kit-side-fold').width(200)
                $('.layui-body').css('left', 200+'px');
                $('.layui-footer').css('left', 200+'px');
                $('dd span').each(function(){
                    $(this).show();
                });
                isShow =true;
                $("show-hide-btn").removeClass("ayui-icon-shrink-left");
                $("show-hide-btn").addClass("ayui-icon-shrink-right");
            }
        });
    });


</script>
</body>

</html>
