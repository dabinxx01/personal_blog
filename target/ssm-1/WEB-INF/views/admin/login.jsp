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
    <title>后台登录</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="https://www.layuicdn.com/layui-v2.5.6/css/layui.css">
    <script src="https://www.layuicdn.com/layui-v2.5.6/layui.js" charset="utf-8"></script>
    <style type="text/css">
        *{
            padding: 0;
            margin: 0;
        }
        html,body{
            width: 100%;
            height: 100%;
        }
        .bg{
            width: 100%;
            height: 100%;
            background: #fff;
        }
        .login-panel{
            width: 300px;
            margin: 100px auto;
            box-shadow: #bbb 0 0 20px;
            padding:30px;
        }
    </style>
</head>


<body>
<div class="bg">
    <div class="login-panel layui-form" >
        <div style="text-align: center;margin:0px auto 20px;"><h2>个人博客后台系统</h2></div>
        <form class="layui-form layui-form-pane" action="adminindex" method="post">
            <div class="layui-form-item">
                <label class="layui-form-label">用户</label>
                <div class="layui-input-block">
                    <input type="text" name="loginusername" autocomplete="off"
                           lay-verify="required" lay-reqtext="账号或邮箱登录，不能为空值？"
                           value='<%=request.getAttribute("username")==null? "": request.getAttribute("username")%>'
                           autocomplete="off" placeholder="请输入登录账号或邮箱" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-block">
                    <input type="password" name="loginpassword" autocomplete="off"
                           lay-verify="required" lay-verify="pass" lay-reqtext="请输入密码"
                           placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div style="width: 216px; margin: 20px auto;">
                <button type="submit" class="layui-btn layui-btn-fluid" lay-submit="" lay-filter="demo1">登录</button>
            </div>
        </form>
    </div>
</div>
<script>
    window.onload=function (ev) {
        var msg='<%=request.getAttribute("loginmsg") %>';
        if(msg!="null")
            layer.alert(msg, {
                        title: '登录错误信息'
                    });

    }
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        //自定义验证规则
        form.verify({
            title: function(value){
                if(value.length < 5){
                    return '标题至少得5个字符啊';
                }
            }
            ,pass: [
                /^[\S]{6,16}$/
                ,'密码必须6到12位，且不能出现空格'
            ]
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });

        //监听指定开关
        form.on('switch(switchTest)', function(data){
            layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
                offset: '6px'
            });
            layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
        });

        //监听提交
        // form.on('submit(demo1)', function(data){
        //     layer.alert(JSON.stringify(data.field), {
        //         title: '最终的提交信息'
        //     })
        //     return false;
        // });



        //表单取值
        layui.$('#LAY-component-form-getval').on('click', function(){
            var data = form.val('example');
            alert(JSON.stringify(data));
        });

    });
</script>
</body>
</html>
