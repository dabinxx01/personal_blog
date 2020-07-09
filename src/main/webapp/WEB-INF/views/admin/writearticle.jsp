<%--
  Created by IntelliJ IDEA.
  User: ZhongBin
  Date: 2020/6/18
  Time: 17:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>发布文章</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="https://www.layuicdn.com/layui-v2.5.6/css/layui.css">
    <script src="https://www.layuicdn.com/layui-v2.5.6/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="editor.md-master/css/editormd.css" />
    <script src="https://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="editor.md-master/editormd.js"></script>
    <script src="static/js/paste-upload-img.js" type="text/javascript"></script>
    <style type="text/css">
        *{
            margin: 0;
            padding: 0;
        }
        .title-input{
            width: 100%;
            padding: 20px;
            text-align: center;
        }
        .title-input .articleTitle{
            padding:0 150px 0 20px;
            border: 1px solid #aaa;
            border-radius:10px ;
            height: 80px;
            line-height: 80px;
            font-size: 40px;
            font-weight:bold ;
            font-family: "等线";
            outline: none;
            color:#111;
            width: 100%;
        }
        .title-box{
            position: relative;
            width: 80%;
        }
        #wordnumber{
            position: absolute;
            right:20px;
            top:0;
            height:80px;
            line-height: 80px;
            font-family: "等线";
            color:#aaa;
            color:rgb(215,50,50);
            font-size: 40px;
        }
    </style>
</head>
<body>

<form method="post" id="article-add-form" action="publicArticle">
    <div id="article-kind-layer" style="display: none; padding: 20px">
        <div id="article-kind-form" class="layui-form layui-form-pane">
            <div class="layui-form-item">
                <label class="layui-form-label">文章标题</label>
                <div class="layui-input-block">
                    <input type="text" name="title" id="title" class="layui-input" lay-verify="required" maxlength="100">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">文章类别</label>
                <div class="layui-input-inline">
                    <select name="category" lay-verify="required" lay-search="">
                        <option value="001">选择或搜索</option>
                        <c:forEach items="${categories}" var="category">
                            <option value='<c:out value="${category.id}"></c:out>'><c:out value="${category.name}"></c:out></option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">是否公开</label>
                <div class="layui-input-block">
                    <input type="radio" name="ispublic" value="true" title="公开" checked>
                    <input type="radio" name="ispublic" value="false" title="私密">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn"  lay-submit id="article-kind-submit-btn"
                            lay-filter="add-article-form-submit" type="submit">确认发布文章</button>
                </div>
            </div>
        </div>
    </div>
<div class="title-input">
    <div style="display: inline-block;" class="title-box">
        <label id="wordnumber">0/100</label>
        <input type="text" name="titleInput" id="titleInput" placeholder="你的文章标题" maxlength="100" class="articleTitle">

    </div>
    <input type="button" value="发布文章"
           style=" height: 60px;border-radius: 10px;" id="article-kind-btn" class="layui-btn layui-btn-lg">
</div>
<div id="test-editor">
    <textarea style="display:none;" lay-verify="required" name="detail"></textarea>
</div>

    <script type="text/javascript">
        $(document).ready(function() {
            $("#titleInput").bind({
                copy : function(){
                    $("#title").val($("#titleInput").val());
                    getInputLength();
                },
                paste : function(){
                    $("#title").val($("#titleInput").val());
                    getInputLength();
                },
                cut : function(){
                    $("#title").val($("#titleInput").val());
                    getInputLength();
                }
            });
            $("#titleInput").keyup(function(){
                $("#title").val($("#titleInput").val());
                getInputLength();
            });
            $("#title").bind({
                copy : function(){
                    $("#titleInput").val($("#title").val());
                    getInputLength();
                },
                paste : function(){
                    $("#titleInput").val($("#title").val());
                    getInputLength();
                },
                cut : function(){
                    $("#titleInput").val($("#title").val());
                    getInputLength();
                }
            });
            $("#title").keyup(function(){
                $("#titleInput").val($("#title").val());
                getInputLength();
            });
        });

        function getInputLength(obj)
        {
            if($("#title").val().toString().length==100) $("#title").css("border","1px solid red");
            else $("#title").css("border","1px solid #ccc");;
            if($("#titleInput").val().toString().length==100) $("#titleInput").css("border","1px solid red");
            else $("#titleInput").css("border","1px solid #ccc");
            document.getElementById("wordnumber").innerHTML =$("#title").val().toString().length + "/100";
        }
    </script>
<script type="text/javascript">

    $(function() {
        var editor = editormd("test-editor", {
            // width  : "100%",
            // height : "100%",
            emoji: true,
            path   : "editor.md-master/lib/",
            theme : "dark",
            imageUpload : true,
            imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL : "uploadArticleImage",
            toolbarAutoFixed : false,
            previewTheme: "dark",
            editorTheme: "pastel-on-dark",
            saveHTMLToTextarea: true,
            searchReplace : true,
            placeholder:'在此编写您的博客文章。。。',
            markdown: "",
            onload : function() {
                initPasteDragImg(this); //必须
            }
        });
    });
    layui.use('table', function() {
        var $1 = layui.$;
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;

        // 显示弹出层
        $1('#article-kind-btn').click(function() {
            // 每次显示前重置表单
            layer.open({
                type: 1,
                title: '文章设置',
                skin: 'layui-layer-molv',
                area: ['500px'],
                content: $1('#article-kind-layer')
            });
        });
    })
</script>
</form>
</body>
</html>
