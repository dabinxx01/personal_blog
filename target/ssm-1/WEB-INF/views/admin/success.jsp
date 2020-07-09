
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>success</title>
    <link rel="stylesheet" href="editor.md-master/css/editormd.css" />
    <script src="editor.md-master/examples/js/jquery.min.js"></script>
    <script src="editor.md-master/editormd.js"></script>
    <link rel="stylesheet" href="editor.md-master/examples/css/style.css" />
    <link rel="stylesheet" href="editor.md-master/css/editormd.preview.css" />

    <!--引入js文件-->

    <script src="editor.md-master/lib/marked.min.js"></script>
    <script src="editor.md-master/lib/prettify.min.js"></script>
    <script src="editor.md-master/lib/raphael.min.js"></script>
    <script src="editor.md-master/lib/underscore.min.js"></script>
    <script src="editor.md-master/lib/sequence-diagram.min.js"></script>
    <script src="editor.md-master/lib/flowchart.min.js"></script>
    <script src="editor.md-master/lib/jquery.flowchart.min.js"></script>
    <script src="editor.md-master/editormd.js"></script>
</head>
<body>
<script>
    $(function() {
        var editors = editormd.markdownToHTML("markdown-view", {
            htmlDecode: "style,script,iframe", //可以过滤标签解码
            emoji: true,
            taskList: true,
            tex: true,               // 默认不解析
            flowChart: true,         // 默认不解析
            sequenceDiagram: true,  // 默认不解析
        });
        testEditor.config({
            tocContainer  : "#custom-toc-container",
            tocDropdown   : true,
            tocTitle      : "目录",
        });
    })

</script>

<h2 align="center" style="text-align: center"><c:out value="${article.title}"></c:out></h2>
<div class="markdown-body editormd-preview-container" id="custom-toc-container" previewcontainer="false">
</div>
<div id="markdown-view">
    <textarea id="markdownView" style="display:none;"><c:out value="${article.detail}"></c:out></textarea>
</div>

</body>
</html>