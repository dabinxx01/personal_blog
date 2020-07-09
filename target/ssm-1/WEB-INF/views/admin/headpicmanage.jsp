<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: ZhongBin
  Date: 2020/6/19
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户可用头像管理</title>
    <link rel="stylesheet" href="https://www.layuicdn.com/layui-v2.5.6/css/layui.css">
    <script src="https://www.layuicdn.com/layui-v2.5.6/layui.js" charset="utf-8"></script>
    <style type="text/css">
        .preimg {
            height: 100px;
            display: inline-block;
        }
    </style>
</head>
<link rel="stylesheet" href="https://www.layuicdn.com/layui/css/layui.css">
<script src="https://www.layuicdn.com/layui/layui.js" charset="utf-8"></script>
<body>
<button type="button" class="layui-btn" id="pic-upload-btn">
    <i class="layui-icon">&#xe67c;</i>上传图片
</button>
<script>
    layui.use('upload', function(){
        var upload = layui.upload;

        //执行实例
        var uploadInst = upload.render({
            elem: '#pic-upload-btn' //绑定元素
            ,url: 'upload' //上传接口
            ,method:'POST'
            ,accept:'images'
            ,done: function(res){
                //上传完毕回调
            }
            ,error: function(){
                //请求异常回调

            }
            ,choose: function(obj){
            //将每次选择的文件追加到文件队列
                var files = obj.pushFile();

                //预读本地文件，如果是多文件，则会遍历。(不支持ie8/9)
                obj.preview(function(index, file, result){
                    console.log(index); //得到文件索引
                    console.log(file); //得到文件对象
                    console.log(result); //得到文件base64编码，比如图片
                    document.getElementById("previewImg").innerHTML+="<img src='"+result+"' class='preimg'/>";

                    //obj.resetFile(index, file, '123.jpg'); //重命名文件名，layui 2.3.0 开始新增

                    //这里还可以做一些 append 文件列表 DOM 的操作

                    //obj.upload(index, file); //对上传失败的单个文件重新上传，一般在某个事件中使用
                    //delete files[index]; //删除列表中对应的文件，一般在某个事件中使用
                });
            }
        });
    });
</script>
<div id="previewImg">

</div>
<label for="001"><img src="images\userHeadImg\QQ图片20200523180521.jpg"/></label>
<input type="checkbox" id="001">
</body>
</html>
